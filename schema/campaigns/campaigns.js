import { graphql, group, list } from "@keystone-6/core";
import {
  image,
  relationship,
  text,
  virtual,
  integer,
} from "@keystone-6/core/fields";
import crypto from "crypto";

import { superuserOrPermission } from "../accessUtils.js";
import {
  regionalMetadata,
  uiCreateSidebar,
  timeTrackingFields,
  priorityField,
} from "../common.js";
import { getFundist } from "./utils.js";

const superuserOrPermissionAdGroup = ({ session }) =>
  superuserOrPermission({ session, listKey: "AdGroup" });

const adGroupAccess = {
  access: {
    operation: {
      create: superuserOrPermissionAdGroup,
      update: superuserOrPermissionAdGroup,
      delete: superuserOrPermissionAdGroup,
    },
  },
};

function createAd(key) {
  return list({
    fields: {
      image: image({
        storage: "images",
        validation: { isRequired: true },
      }),
      mobileImage: image({
        storage: "images",
      }),
      link: relationship({ ref: "AdGroup." + key }),
    },
    ui: { isHidden: true },
    ...adGroupAccess,
  });
}

function createAdRelationship(prefix, description) {
  return relationship({
    ref: prefix + "Ad.link",
    ui: {
      ...(description ? { description: description } : {}),
      createView: { fieldMode: "edit" },
      displayMode: "cards",
      cardFields: ["image", "mobileImage"],
      inlineEdit: { fields: ["image", "mobileImage"] },
      inlineCreate: { fields: ["image", "mobileImage"] },
    },
  });
}

const campaignUI = {
    createView: { defaultFieldMode: "hidden" },
  },
  campaignMetadata = (listKey) => {
    return {
      tag: text({
        ui: {
          description:
            listKey + " will not be shown if the user has any of these tags.",
          createView: { fieldMode: "edit" },
        },
      }),
      ...timeTrackingFields,
      ...priorityField,
      ...regionalMetadata(),
    };
  };

export const campaignAccess = {
  access: {
    operation: {
      create: superuserOrPermission,
      update: ({ context, session, listKey }) => {
        // console.log("FUNDIST UPDATE REQ ORIGIN" + context.req.get("origin"));

        return (
          superuserOrPermission({ session, listKey }) ||
          context.req.get("keystone-authorization") ===
            process.env.API_KEY_CUSTOM
        );
      },
      delete: superuserOrPermission,
    },
  },
};

