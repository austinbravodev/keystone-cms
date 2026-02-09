import { list } from "@keystone-6/core";
import {
  checkbox,
  multiselect,
  password,
  select,
  text,
} from "@keystone-6/core/fields";

import {
  languageOptions,
  regionalMetadata,
  timeTrackingFields,
  priorityField,
} from "./common.js";

import { hasSession, superuserOrPermission } from "./accessUtils.js";

export default {
  User: list({
    fields: {
      name: text({
        validation: { isRequired: true },
        access: { update: superuserOrPermission },
      }),
      email: text({
        validation: { isRequired: true },
        isIndexed: "unique",
        access: { update: superuserOrPermission },
      }),
      password: password({
        validation: { isRequired: true },
        access: {
          update: ({ session, item, listKey }) =>
            superuserOrPermission({ session, listKey }) ||
            session?.data.id === item.id,
        },
      }),
      language: select({
        ...languageOptions,
        ui: {
          createView: { fieldMode: "hidden" },
          itemView: { fieldMode: "hidden", fieldPosition: "sidebar" },
        },
        access: { update: superuserOrPermission },
      }),
      ...timeTrackingFields,
      ...priorityField,
      ...regionalMetadata("", { access: { update: superuserOrPermission } }),
      superuser: checkbox({
        ui: {
          createView: { fieldMode: "hidden" },
          itemView: { fieldMode: "hidden" },
        },
        access: { create: () => false, update: () => false },
      }),
      admin: checkbox({
        ui: {
          description:
            "Give this user unrestricted permissions including the ability to create, update and delete Users - note that if checked, it is not necessary to add any Permissions below.",
        },
        access: { update: superuserOrPermission },
      }),
      permissions: multiselect({
        options: [
          { label: "Posts", value: "Post" },
          { label: "Regions", value: "Region" },
          { label: "Shows", value: "Show" },
          { label: "Journalists", value: "Journalist" },
          { label: "Topics", value: "Topic" },
          { label: "Embeds", value: "Embed" },
          { label: "Ads", value: "AdGroup" },
          { label: "Pages", value: "Page" },
        ],
        ui: {
          description:
            "Choose the types this user can create, update and delete.",
        },
        access: { update: superuserOrPermission },
      }),
    },
    access: {
      operation: {
        query: hasSession,
        create: superuserOrPermission,
      },
      item: {
        update: ({ session, item, listKey }) => {
          return (
            superuserOrPermission({ session, listKey }) ||
            session?.data.id === item.id
          );
        },
        delete: ({ session, item, listKey }) => {
          if (item.superuser) return false;

          return superuserOrPermission({ session, listKey });
        },
      },
    },
    ui: {
      listView: {
        initialColumns: ["name", "email", "regions"],
        initialSort: { field: "name", direction: "ASC" },
      },
    },
  }),
};
