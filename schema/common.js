import { allowAll, denyAll } from "@keystone-6/core/access";
import { relationship, timestamp, select } from "@keystone-6/core/fields";

export const languageOptions = {
    options: [
      { label: "English", value: "en" },
      { label: "French", value: "fr" },
      { label: "Spanish", value: "es" },
    ],
    defaultValue: "en",
  },
  allowAllAccess = { access: { operation: allowAll } },
  uiCreateSidebar = {
    createView: { fieldMode: "edit" },
    itemView: { fieldPosition: "sidebar" },
  };

export function regionalMetadata(key = "", additionalConfig = {}) {
  return {
    regions: relationship({
      ref: "Region" + (key ? "." + key : ""),
      many: true,
      ui: {
        createView: { fieldMode: "edit" },
        itemView: { fieldPosition: "sidebar" },
      },
      ...additionalConfig,
    }),
  };
}

const timeTrackingReadOnly = {
  access: {
    read: allowAll,
    create: denyAll,
    update: denyAll,
  },
  graphql: {
    omit: {
      create: true,
      update: true,
    },
  },
  ui: {
    createView: {
      fieldMode: "hidden",
    },
    itemView: {
      fieldMode: "hidden",
      fieldPosition: "sidebar",
    },
    listView: {
      fieldMode: "read",
    },
  },
};

export const timeTrackingFields = {
  updatedAt: timestamp({
    ...timeTrackingReadOnly,
    db: {
      updatedAt: true,
    },
  }),
  // createdAt: timestamp({
  //   ...timeTrackingReadOnly,
  //   defaultValue: new Date().toISOString(),
  //   // defaultValue: { kind: "now" },
  //   // hooks: {
  //   //   resolveInput: ({ context, operation, resolvedData }) => {
  //   //     if (operation === "create") return new Date();
  //   //     return resolvedData.createdAt;
  //   //   },
  //   // },
  // }),
};

export const priorityField = {
  priority: select({
    type: "integer",
    options: [
      { label: "1", value: 1 },
      { label: "2", value: 2 },
      { label: "3", value: 3 },
      { label: "4", value: 4 },
      { label: "5", value: 5 },
    ],
    defaultValue: 5,
    validation: { isRequired: true },
    ui: {
      description:
        "Used when sorting this collection - lower numbers mean higher priority.",
      ...uiCreateSidebar,
    },
  }),
};
