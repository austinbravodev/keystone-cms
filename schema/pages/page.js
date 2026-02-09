import { list } from "@keystone-6/core";
import { checkbox, image, select, text } from "@keystone-6/core/fields";

import { regionalMetadata, uiCreateSidebar } from "../common.js";
import {
  createRelationship,
  pageAccess,
  pageCampaignsGroup,
  pageContent,
  pageHooks,
  pageMetadata,
  pageUI,
} from "./common.js";

const accessLevel = (type) => {
  return select({
    label:
      type.replace(/\w\S*/g, function (txt) {
        return txt.charAt(0).toUpperCase() + txt.substr(1).toLowerCase();
      }) + " Access",
    options: [
      { label: "Registered", value: "registered" },
      { label: "Paying", value: "paying" },
    ],
    ui: {
      //createView: { fieldMode: "edit" },
      displayMode: "segmented-control",
      description: `Limit the users who can access this ${type} - leave unselected for public access.`,
    },
  });
};

export default {
  Page: list({
    ...pageHooks,
    fields: {
      ...pageMetadata("Page"),
      journalists: createRelationship("Journalist", {
        ...uiCreateSidebar,
      }),
      author: text({
        ui: {
          description: "If the author is not a Journalist, use this field.",
          ...uiCreateSidebar,
        },
      }),
      shows: createRelationship("Show", {
        ...uiCreateSidebar,
      }),
      ...regionalMetadata(),
      topics: createRelationship("Topic", { ...uiCreateSidebar }),
      hideSidebar: checkbox({
        defaultValue: false,
        ui: {
          ...uiCreateSidebar,
        },
      }),
      allowComments: checkbox({
        defaultValue: false,
        ui: {
          ...uiCreateSidebar,
        },
      }),
      featuredImage: image({ storage: "images" }),
      featuredImageURL: text({
        ui: {
          description:
            "In lieu of uploading a featured image, provide an image via its full URL (starts with 'https').",
        },
      }),
      caption: text({ label: "Featured Image Caption" }),
      featuredVideo: text({
        ui: { description: "The video's full URL (starts with 'https')." },
      }),
      videoAccess: accessLevel("featured video"),
      audio: text({
        ui: {
          description:
            "The full URL of the audio version of this page (starts with 'https').",
        },
      }),
      audioAccess: accessLevel("audio"),
      ...pageContent,
      contentAccess: accessLevel("content"),
      ...pageCampaignsGroup,
    },
    ...pageAccess,
    ...pageUI(),
  }),
};
