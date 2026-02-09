import { list } from "@keystone-6/core";
import {
  checkbox,
  image,
  select,
  text,
  timestamp,
} from "@keystone-6/core/fields";

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
  Post: list({
    ...pageHooks,
    fields: {
      ...pageMetadata("Post"),
      type: select({
        options: [
          { label: "News", value: "news" },
          { label: "Analysis", value: "analysis" },
          { label: "Advocacy", value: "advocacy" },
          { label: "Satire", value: "satire" },
          { label: "Sponsored", value: "sponsored" },
        ],
        defaultValue: "news",
        ui: { ...uiCreateSidebar /*displayMode: "segmented-control"*/ },
      }),
      journalists: createRelationship("Journalist.posts", {
        ...uiCreateSidebar,
      }),
      author: text({
        ui: {
          description: "If the author is not a Journalist, use this field.",
          ...uiCreateSidebar,
        },
      }),
      shows: createRelationship("Show.posts", {
        ...uiCreateSidebar,
      }),
      ...regionalMetadata("posts"),
      topics: createRelationship("Topic.posts", { ...uiCreateSidebar }),
      liveAt: timestamp({
        ui: {
          description: `For livestreams only: the start datetime.\nIMPORTANT: You must check this post's Ended checkbox when the livestream is over.`,
          ...uiCreateSidebar,
        },
      }),
      ended: checkbox({
        ui: {
          description:
            "IMPORTANT: If this post is a livestream, you must check this box when it's over.",
          itemView: { fieldPosition: "sidebar" },
        },
      }),
      featured: checkbox({
        ui: {
          ...uiCreateSidebar,
          description:
            "Include this post in featured post displays (when applicable).",
        },
      }),
      allowComments: checkbox({
        defaultValue: true,
        ui: {
          ...uiCreateSidebar,
        },
      }),
      showRelatedPosts: checkbox({
        defaultValue: true,
        ui: {
          description: "Uncheck to hide the related posts section.",
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
      legacyURL: text({
        ui: {
          description:
            "If this is a paywalled Show episode, the episode's URL on the old website, if it exists.",
          createView: { fieldMode: "edit" },
        },
      }),
      audio: text({
        ui: {
          description:
            "The full URL of the audio version of this post (starts with 'https').",
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
