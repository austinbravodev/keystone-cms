import crypto from "crypto";

import { graphql, group } from "@keystone-6/core";
import {
  image,
  integer,
  relationship,
  select,
  text,
  timestamp,
  virtual,
} from "@keystone-6/core/fields";
import { document } from "@keystone-6/fields-document";

import {
  languageOptions,
  uiCreateSidebar,
  timeTrackingFields,
  priorityField,
} from "../common.js";
import { componentBlocks } from "./_components.jsx";

import lookupSchema from "./schemaConfig.js";

import { superuserOrPermission } from "../accessUtils.js";

function camelToTitle(camel) {
  return camel.charAt(0).toUpperCase() + camel.slice(1);
}

function createImgURL(item, name) {
  return `${process.env.IMAGES_URL}${item[name + "_id"]}.${
    item[name + "_extension"]
  }`;
}

const ACTIVE_STATI = ["published", "unlisted"];

export function createRelationship(rel, ui) {
  return relationship({ ref: rel, many: true, ui: ui });
}

const validateAdsHook = {
  hooks: {
    validateInput: async ({
      fieldKey,
      resolvedData,
      context,
      addValidationError,
    }) => {
      const ads = resolvedData[fieldKey]?.connect;

      for (const id of (ads instanceof Array
        ? ads.map((ad) => ad.id)
        : [ads?.id]
      ).filter((adId) => adId)) {
        const adType = fieldKey.replace(/s$/, "");

        const adGroup = await context.query.AdGroup.findOne({
          where: { id: id },
          query: `alt ${adType} { id }`,
        });

        if (!adGroup[adType]?.id) {
          addValidationError(
            `Ad Group '${adGroup.alt}' selected for '${camelToTitle(
              fieldKey,
            )}' does not have a '${camelToTitle(adType)}'.`,
          );
        }
      }
    },
  },
};

