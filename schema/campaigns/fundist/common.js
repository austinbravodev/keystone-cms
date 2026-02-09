import { graphql, list } from "@keystone-6/core";
import {
  checkbox,
  float,
  image,
  integer,
  relationship,
  select,
  text,
  virtual,
} from "@keystone-6/core/fields";

import { superuserOrPermission } from "../../accessUtils.js";
import { campaignAccess } from "../campaigns.js";

const superuserOrPermissionEmbed = ({ session }) =>
  superuserOrPermission({ session, listKey: "Embed" });

export const embedAccess = {
  access: {
    operation: {
      create: superuserOrPermissionEmbed,
      update: superuserOrPermissionEmbed,
      delete: superuserOrPermissionEmbed,
    },
  },
};

export const constructList = (formType) => {
  const lists = {};
  const formTypeCap = formType.charAt(0).toUpperCase() + formType.slice(1);
  const tagName = formTypeCap + "Tag";

  if (formType === "donation") {
    for (const s of ["", "Share"]) {
      lists[`NationBuilder${s}Tag`] = list({
        fields: {
          tag: text({ validation: { isRequired: true }, isIndexed: "unique" }),
        },
        ui: { labelField: "tag", isHidden: true },
        ...embedAccess,
      });
    }
  }

  if (formType === "signup") {
    lists["NationBuilderTagCheckbox"] = list({
      fields: {
        tag: text({ validation: { isRequired: true }, isIndexed: "unique" }),
        label: text(),
      },
      ui: { isHidden: true },
      ...embedAccess,
    });
  }

  lists[tagName] = list({
    fields: {
      tag: text({
        validation: { isRequired: true },
        isIndexed: "unique",
      }),
    },
    ui: {
      label:
        (formType === "signup" ? "Signup / Petition" : formTypeCap) +
        " Fundist Tag",
      singular:
        (formType === "signup" ? "Signup / Petition" : formTypeCap) +
        " Fundist Tag",
      plural:
        (formType === "signup" ? "Signup / Petition" : formTypeCap) +
        " Fundist Tags",
      path:
        (formType === "signup" ? "signup-petition" : formType) + "-fundist-tag",

      isHidden: true,
      labelField: "tag",
    },
    ...embedAccess,
  });

  lists["Fundist" + formTypeCap] = list({
    fields: {
      url: text({
        ui: {
          createView: { fieldMode: "hidden" },
          itemView: { fieldMode: "hidden" },
        },
      }),
      organization: select({
        validation: { isRequired: true },
        options: [
          { label: "Primary Organization", value: process.env.PRIMARY_ORG },
          { label: "Secondary Organization", value: process.env.SECONDARY_ORG },
        ],
      }),
      paramTitle: text({
        label: "Headline",
      }),
      trackingTag: relationship({
        ref: tagName,
        ui: {
          description:
            "If you are in the process of connecting this Fundist to an embed, leave blank to autogenerate based on the embed's `Label`.",
        },
      }),
      featuredImage: image({
        storage: "images",
      }),
      paramVideo: text({
        label: "Featured Video",
        ui: {
          description: "The video's full URL (starts with 'https').",
        },
      }),
      journalist: relationship({ ref: "Journalist" }),
      paramSubtitle: text({
        label: "Subheadline",
        ui: { displayMode: "textarea" },
      }),

      ...(formType === "donation"
        ? {
            paramInterval: select({
              label: "Preselected Interval",
              options: [
                { label: "Monthly", value: "month" },
                { label: "Annually", value: "year" },
              ],
              ui: {
                description: "Leave unselected to default to 'Once'.",
                displayMode: "segmented-control",
              },
            }),
            goalType: select({
              options: [
                { label: "Amount", value: "amount" },
                { label: "Count", value: "count" },
              ],
              defaultValue: "amount",
              ui: { displayMode: "segmented-control" },
            }),
            paramCurrency: select({
              label: "Goal & Preselected Currency",
              options: [
                { label: "CAD", value: "cad" },
                { label: "AUD", value: "aud" },
                { label: "USD", value: "usd" },
                { label: "GPB", value: "gbp" },
                { label: "NZD", value: "nzd" },
              ],
              defaultValue: "cad",
            }),
            goal: float({
              ui: {
                description: "Do not include a currency symbol.",
              },
            }),
            paramAdd: float({
              label: "Progress Bump",
              ui: {
                description:
                  "Amount in the `Preselected Currency` to add to goal progress.",
              },
            }),
            amounts: text({
              label: "Button Amounts",
              ui: {
                description:
                  "Separate by comma. Place an asterisk before the pre-selected amount.",
              },
            }),
            customAmounts: text({
              label: "Amounts, Perks & Button Labels",
              ui: {
                description:
                  "Use the same formatting as was used in NationBuilder. This field overrides `Button Amounts`.",
                displayMode: "textarea",
              },
            }),
          }
        : {}),

      ...(formType === "signup"
        ? {
            paramType: select({
              label: "Type",
              options: [
                { label: "Signup", value: "signup" },
                { label: "Petition", value: "signature" },
              ],
              defaultValue: "signup",
              ui: { displayMode: "segmented-control" },
            }),
            paramGoal: integer({ label: "Goal" }),
            paramSignatures: virtual({
              label: "Submissions",
              field: graphql.field({
                type: graphql.Int,
                resolve(item) {
                  return 568;
                },
              }),
              ui: {
                createView: { fieldMode: "hidden" },
                itemView: { fieldMode: "hidden" },
              },
            }),
            paramAdd: integer({
              label: "Progress Bump",
              ui: { description: "Amount to add to goal progress." },
            }),
            paramCountry_code: select({
              label: "Preselected Country",
              options: [
                { label: "Canada", value: "ca" },
                { label: "Australia", value: "au" },
                { label: "United States of America", value: "us" },
                { label: "United Kingdom", value: "gb" },
                { label: "New Zealand", value: "nz" },
              ],
              defaultValue: "ca",
            }),

            petitionID: integer({
              ui: {
                description:
                  "The ID of the petition in the `Organization`'s nation to associate with this form.",
              },
            }),
            petitionIDShare: integer({
              label: "Petition ID Share",
              ui: {
                description:
                  "The ID of the petition in primary organization's nation to associate with this form if `Organization` is *not* the primary organization but data is being shared with the primary organization.",
              },
            }),

            paramTag_checkboxes_label: text({
              label: "NationBuilder Tag Checkboxes Label",
              ui: {
                //description: "",
              },
            }),
            nationbuilderTagCheckboxes: relationship({
              ref: "NationBuilderTagCheckbox",
              many: true,
              ui: {
                description:
                  "Checkboxes that let people tag themselves in the `Organization`'s nation.",
              },
            }),
          }
        : {}),

      ...(formType === "basic"
        ? {
            sponsored: checkbox(),
            paramCampaignLink: text({ label: "Link URL" }),
          }
        : {}),

      ...(["donation", "signup"].includes(formType)
        ? {
            paramMessage_label: text({
              label: "Comment Field Label",
              ui: {
                description: "Add a comment field - this will be its label.",
              },
            }),
            nationbuilderTags: relationship({
              ref: "NationBuilderTag",
              many: true,
              ui: {
                description:
                  "NationBuilder tags to assign in the `Organization`'s nation - separate by comma.",
              },
            }),
            nationbuilderShareTags: relationship({
              ref: "NationBuilderShareTag",
              many: true,
              ui: {
                description:
                  "NationBuilder tags to assign in the primary organization's nation if `Organization` is *not* the primary organization but data is being shared with the primary organization - separate by comma.",
              },
            }),
          }
        : {}),

      ...(["donation", "basic"].includes(formType)
        ? { paramAction: text({ label: "Button Text" }) }
        : {}),
    },
    hooks: {
      afterOperation: async ({ resolvedData, item, operation, context }) => {
        // is just checking for URL adequate?
        if (!resolvedData.url && operation !== "delete") {
          const apiItem = await context.query["Fundist" + formTypeCap].findOne({
            where: { id: item.id },
            query:
              "journalist { title avatar { id extension } } trackingTag { tag }" +
              (["donation", "signup"].includes(formType)
                ? " nationbuilderTags { tag } nationbuilderShareTags { tag }"
                : "") +
              (formType === "signup"
                ? " nationbuilderTagCheckboxes { tag label }"
                : ""),
          });

          const isPrimaryOrg =
            item.organization === process.env.PRIMARY_ORG ? true : false;
          const isSecondaryOrg =
            item.organization === process.env.SECONDARY_ORG ? true : false;
          const url = new URL(
            `https://${
              process.env.FUNDIST_URL ||
              `fundist-${item.organization}.herokuapp.com`
            }/${
              formType === "donation"
                ? "form"
                : formType === "signup"
                  ? "form_signup"
                  : "form_campaign"
            }/`,
          );

          for (const param in item) {
            if (param.startsWith("param")) {
              const firstLetter = param[5];

              if (firstLetter.toUpperCase() === firstLetter) {
                const val = item[param];

                if (val) {
                  const paramName = param.slice(5).toLowerCase();

                  url.searchParams.set(
                    paramName === "campaignlink" ? "campaignLink" : paramName,
                    typeof val === "string" ? val.trim() : val,
                  );
                }
              }
            }
          }

          if (apiItem.trackingTag)
            url.searchParams.set("tag", apiItem.trackingTag.tag);

          if (item.featuredImage_id) {
            url.searchParams.set(
              "image",
              `${process.env.IMAGES_URL}${item.featuredImage_id}.${item.featuredImage_extension}`,
            );
          }

          if (apiItem.journalist) {
            const journo = apiItem.journalist;

            url.searchParams.set(
              "by",
              (item.sponsored && !isSecondaryOrg ? "Sponsored by " : "") +
                journo.title +
                (isSecondaryOrg ? " for " : ""),
            );

            if (journo.avatar)
              url.searchParams.set(
                "avatar",
                `${process.env.IMAGES_URL}${journo.avatar.id}.${journo.avatar.extension}`,
              );
          } else if (isSecondaryOrg) {
            url.searchParams.set("by", "For ");
          } else if (item.sponsored) {
            url.searchParams.set("by", "Sponsored");
          }

          if (["donation", "signup"].includes(formType)) {
            if (!isPrimaryOrg)
              url.searchParams.append("custom_field", "share:1");

            for (const share of [false, true]) {
              const nbTags = (
                apiItem[`nationbuilder${share ? "Share" : ""}Tags`] || []
              )
                .map((t) => t.tag.trim())
                .filter((t) => t);

              if (nbTags.length > 0)
                url.searchParams.append(
                  "custom_field",
                  `tags${share ? "_share" : ""}:` + nbTags.join(","),
                );
            }
          }

          if (formType === "donation") {
            if (item.goal) {
              let currSym = "";

              if (item.goalType === "amount") {
                currSym =
                  item.paramCurrency === "eur"
                    ? "€"
                    : item.paramCurrency === "gbp"
                      ? "£"
                      : "$";
              }

              url.searchParams.set("goal", currSym + item.goal);
            }

            url.searchParams.set(
              "country_code",
              item.paramCurrency.slice(0, -1),
            );

            if (item.customAmounts) {
              url.searchParams.set(
                "custom_amounts",
                item.customAmounts.trim().replace(/\n/g, ""),
              );
            } else if (item.amounts) {
              const amts = [];

              for (let amt of item.amounts.split(",")) {
                amt = amt.trim();

                if (amt.startsWith("*")) {
                  amt = amt.replace("*");
                  url.searchParams.set("amount", amt);
                }

                amts.push(amt);
              }

              url.searchParams.set("amounts", amts.join(","));
            }
          } else if (formType === "signup") {
            if (item.paramType === "signature")
              url.searchParams.set("action", "Add Signature");

            if (item.petitionID)
              url.searchParams.append(
                "custom_field",
                "petition_id:" + item.petitionID,
              );

            if (item.petitionIDShare && isSecondaryOrg)
              url.searchParams.append(
                "custom_field",
                "petition_id_share:" + item.petitionIDShare,
              );

            for (const tagCheckbox of apiItem.nationbuilderTagCheckboxes ||
              []) {
              url.searchParams.append(
                "tag_checkboxes",
                `${tagCheckbox.tag.trim()};${tagCheckbox.label.trim()}`,
              );
            }
          } else if (formType === "basic") {
            if (isSecondaryOrg)
              url.searchParams.append("basicCampaignForSecondaryOrg", "1");
          }

          await context.query["Fundist" + formTypeCap].updateOne({
            where: { id: item.id },
            data: { url: url.toString() },
            // query: `id`,
          });
        }
      },
    },
    ui: {
      label: formTypeCap + " Fundist",
      singular: formTypeCap + " Fundist",
      plural: formTypeCap + " Fundists",
      path: formType + "-fundists",
      isHidden: true,
      labelField: "paramTitle",
      searchFields: ["subtitle"],
    },
    ...campaignAccess,
  });

  return lists;
};
