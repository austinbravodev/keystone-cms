import { list } from "@keystone-6/core";
import { file, image, text } from "@keystone-6/core/fields";

import { hasSession } from "../accessUtils.js";

const galleryAccess = {
  access: {
    operation: {
      create: hasSession,
      update: hasSession,
      delete: hasSession,
    },
  },
};

export default {
  File: list({
    fields: {
      file: file({
        storage: "files",
        validation: { isRequired: true },
      }),
      title: text(),
    },
    ui: { isHidden: true },
    ...galleryAccess,
  }),
  Image: list({
    fields: {
      image: image({
        storage: "images",
        validation: { isRequired: true },
      }),
      alt: text({ ui: { description: "For search engines" } }),
      caption: text(),
    },
    ui: { labelField: "alt", isHidden: true },
    ...galleryAccess,
  }),
};