export const pageAccess = {
    access: {
      operation: {
        create: superuserOrPermission,
        update: superuserOrPermission,
        delete: superuserOrPermission,
      },
      filter: {
        query: ({ session, listKey }) => {
          return (
            superuserOrPermission({ session, listKey }) || {
              status: { equals: "published" },
              publishedAt: { lte: new Date().toISOString() },
            }
          );
        },
      },
    },
  },
  pageHooks = {
    hooks: {
      resolveInput: async ({ operation, resolvedData, context, listKey }) => {
        if (operation === "create" && resolvedData.clone) {
          let query = "";

          for (let k in resolvedData) {
            if (
              ![
                "id",
                "clone",
                "slug",
                "url",
                "status",
                "publishedAt",
                "updatedAt",
                "liveAt",
                "ended",
                "posts",
                "flag",
              ].includes(k)
            ) {
              let schemaField = lookupSchema[listKey][k];

              if (schemaField.kind === "OBJECT") {
                if (schemaField.name === "ImageFieldOutput") {
                  k += " { id extension filesize height width }";
                } else if (schemaField.name === listKey + "_content_Document") {
                  k += " { document }";
                } else {
                  k += " { id }";
                }
              } else if (schemaField.kind === "LIST") {
                k += " { id }";
              }

              query += " " + k;
            }
          }

          const base = await context.query[listKey].findOne({
            where: { id: resolvedData.clone.connect.id },
            query: query,
          });

          for (const k in base) {
            let schemaField = lookupSchema[listKey][k];

            if (schemaField.kind !== "OBJECT") {
              if (schemaField.kind === "LIST") {
                if (!resolvedData[k] && base[k].length) {
                  resolvedData[k] = {
                    connect: base[k].map((rel) => {
                      return { id: rel.id };
                    }),
                  };
                }
              } else if (
                (k === "language" && resolvedData[k] === "en") ||
                (["Post", "Page"].includes(listKey) &&
                  ((["allowComments", "showRelatedPosts"].includes(k) &&
                    !base[k]) ||
                    (k === "type" && resolvedData[k] === "news"))) ||
                (!["Post", "Page"].includes(listKey) &&
                  ["showFeaturedPosts", "showRecentPosts"].includes(k) &&
                  !base[k]) ||
                (!resolvedData[k] && base[k])
              ) {
                resolvedData[k] = base[k];
              }
            } else if (
              schemaField.name === "ImageFieldOutput" &&
              !resolvedData[k].id &&
              base[k]
            ) {
              resolvedData[k] = base[k];
            } else if (
              // clean this up?
              schemaField.name === listKey + "_content_Document" &&
              resolvedData[k] ===
                '[{"type":"paragraph","children":[{"text":""}]}]' &&
              resolvedData[k] !== JSON.stringify(base[k].document)
            ) {
              resolvedData[k] = JSON.stringify(base[k].document);
            } else if (!resolvedData[k] && base[k]) {
              resolvedData[k] = { connect: { id: base[k].id } };
            }
          }
        }

        return resolvedData;
      },
    },
  },
  pageUI = (key = "") => {
    const removeCols = [];

    if (key) {
      removeCols.push(key);

      if (key === "regions") {
        removeCols.push("journalists", "shows");
      }
    }

    return {
      ui: {
        listView: {
          initialColumns: [
            "title",
            ...["journalists", "shows", "regions"].filter(
              (cat) => !removeCols.includes(cat),
            ),
            "publishedAt",
            "status",
          ],
          initialSort: { field: "publishedAt", direction: "DESC" },
        },
        createView: { defaultFieldMode: "hidden" },
      },
    };
  },
  // eslint-disable-next-line no-unused-vars
  pageMetadata = (listKey) => {
    return {
      title: text({
        // validation: { isRequired: true },
        ui: { createView: { fieldMode: "edit" } },
      }),
      clone: relationship({
        ref: listKey,
        ui: {
          description: `Select a ${listKey.toLowerCase()} to clone - excluding default values, any fields filled out on this page will overwrite the respective clone values.`,
          hideCreate: true,
          createView: { fieldMode: "edit" },
          itemView: { fieldMode: "hidden" },
        },
      }),
      url: virtual({
        label: "URL",
        field: graphql.field({
          type: graphql.String,
          resolve(item) {
            return `${process.env.FRONTEND_URL}${
              listKey === "Page" ? "" : listKey.toLowerCase() + "s/"
            }${item.slug}`;
          },
        }),
      }),
      ...(["Post", "Page"].includes(listKey)
        ? {
            redirectURL: text({
              ui: {
                description: "A URL to redirect this page to.",
                createView: { fieldMode: "edit" },
              },
            }),
          }
        : {}),
      subtitle: text({
        ui: {
          //createView: { fieldMode: "edit" },
          displayMode: "textarea",
        },
      }),
      ...(listKey === "Region"
        ? {
            abbreviation: text({
              ui: {
                description: "The two-letter country or region code.",
                createView: { fieldMode: "edit" },
              },
              hooks: {
                resolveInput: ({ resolvedData, fieldKey }) => {
                  if (typeof resolvedData[fieldKey] === "string") {
                    resolvedData[fieldKey] =
                      resolvedData[fieldKey].toUpperCase();
                  }

                  return resolvedData[fieldKey];
                },
              },
            }),
          }
        : {}),
      slug: text({
        isIndexed: "unique",
        ui: {
          description: "Leave blank to autogenerate based on title.",
          ...uiCreateSidebar,
        },
        hooks: {
          resolveInput: async ({ resolvedData, item, operation, context }) => {
            if (!(resolvedData.slug ?? item?.slug)) {
              let slugHash = "";

              if (
                operation === "create" &&
                !resolvedData.title &&
                resolvedData.clone
              ) {
                const base = await context.query[listKey].findOne({
                  where: { id: resolvedData.clone.connect.id },
                  query: "title",
                });

                if (base.title) {
                  resolvedData.title = base.title;
                  slugHash = "_" + crypto.randomBytes(4).toString("hex");
                }
              }

              resolvedData.slug =
                ((resolvedData.title ?? item.title)
                  ?.trim()
                  ?.toLowerCase()
                  ?.replace(/[^\w ]+/g, "")
                  ?.replace(/ +/g, "_") ??
                  crypto.randomBytes(8).toString("hex")) + slugHash;
            }

            return resolvedData.slug;
          },
        },
      }),
      ...timeTrackingFields,
      status: select({
        options: [
          { label: "Published", value: "published" },
          { label: "Unlisted", value: "unlisted" },
          { label: "Draft", value: "draft" },
          { label: "Archived", value: "archived" },
        ],
        defaultValue: "published",
        ui: {
          ...uiCreateSidebar,
          description: "For scheduled publishing, select Published.",
          /*displayMode: "segmented-control"*/
        },
      }),
      publishedAt: timestamp({
        ui: {
          description: `Leave blank to autogenerate when the page is published. For scheduled publishing, choose a future datetime.`,
          ...uiCreateSidebar,
        },
        hooks: {
          resolveInput: ({ resolvedData, item }) => {
            if (
              !(resolvedData.publishedAt ?? item?.publishedAt) &&
              ACTIVE_STATI.includes(resolvedData.status) &&
              !ACTIVE_STATI.includes(item?.status)
            ) {
              resolvedData.publishedAt = new Date().toISOString();
            }

            return resolvedData.publishedAt;
          },
        },
      }),
      ...priorityField,
      language: select({
        ...languageOptions,
        ui: { ...uiCreateSidebar },
      }),
      // languageAnchor: relationship({
      //   ref: listKey + ".languageVersions",
      //   ui: {
      //     ...uiCreateSidebar,
      //     description:
      //       "The primary language version of a page, if not this page - if no hierarchy, choose any version.",
      //   },
      // }),
      // languageVersions: relationship({
      //   ref: listKey + ".languageAnchor",
      //   many: true,
      //   ui: {
      //     ...uiCreateSidebar,
      //     description: "Pages whose Language Anchor is this page.",
      //   },
      // }),
      sharingImage: image({
        storage: "images",
        ui: {
          description: `If not set, will fall back to the ${
            ["Post", "Page"].includes(listKey)
              ? "'Featured Image', then the "
              : ""
          }site default.`,
          itemView: { fieldPosition: "sidebar" },
        },
      }),
    };
  },
  pageContent = {
    content: document({
      formatting: true,
      links: true,
      dividers: true,
      componentBlocks,
      ui: {
        description:
          "Place embed URLs on their own line, leaving them linked. You can also use the Insert (+) tool for more control over embed creation.\n\nCurrently supported embed URL types include Youtube, Rumble, Twitter / X, PDFs and JPEG, PNG and GIF images. To link an image, modify its link URL, leaving the embed URL unchanged.",
        views: "./schema/pages/_components.jsx",
      },
    }),
    ...group({
      label: "Media Library",
      description:
        "To add images and files via the WYSIWYG's Insert (+) tool, upload here first - note that if an image or file has already been uploaded to the Media Library on another page, it does not need to be uploaded again.",
      fields: {
        images: relationship({
          ref: "Image",
          many: true,
        }),
        files: relationship({
          ref: "File",
          many: true,
        }),
      },
    }),
  },
  pageCampaignsGroup = group({
    label: "Campaigns",
    fields: {
      popupEmbed: relationship({
        ref: "Embed",
        ui: { description: "Populate this or Popup Ad, not both." },
      }),
      popupAd: relationship({
        ref: "AdGroup",
        ui: { description: "Populate this or Popup Embed, not both." },
        ...validateAdsHook,
      }),
      cookieExpiry: integer({
        defaultValue: 30,
        validation: { min: 0 },
        ui: {
          label: "Popup Frequency",
          description: `Limit how often a user sees the popup, in days - '0' indicates once per website visit.`,
        },
      }),
      bannerAds: relationship({
        ref: "AdGroup",
        many: true,
        ui: {
          description:
            "For display below the top nav and above the footer - limit 2.",
        },
        ...validateAdsHook,
      }),
      sidebarEmbeds: relationship({
        ref: "Embed",
        many: true,
      }),
      sidebarAd: relationship({
        ref: "AdGroup",
        ui: { description: "Displayed below any sidebar embeds." },
        ...validateAdsHook,
      }),
      contentAds: relationship({
        ref: "AdGroup",
        many: true,
        ui: {
          description: "For display above and below the Content - limit 2.",
        },
        ...validateAdsHook,
      }),
    },
  });
