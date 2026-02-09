import { graphql, group, list } from "@keystone-6/core";
import {
  checkbox,
  image,
  relationship,
  text,
  virtual,
} from "@keystone-6/core/fields";

import { regionalMetadata, uiCreateSidebar } from "../common.js";
import {
  createRelationship,
  pageAccess,
  pageCampaignsGroup,
  pageContent,
  pageMetadata,
  pageUI,
  pageHooks,
} from "./common.js";

import { hasSession } from "../accessUtils.js";

const miscAccess = {
  access: {
    operation: {
      create: hasSession,
      update: hasSession,
      delete: hasSession,
    },
  },
};

const flagCodepoints = {
  global: [0x1f30e],
  canada: [0x1f1e8, 0x1f1e6],
  australia: [0x1f1e6, 0x1f1fa],
  united_states: [0x1f1fa, 0x1f1f8],
  united_kingdom: [0x1f1ec, 0x1f1e7],
  new_zealand: [0x1f1f3, 0x1f1ff],
};

function createCategory(key, relationships = [], fields = {}, regional = true) {
  const rels = {};

  for (const ref of relationships) {
    rels[ref.toLowerCase() + "s"] = createRelationship(ref + "." + key, {
      createView: { fieldMode: regional ? "edit" : "hidden" },
      itemView: {
        ...(key === "regions" && ref === "Topic"
          ? { fieldMode: "hidden" }
          : {}),
        fieldPosition: "sidebar",
      },
    });
  }

  return list({
    ...pageHooks,
    fields: {
      ...pageMetadata(key[0].toUpperCase() + key.slice(1).replace(/s$/, "")),
      ...rels,
      ...(regional ? regionalMetadata(key) : {}),
      ...group({
        label: "Header",
        fields: {
          image: image({ storage: "images" }),
          mobileImage: image({ storage: "images" }),
          links: linksHelper(),
        },
      }),
      ...pageContent,
      subsections: relationship({
        ref: "Subsection",
        many: true,
        ui: {
          description:
            "Choose one Region, Show, Journalist or Topic per subsection.",
          displayMode: "cards",
          cardFields: ["region", "show", "journalist", "topic"],
          inlineEdit: { fields: ["region", "show", "journalist", "topic"] },
          inlineCreate: {
            fields: ["region", "show", "journalist", "topic"],
          },
        },
      }),
      ...pageCampaignsGroup,
      ...fields,
      hidePageHeader: checkbox({
        defaultValue: false,
        ui: {
          ...uiCreateSidebar,
        },
      }),
      showFeaturedPosts: checkbox({
        defaultValue: true,
        ui: { ...uiCreateSidebar },
      }),
      showRecentPosts: checkbox({
        defaultValue: true,
        ui: { ...uiCreateSidebar },
      }),
      posts: createRelationship("Post." + key, {
        createView: { fieldMode: "hidden" },
        itemView: { fieldMode: "hidden" },
      }),
    },
    ...pageAccess,
    ...pageUI(key),
  });
}

const linksHelper = (label) => {
  return relationship({
    ...(label ? { label: label } : {}),
    ref: "Link",
    many: true,
    ui: {
      displayMode: "cards",
      cardFields: ["text", "url"],
      inlineEdit: { fields: ["text", "url"] },
      inlineCreate: { fields: ["text", "url"] },
    },
  });
};
/*menuHelper = relationship({
    ref: "MenuItem",
    many: true,
    ui: {
      displayMode: "cards",
      cardFields: ["text", "url", "links"],
      inlineEdit: { fields: ["text", "url", "links"] },
      inlineCreate: { fields: ["text", "url", "links"] },
    },
  })*/

export default {
  Link: list({
    fields: {
      text: text({ validation: { isRequired: true } }),
      url: text({ validation: { isRequired: true } }),
    },
    ui: { isHidden: true },
    ...miscAccess,
  }),
  ImageLink: list({
    fields: {
      image: image({
        storage: "images",
        validation: { isRequired: true },
        ui: {
          description: "Typically an icon or logo.",
        },
      }),
      url: text({ validation: { isRequired: true } }),
    },
    ui: { isHidden: true },
    ...miscAccess,
  }),
  Subsection: list({
    fields: {
      topic: relationship({ ref: "Topic" }),
      show: relationship({ ref: "Show" }),
      region: relationship({ ref: "Region" }),
      journalist: relationship({ ref: "Journalist" }),
    },
    ui: { isHidden: true },
    ...miscAccess,
  }),
  Topic: createCategory("topics", [], {
    trending: checkbox({
      defaultValue: false,
      ui: {
        description:
          "Include this topic in trending topic displays (when applicable).",
        ...uiCreateSidebar,
      },
    }),
  }),
  Journalist: createCategory("journalists", ["Show"], {
    avatar: image({
      storage: "images",
      ui: { ...uiCreateSidebar },
    }),
  }),
  Show: createCategory("shows", ["Journalist"]),
  Region: createCategory(
    "regions",
    ["Show", "Journalist", "Topic"],
    {
      ...group({
        label: "Nav",
        fields: {
          logo: image({ storage: "images" }),
          sideMenu: text({
            label: "Menu",
            ui: {
              description:
                "Place each menu item (format: `Text URL` (no ticks)) on its own line - indent nested items two spaces.",
              displayMode: "textarea",
            },
          }),
          buttons: linksHelper(),
        },
      }),
      ...group({
        label: "Footer",
        fields: {
          socialLinks: relationship({
            ref: "ImageLink",
            many: true,
            ui: {
              displayMode: "cards",
              cardFields: ["image", "url"],
              inlineEdit: { fields: ["image", "url"] },
              inlineCreate: { fields: ["image", "url"] },
            },
          }),
          footerMenu: linksHelper("Menu"),
        },
      }),
      commentsGUID: text({
        ui: {
          label: "Minds Account ID",
          ...uiCreateSidebar,
          description:
            "The Minds account ID that will manage this region's posts and any pages with comments enabled.",
        },
      }),
      flag: virtual({
        field: graphql.field({
          type: graphql.JSON,
          resolve(item) {
            // do you want to return an empty array if nothing? (testing showed no errors)
            return flagCodepoints[item.slug];
            // String.fromCodePoint(...flagCodepoints[item.slug])
          },
        }),
        ui: {
          itemView: { fieldMode: "hidden" },
        },
      }),
    },
    false,
  ),
};