export default {
  PopupAd: createAd("popupAd"),
  BannerAd: createAd("bannerAd"),
  ContentAd: createAd("contentAd"),
  SidebarAd: createAd("sidebarAd"),
  Embed: list({
    fields: {
      label: text({
        ui: {
          description: "A unique name for this embed.",
          ...uiCreateSidebar,
        },
        validation: { isRequired: true },
      }),
      ...group({
        label: "Fundist",
        description: "Create or select a Fundist form to be embedded.",
        fields: {
          fundistDonation: relationship({
            ref: "FundistDonation",
            label: "Donation Fundist",
            ui: {
              createView: { fieldMode: "edit" },
              // labelField: "trackingCode",
            },
          }),
          fundistSignup: relationship({
            ref: "FundistSignup",
            label: "Signup / Petition Fundist",
            ui: {
              createView: { fieldMode: "edit" },
              // labelField: "trackingCode",
            },
          }),
          fundistBasic: relationship({
            ref: "FundistBasic",
            label: "Basic Fundist",
            ui: {
              createView: { fieldMode: "edit" },
              // labelField: "trackingCode",
            },
          }),
        },
      }),
      fundistHostedURL: virtual({
        field: graphql.field({
          type: graphql.String,
          async resolve(item, args, context) {
            const [, fundist] = await getFundist(item, context, `url`);

            if (fundist) return fundist.url;

            if (item.code) return "Not applicable";

            return "No Fundist selected";
          },
        }),
        ui: {
          createView: { fieldMode: "hidden" },
          itemView: { fieldMode: "hidden" },
        },
      }),
      rawCode: text({
        label: "Code",
        ui: {
          description:
            "IMPORTANT: This code will be injected directly onto the website - ONLY include code from trusted sources. Overrides Fundist.",
          displayMode: "textarea",
          createView: { fieldMode: "edit" },
        },
      }),
      code: virtual({
        field: graphql.field({
          type: graphql.String,
          async resolve(item, args, context) {
            let fundist;
            let fundistType;

            if (item.rawCode) {
              const embedSrc = item.rawCode.match(/src="(.*?)"/);

              if (embedSrc) {
                const fundistSrc = embedSrc[1];

                if (fundistSrc.includes(".herokuapp.com/form")) {
                  fundist = { url: fundistSrc };

                  if (fundist.url.includes(".herokuapp.com/form_campaign/")) {
                    fundistType = "Basic";
                  } else if (
                    fundist.url.includes(".herokuapp.com/form_signup/")
                  ) {
                    fundistType = "Signup";
                  } else if (fundist.url.includes(".herokuapp.com/form/")) {
                    fundistType = "Donation";
                  }

                  if (
                    fundist.url.includes(
                      `fundist-${process.env.PRIMARY_ORG}.herokuapp.com/`,
                    )
                  ) {
                    fundist.organization = process.env.PRIMARY_ORG;
                  } else if (
                    fundist.url.includes(
                      `fundist-${process.env.SECONDARY_ORG}.herokuapp.com/`,
                    )
                  ) {
                    fundist.organization = process.env.SECONDARY_ORG;
                  }
                }
              }
            } else {
              [fundistType, fundist] = await getFundist(
                item,
                context,
                `url organization`,
              );
            }

            if (fundist) {
              const fundistUrl = new URL(fundist.url);

              fundistUrl.searchParams.set("iframe", "1");

              if (fundistType === "Signup") {
                fundistUrl.searchParams.set("cms_embed_id", item.id);

                if (item.fundistSignupSubmissions != null) {
                  fundistUrl.searchParams.set(
                    "signatures",
                    item.fundistSignupSubmissions,
                  );
                }
              }

              // perhaps hash should be the actual hash of the query string?
              return `<iframe
                        class="fundistEmbed"
                        style="display:block;width:1px;min-width:100%;border:none;"
                        src="${fundistUrl.toString()}"
                        ${
                          fundistType === "Donation" ? 'allow="payment *"' : ""
                        }>
                      </iframe>
                      ${
                        fundistType === "Donation"
                          ? `<div class="fundistEmbedAltDonationOptions bg-slate-100 py-4 px-3 border mt-8 rounded">
                      </div>`
                          : ""
                      }`;
            }

            return item.rawCode;
          },
        }),
        ui: {
          createView: { fieldMode: "hidden" },
          itemView: { fieldMode: "hidden" },
        },
      }),
      ...campaignMetadata("Embed"),
      fundistSignupSubmissions: integer({
        label: "Submissions",
        defaultValue: 0,
        ui: {
          description:
            "If this embed is a Fundist Signup / Petition form, this attribute tracks the form's progress (number of submissions).\nFor this reason, it is important that Fundist Signup / Petition forms are only ever associated with one Embed.",
          itemView: {
            fieldPosition: "sidebar",
            fieldMode: "read",
          },
        },
      }),
    },
    hooks: {
      afterOperation: async ({ resolvedData, item, context, operation }) => {
        if (
          operation !== "delete" &&
          (
            resolvedData.fundistDonation ||
            resolvedData.fundistSignup ||
            resolvedData.fundistBasic
          )?.connect
        ) {
          const [fundistType, fundist] = await getFundist(
            item,
            context,
            `id trackingTag { id }`,
          );

          if (!fundist.trackingTag) {
            if (item.label) {
              const tag = item.label
                ?.trim()
                ?.toLowerCase()
                ?.replace(/[^\w ]+/g, "")
                ?.replace(/ +/g, "_");

              if (tag) {
                let trackingTag = await context.query[
                  fundistType + "Tag"
                ].findOne({
                  where: { tag: tag },
                  query: `id`,
                });

                if (!trackingTag) {
                  trackingTag = await context.query[
                    fundistType + "Tag"
                  ].createOne({
                    data: { tag: tag },
                    query: `id`,
                  });
                }

                await context.query["Fundist" + fundistType].updateOne({
                  where: { id: fundist.id },
                  data: { trackingTag: { connect: { id: trackingTag.id } } },
                  // query: `id`,
                });
              }
            }
          }
        }
      },
    },
    ui: {
      listView: {
        initialColumns: ["label", "tag", "regions"],
        initialSort: { field: "label", direction: "ASC" },
      },
      ...campaignUI,
    },
    ...campaignAccess,
  }),
  AdGroup: list({
    fields: {
      alt: text({
        label: "Label",
        ui: {
          description:
            "Title or brief description of the ad group (note that this will be used as the ads' `alt` text).",
          ...uiCreateSidebar,
        },
        validation: { isRequired: true },
      }),
      link: text({
        ui: {
          description: "Where the ads link to.",
          createView: { fieldMode: "edit" },
        },
      }),
      ...campaignMetadata("The ads"),
      popupAd: createAdRelationship("Popup"),
      bannerAd: createAdRelationship(
        "Banner",
        "Displayed below the top nav and above the footer as well as above subsections.",
      ),
      contentAd: createAdRelationship(
        "Content",
        "Displayed above and below page Content sections.",
      ),
      sidebarAd: createAdRelationship("Sidebar"),
    },
    ui: {
      labelField: "alt",
      listView: {
        initialColumns: ["alt", "tag", "regions"],
        initialSort: { field: "alt", direction: "ASC" },
      },
      ...campaignUI,
    },
    ...campaignAccess,
  }),
};
