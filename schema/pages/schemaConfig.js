// {
//   __type(name: "Page") {
//     name
//     fields {
//       name
//       type {
//         name
//         kind
//       }
//     }
//   }
// }

const schemas = [
  {
    name: "Page",
    fields: [
      {
        name: "id",
        type: {
          name: null,
          kind: "NON_NULL",
        },
      },
      {
        name: "title",
        type: {
          name: "String",
          kind: "SCALAR",
        },
      },
      {
        name: "clone",
        type: {
          name: "Page",
          kind: "OBJECT",
        },
      },
      {
        name: "url",
        type: {
          name: "String",
          kind: "SCALAR",
        },
      },
      {
        name: "redirectURL",
        type: {
          name: "String",
          kind: "SCALAR",
        },
      },
      {
        name: "subtitle",
        type: {
          name: "String",
          kind: "SCALAR",
        },
      },
      {
        name: "slug",
        type: {
          name: "String",
          kind: "SCALAR",
        },
      },
      {
        name: "updatedAt",
        type: {
          name: "DateTime",
          kind: "SCALAR",
        },
      },
      {
        name: "status",
        type: {
          name: "String",
          kind: "SCALAR",
        },
      },
      {
        name: "publishedAt",
        type: {
          name: "DateTime",
          kind: "SCALAR",
        },
      },
      {
        name: "priority",
        type: {
          name: "Int",
          kind: "SCALAR",
        },
      },
      {
        name: "language",
        type: {
          name: "String",
          kind: "SCALAR",
        },
      },
      {
        name: "sharingImage",
        type: {
          name: "ImageFieldOutput",
          kind: "OBJECT",
        },
      },
      {
        name: "journalists",
        type: {
          name: null,
          kind: "LIST",
        },
      },
      {
        name: "journalistsCount",
        type: {
          name: "Int",
          kind: "SCALAR",
        },
      },
      {
        name: "author",
        type: {
          name: "String",
          kind: "SCALAR",
        },
      },
      {
        name: "shows",
        type: {
          name: null,
          kind: "LIST",
        },
      },
      {
        name: "showsCount",
        type: {
          name: "Int",
          kind: "SCALAR",
        },
      },
      {
        name: "regions",
        type: {
          name: null,
          kind: "LIST",
        },
      },
      {
        name: "regionsCount",
        type: {
          name: "Int",
          kind: "SCALAR",
        },
      },
      {
        name: "topics",
        type: {
          name: null,
          kind: "LIST",
        },
      },
      {
        name: "topicsCount",
        type: {
          name: "Int",
          kind: "SCALAR",
        },
      },
      {
        name: "hideSidebar",
        type: {
          name: "Boolean",
          kind: "SCALAR",
        },
      },
      {
        name: "allowComments",
        type: {
          name: "Boolean",
          kind: "SCALAR",
        },
      },
      {
        name: "featuredImage",
        type: {
          name: "ImageFieldOutput",
          kind: "OBJECT",
        },
      },
      {
        name: "featuredImageURL",
        type: {
          name: "String",
          kind: "SCALAR",
        },
      },
      {
        name: "caption",
        type: {
          name: "String",
          kind: "SCALAR",
        },
      },
      {
        name: "featuredVideo",
        type: {
          name: "String",
          kind: "SCALAR",
        },
      },
      {
        name: "videoAccess",
        type: {
          name: "String",
          kind: "SCALAR",
        },
      },
      {
        name: "audio",
        type: {
          name: "String",
          kind: "SCALAR",
        },
      },
      {
        name: "audioAccess",
        type: {
          name: "String",
          kind: "SCALAR",
        },
      },
      {
        name: "content",
        type: {
          name: "Page_content_Document",
          kind: "OBJECT",
        },
      },
      {
        name: "images",
        type: {
          name: null,
          kind: "LIST",
        },
      },
      {
        name: "imagesCount",
        type: {
          name: "Int",
          kind: "SCALAR",
        },
      },
      {
        name: "files",
        type: {
          name: null,
          kind: "LIST",
        },
      },
      {
        name: "filesCount",
        type: {
          name: "Int",
          kind: "SCALAR",
        },
      },
      {
        name: "contentAccess",
        type: {
          name: "String",
          kind: "SCALAR",
        },
      },
      {
        name: "popupEmbed",
        type: {
          name: "Embed",
          kind: "OBJECT",
        },
      },
      {
        name: "popupAd",
        type: {
          name: "AdGroup",
          kind: "OBJECT",
        },
      },
      {
        name: "cookieExpiry",
        type: {
          name: "Int",
          kind: "SCALAR",
        },
      },
      {
        name: "bannerAds",
        type: {
          name: null,
          kind: "LIST",
        },
      },
      {
        name: "bannerAdsCount",
        type: {
          name: "Int",
          kind: "SCALAR",
        },
      },
      {
        name: "sidebarEmbeds",
        type: {
          name: null,
          kind: "LIST",
        },
      },
      {
        name: "sidebarEmbedsCount",
        type: {
          name: "Int",
          kind: "SCALAR",
        },
      },
      {
        name: "sidebarAd",
        type: {
          name: "AdGroup",
          kind: "OBJECT",
        },
      },
      {
        name: "contentAds",
        type: {
          name: null,
          kind: "LIST",
        },
      },
      {
        name: "contentAdsCount",
        type: {
          name: "Int",
          kind: "SCALAR",
        },
      },
    ],
  },
  {
    name: "Post",
    fields: [
      {
        name: "id",
        type: {
          name: null,
          kind: "NON_NULL",
        },
      },
      {
        name: "title",
        type: {
          name: "String",
          kind: "SCALAR",
        },
      },
      {
        name: "clone",
        type: {
          name: "Post",
          kind: "OBJECT",
        },
      },
      {
        name: "url",
        type: {
          name: "String",
          kind: "SCALAR",
        },
      },
      {
        name: "redirectURL",
        type: {
          name: "String",
          kind: "SCALAR",
        },
      },
      {
        name: "subtitle",
        type: {
          name: "String",
          kind: "SCALAR",
        },
      },
      {
        name: "slug",
        type: {
          name: "String",
          kind: "SCALAR",
        },
      },
      {
        name: "updatedAt",
        type: {
          name: "DateTime",
          kind: "SCALAR",
        },
      },
      {
        name: "status",
        type: {
          name: "String",
          kind: "SCALAR",
        },
      },
      {
        name: "publishedAt",
        type: {
          name: "DateTime",
          kind: "SCALAR",
        },
      },
      {
        name: "priority",
        type: {
          name: "Int",
          kind: "SCALAR",
        },
      },
      {
        name: "language",
        type: {
          name: "String",
          kind: "SCALAR",
        },
      },
      {
        name: "sharingImage",
        type: {
          name: "ImageFieldOutput",
          kind: "OBJECT",
        },
      },
      {
        name: "type",
        type: {
          name: "String",
          kind: "SCALAR",
        },
      },
      {
        name: "journalists",
        type: {
          name: null,
          kind: "LIST",
        },
      },
      {
        name: "journalistsCount",
        type: {
          name: "Int",
          kind: "SCALAR",
        },
      },
      {
        name: "author",
        type: {
          name: "String",
          kind: "SCALAR",
        },
      },
      {
        name: "shows",
        type: {
          name: null,
          kind: "LIST",
        },
      },
      {
        name: "showsCount",
        type: {
          name: "Int",
          kind: "SCALAR",
        },
      },
      {
        name: "regions",
        type: {
          name: null,
          kind: "LIST",
        },
      },
      {
        name: "regionsCount",
        type: {
          name: "Int",
          kind: "SCALAR",
        },
      },
      {
        name: "topics",
        type: {
          name: null,
          kind: "LIST",
        },
      },
      {
        name: "topicsCount",
        type: {
          name: "Int",
          kind: "SCALAR",
        },
      },
      {
        name: "liveAt",
        type: {
          name: "DateTime",
          kind: "SCALAR",
        },
      },
      {
        name: "ended",
        type: {
          name: "Boolean",
          kind: "SCALAR",
        },
      },
      {
        name: "featured",
        type: {
          name: "Boolean",
          kind: "SCALAR",
        },
      },
      {
        name: "allowComments",
        type: {
          name: "Boolean",
          kind: "SCALAR",
        },
      },
      {
        name: "showRelatedPosts",
        type: {
          name: "Boolean",
          kind: "SCALAR",
        },
      },
      {
        name: "featuredImage",
        type: {
          name: "ImageFieldOutput",
          kind: "OBJECT",
        },
      },
      {
        name: "featuredImageURL",
        type: {
          name: "String",
          kind: "SCALAR",
        },
      },
      {
        name: "caption",
        type: {
          name: "String",
          kind: "SCALAR",
        },
      },
      {
        name: "featuredVideo",
        type: {
          name: "String",
          kind: "SCALAR",
        },
      },
      {
        name: "videoAccess",
        type: {
          name: "String",
          kind: "SCALAR",
        },
      },
      {
        name: "legacyURL",
        type: {
          name: "String",
          kind: "SCALAR",
        },
      },
      {
        name: "audio",
        type: {
          name: "String",
          kind: "SCALAR",
        },
      },
      {
        name: "audioAccess",
        type: {
          name: "String",
          kind: "SCALAR",
        },
      },
      {
        name: "content",
        type: {
          name: "Post_content_Document",
          kind: "OBJECT",
        },
      },
      {
        name: "images",
        type: {
          name: null,
          kind: "LIST",
        },
      },
      {
        name: "imagesCount",
        type: {
          name: "Int",
          kind: "SCALAR",
        },
      },
      {
        name: "files",
        type: {
          name: null,
          kind: "LIST",
        },
      },
      {
        name: "filesCount",
        type: {
          name: "Int",
          kind: "SCALAR",
        },
      },
      {
        name: "contentAccess",
        type: {
          name: "String",
          kind: "SCALAR",
        },
      },
      {
        name: "popupEmbed",
        type: {
          name: "Embed",
          kind: "OBJECT",
        },
      },
      {
        name: "popupAd",
        type: {
          name: "AdGroup",
          kind: "OBJECT",
        },
      },
      {
        name: "cookieExpiry",
        type: {
          name: "Int",
          kind: "SCALAR",
        },
      },
      {
        name: "bannerAds",
        type: {
          name: null,
          kind: "LIST",
        },
      },
      {
        name: "bannerAdsCount",
        type: {
          name: "Int",
          kind: "SCALAR",
        },
      },
      {
        name: "sidebarEmbeds",
        type: {
          name: null,
          kind: "LIST",
        },
      },
      {
        name: "sidebarEmbedsCount",
        type: {
          name: "Int",
          kind: "SCALAR",
        },
      },
      {
        name: "sidebarAd",
        type: {
          name: "AdGroup",
          kind: "OBJECT",
        },
      },
      {
        name: "contentAds",
        type: {
          name: null,
          kind: "LIST",
        },
      },
      {
        name: "contentAdsCount",
        type: {
          name: "Int",
          kind: "SCALAR",
        },
      },
    ],
  },
  {
    name: "Region",
    fields: [
      {
        name: "id",
        type: {
          name: null,
          kind: "NON_NULL",
        },
      },
      {
        name: "title",
        type: {
          name: "String",
          kind: "SCALAR",
        },
      },
      {
        name: "clone",
        type: {
          name: "Region",
          kind: "OBJECT",
        },
      },
      {
        name: "url",
        type: {
          name: "String",
          kind: "SCALAR",
        },
      },
      {
        name: "subtitle",
        type: {
          name: "String",
          kind: "SCALAR",
        },
      },
      {
        name: "abbreviation",
        type: {
          name: "String",
          kind: "SCALAR",
        },
      },
      {
        name: "slug",
        type: {
          name: "String",
          kind: "SCALAR",
        },
      },
      {
        name: "updatedAt",
        type: {
          name: "DateTime",
          kind: "SCALAR",
        },
      },
      {
        name: "status",
        type: {
          name: "String",
          kind: "SCALAR",
        },
      },
      {
        name: "publishedAt",
        type: {
          name: "DateTime",
          kind: "SCALAR",
        },
      },
      {
        name: "priority",
        type: {
          name: "Int",
          kind: "SCALAR",
        },
      },
      {
        name: "language",
        type: {
          name: "String",
          kind: "SCALAR",
        },
      },
      {
        name: "sharingImage",
        type: {
          name: "ImageFieldOutput",
          kind: "OBJECT",
        },
      },
      {
        name: "shows",
        type: {
          name: null,
          kind: "LIST",
        },
      },
      {
        name: "showsCount",
        type: {
          name: "Int",
          kind: "SCALAR",
        },
      },
      {
        name: "journalists",
        type: {
          name: null,
          kind: "LIST",
        },
      },
      {
        name: "journalistsCount",
        type: {
          name: "Int",
          kind: "SCALAR",
        },
      },
      {
        name: "topics",
        type: {
          name: null,
          kind: "LIST",
        },
      },
      {
        name: "topicsCount",
        type: {
          name: "Int",
          kind: "SCALAR",
        },
      },
      {
        name: "image",
        type: {
          name: "ImageFieldOutput",
          kind: "OBJECT",
        },
      },
      {
        name: "mobileImage",
        type: {
          name: "ImageFieldOutput",
          kind: "OBJECT",
        },
      },
      {
        name: "links",
        type: {
          name: null,
          kind: "LIST",
        },
      },
      {
        name: "linksCount",
        type: {
          name: "Int",
          kind: "SCALAR",
        },
      },
      {
        name: "content",
        type: {
          name: "Region_content_Document",
          kind: "OBJECT",
        },
      },
      {
        name: "images",
        type: {
          name: null,
          kind: "LIST",
        },
      },
      {
        name: "imagesCount",
        type: {
          name: "Int",
          kind: "SCALAR",
        },
      },
      {
        name: "files",
        type: {
          name: null,
          kind: "LIST",
        },
      },
      {
        name: "filesCount",
        type: {
          name: "Int",
          kind: "SCALAR",
        },
      },
      {
        name: "subsections",
        type: {
          name: null,
          kind: "LIST",
        },
      },
      {
        name: "subsectionsCount",
        type: {
          name: "Int",
          kind: "SCALAR",
        },
      },
      {
        name: "popupEmbed",
        type: {
          name: "Embed",
          kind: "OBJECT",
        },
      },
      {
        name: "popupAd",
        type: {
          name: "AdGroup",
          kind: "OBJECT",
        },
      },
      {
        name: "cookieExpiry",
        type: {
          name: "Int",
          kind: "SCALAR",
        },
      },
      {
        name: "bannerAds",
        type: {
          name: null,
          kind: "LIST",
        },
      },
      {
        name: "bannerAdsCount",
        type: {
          name: "Int",
          kind: "SCALAR",
        },
      },
      {
        name: "sidebarEmbeds",
        type: {
          name: null,
          kind: "LIST",
        },
      },
      {
        name: "sidebarEmbedsCount",
        type: {
          name: "Int",
          kind: "SCALAR",
        },
      },
      {
        name: "sidebarAd",
        type: {
          name: "AdGroup",
          kind: "OBJECT",
        },
      },
      {
        name: "contentAds",
        type: {
          name: null,
          kind: "LIST",
        },
      },
      {
        name: "contentAdsCount",
        type: {
          name: "Int",
          kind: "SCALAR",
        },
      },
      {
        name: "logo",
        type: {
          name: "ImageFieldOutput",
          kind: "OBJECT",
        },
      },
      {
        name: "sideMenu",
        type: {
          name: "String",
          kind: "SCALAR",
        },
      },
      {
        name: "buttons",
        type: {
          name: null,
          kind: "LIST",
        },
      },
      {
        name: "buttonsCount",
        type: {
          name: "Int",
          kind: "SCALAR",
        },
      },
      {
        name: "socialLinks",
        type: {
          name: null,
          kind: "LIST",
        },
      },
      {
        name: "socialLinksCount",
        type: {
          name: "Int",
          kind: "SCALAR",
        },
      },
      {
        name: "footerMenu",
        type: {
          name: null,
          kind: "LIST",
        },
      },
      {
        name: "footerMenuCount",
        type: {
          name: "Int",
          kind: "SCALAR",
        },
      },
      {
        name: "commentsGUID",
        type: {
          name: "String",
          kind: "SCALAR",
        },
      },
      {
        name: "flag",
        type: {
          name: "JSON",
          kind: "SCALAR",
        },
      },
      {
        name: "hidePageHeader",
        type: {
          name: "Boolean",
          kind: "SCALAR",
        },
      },
      {
        name: "showFeaturedPosts",
        type: {
          name: "Boolean",
          kind: "SCALAR",
        },
      },
      {
        name: "showRecentPosts",
        type: {
          name: "Boolean",
          kind: "SCALAR",
        },
      },
      {
        name: "posts",
        type: {
          name: null,
          kind: "LIST",
        },
      },
      {
        name: "postsCount",
        type: {
          name: "Int",
          kind: "SCALAR",
        },
      },
    ],
  },
  {
    name: "Journalist",
    fields: [
      {
        name: "id",
        type: {
          name: null,
          kind: "NON_NULL",
        },
      },
      {
        name: "title",
        type: {
          name: "String",
          kind: "SCALAR",
        },
      },
      {
        name: "clone",
        type: {
          name: "Journalist",
          kind: "OBJECT",
        },
      },
      {
        name: "url",
        type: {
          name: "String",
          kind: "SCALAR",
        },
      },
      {
        name: "subtitle",
        type: {
          name: "String",
          kind: "SCALAR",
        },
      },
      {
        name: "slug",
        type: {
          name: "String",
          kind: "SCALAR",
        },
      },
      {
        name: "updatedAt",
        type: {
          name: "DateTime",
          kind: "SCALAR",
        },
      },
      {
        name: "status",
        type: {
          name: "String",
          kind: "SCALAR",
        },
      },
      {
        name: "publishedAt",
        type: {
          name: "DateTime",
          kind: "SCALAR",
        },
      },
      {
        name: "priority",
        type: {
          name: "Int",
          kind: "SCALAR",
        },
      },
      {
        name: "language",
        type: {
          name: "String",
          kind: "SCALAR",
        },
      },
      {
        name: "sharingImage",
        type: {
          name: "ImageFieldOutput",
          kind: "OBJECT",
        },
      },
      {
        name: "shows",
        type: {
          name: null,
          kind: "LIST",
        },
      },
      {
        name: "showsCount",
        type: {
          name: "Int",
          kind: "SCALAR",
        },
      },
      {
        name: "regions",
        type: {
          name: null,
          kind: "LIST",
        },
      },
      {
        name: "regionsCount",
        type: {
          name: "Int",
          kind: "SCALAR",
        },
      },
      {
        name: "image",
        type: {
          name: "ImageFieldOutput",
          kind: "OBJECT",
        },
      },
      {
        name: "mobileImage",
        type: {
          name: "ImageFieldOutput",
          kind: "OBJECT",
        },
      },
      {
        name: "links",
        type: {
          name: null,
          kind: "LIST",
        },
      },
      {
        name: "linksCount",
        type: {
          name: "Int",
          kind: "SCALAR",
        },
      },
      {
        name: "content",
        type: {
          name: "Journalist_content_Document",
          kind: "OBJECT",
        },
      },
      {
        name: "images",
        type: {
          name: null,
          kind: "LIST",
        },
      },
      {
        name: "imagesCount",
        type: {
          name: "Int",
          kind: "SCALAR",
        },
      },
      {
        name: "files",
        type: {
          name: null,
          kind: "LIST",
        },
      },
      {
        name: "filesCount",
        type: {
          name: "Int",
          kind: "SCALAR",
        },
      },
      {
        name: "subsections",
        type: {
          name: null,
          kind: "LIST",
        },
      },
      {
        name: "subsectionsCount",
        type: {
          name: "Int",
          kind: "SCALAR",
        },
      },
      {
        name: "popupEmbed",
        type: {
          name: "Embed",
          kind: "OBJECT",
        },
      },
      {
        name: "popupAd",
        type: {
          name: "AdGroup",
          kind: "OBJECT",
        },
      },
      {
        name: "cookieExpiry",
        type: {
          name: "Int",
          kind: "SCALAR",
        },
      },
      {
        name: "bannerAds",
        type: {
          name: null,
          kind: "LIST",
        },
      },
      {
        name: "bannerAdsCount",
        type: {
          name: "Int",
          kind: "SCALAR",
        },
      },
      {
        name: "sidebarEmbeds",
        type: {
          name: null,
          kind: "LIST",
        },
      },
      {
        name: "sidebarEmbedsCount",
        type: {
          name: "Int",
          kind: "SCALAR",
        },
      },
      {
        name: "sidebarAd",
        type: {
          name: "AdGroup",
          kind: "OBJECT",
        },
      },
      {
        name: "contentAds",
        type: {
          name: null,
          kind: "LIST",
        },
      },
      {
        name: "contentAdsCount",
        type: {
          name: "Int",
          kind: "SCALAR",
        },
      },
      {
        name: "avatar",
        type: {
          name: "ImageFieldOutput",
          kind: "OBJECT",
        },
      },
      {
        name: "hidePageHeader",
        type: {
          name: "Boolean",
          kind: "SCALAR",
        },
      },
      {
        name: "showFeaturedPosts",
        type: {
          name: "Boolean",
          kind: "SCALAR",
        },
      },
      {
        name: "showRecentPosts",
        type: {
          name: "Boolean",
          kind: "SCALAR",
        },
      },
      {
        name: "posts",
        type: {
          name: null,
          kind: "LIST",
        },
      },
      {
        name: "postsCount",
        type: {
          name: "Int",
          kind: "SCALAR",
        },
      },
    ],
  },
  {
    name: "Show",
    fields: [
      {
        name: "id",
        type: {
          name: null,
          kind: "NON_NULL",
        },
      },
      {
        name: "title",
        type: {
          name: "String",
          kind: "SCALAR",
        },
      },
      {
        name: "clone",
        type: {
          name: "Show",
          kind: "OBJECT",
        },
      },
      {
        name: "url",
        type: {
          name: "String",
          kind: "SCALAR",
        },
      },
      {
        name: "subtitle",
        type: {
          name: "String",
          kind: "SCALAR",
        },
      },
      {
        name: "slug",
        type: {
          name: "String",
          kind: "SCALAR",
        },
      },
      {
        name: "updatedAt",
        type: {
          name: "DateTime",
          kind: "SCALAR",
        },
      },
      {
        name: "status",
        type: {
          name: "String",
          kind: "SCALAR",
        },
      },
      {
        name: "publishedAt",
        type: {
          name: "DateTime",
          kind: "SCALAR",
        },
      },
      {
        name: "priority",
        type: {
          name: "Int",
          kind: "SCALAR",
        },
      },
      {
        name: "language",
        type: {
          name: "String",
          kind: "SCALAR",
        },
      },
      {
        name: "sharingImage",
        type: {
          name: "ImageFieldOutput",
          kind: "OBJECT",
        },
      },
      {
        name: "journalists",
        type: {
          name: null,
          kind: "LIST",
        },
      },
      {
        name: "journalistsCount",
        type: {
          name: "Int",
          kind: "SCALAR",
        },
      },
      {
        name: "regions",
        type: {
          name: null,
          kind: "LIST",
        },
      },
      {
        name: "regionsCount",
        type: {
          name: "Int",
          kind: "SCALAR",
        },
      },
      {
        name: "image",
        type: {
          name: "ImageFieldOutput",
          kind: "OBJECT",
        },
      },
      {
        name: "mobileImage",
        type: {
          name: "ImageFieldOutput",
          kind: "OBJECT",
        },
      },
      {
        name: "links",
        type: {
          name: null,
          kind: "LIST",
        },
      },
      {
        name: "linksCount",
        type: {
          name: "Int",
          kind: "SCALAR",
        },
      },
      {
        name: "content",
        type: {
          name: "Show_content_Document",
          kind: "OBJECT",
        },
      },
      {
        name: "images",
        type: {
          name: null,
          kind: "LIST",
        },
      },
      {
        name: "imagesCount",
        type: {
          name: "Int",
          kind: "SCALAR",
        },
      },
      {
        name: "files",
        type: {
          name: null,
          kind: "LIST",
        },
      },
      {
        name: "filesCount",
        type: {
          name: "Int",
          kind: "SCALAR",
        },
      },
      {
        name: "subsections",
        type: {
          name: null,
          kind: "LIST",
        },
      },
      {
        name: "subsectionsCount",
        type: {
          name: "Int",
          kind: "SCALAR",
        },
      },
      {
        name: "popupEmbed",
        type: {
          name: "Embed",
          kind: "OBJECT",
        },
      },
      {
        name: "popupAd",
        type: {
          name: "AdGroup",
          kind: "OBJECT",
        },
      },
      {
        name: "cookieExpiry",
        type: {
          name: "Int",
          kind: "SCALAR",
        },
      },
      {
        name: "bannerAds",
        type: {
          name: null,
          kind: "LIST",
        },
      },
      {
        name: "bannerAdsCount",
        type: {
          name: "Int",
          kind: "SCALAR",
        },
      },
      {
        name: "sidebarEmbeds",
        type: {
          name: null,
          kind: "LIST",
        },
      },
      {
        name: "sidebarEmbedsCount",
        type: {
          name: "Int",
          kind: "SCALAR",
        },
      },
      {
        name: "sidebarAd",
        type: {
          name: "AdGroup",
          kind: "OBJECT",
        },
      },
      {
        name: "contentAds",
        type: {
          name: null,
          kind: "LIST",
        },
      },
      {
        name: "contentAdsCount",
        type: {
          name: "Int",
          kind: "SCALAR",
        },
      },
      {
        name: "hidePageHeader",
        type: {
          name: "Boolean",
          kind: "SCALAR",
        },
      },
      {
        name: "showFeaturedPosts",
        type: {
          name: "Boolean",
          kind: "SCALAR",
        },
      },
      {
        name: "showRecentPosts",
        type: {
          name: "Boolean",
          kind: "SCALAR",
        },
      },
      {
        name: "posts",
        type: {
          name: null,
          kind: "LIST",
        },
      },
      {
        name: "postsCount",
        type: {
          name: "Int",
          kind: "SCALAR",
        },
      },
    ],
  },
  {
    name: "Topic",
    fields: [
      {
        name: "id",
        type: {
          name: null,
          kind: "NON_NULL",
        },
      },
      {
        name: "title",
        type: {
          name: "String",
          kind: "SCALAR",
        },
      },
      {
        name: "clone",
        type: {
          name: "Topic",
          kind: "OBJECT",
        },
      },
      {
        name: "url",
        type: {
          name: "String",
          kind: "SCALAR",
        },
      },
      {
        name: "subtitle",
        type: {
          name: "String",
          kind: "SCALAR",
        },
      },
      {
        name: "slug",
        type: {
          name: "String",
          kind: "SCALAR",
        },
      },
      {
        name: "updatedAt",
        type: {
          name: "DateTime",
          kind: "SCALAR",
        },
      },
      {
        name: "status",
        type: {
          name: "String",
          kind: "SCALAR",
        },
      },
      {
        name: "publishedAt",
        type: {
          name: "DateTime",
          kind: "SCALAR",
        },
      },
      {
        name: "priority",
        type: {
          name: "Int",
          kind: "SCALAR",
        },
      },
      {
        name: "language",
        type: {
          name: "String",
          kind: "SCALAR",
        },
      },
      {
        name: "sharingImage",
        type: {
          name: "ImageFieldOutput",
          kind: "OBJECT",
        },
      },
      {
        name: "regions",
        type: {
          name: null,
          kind: "LIST",
        },
      },
      {
        name: "regionsCount",
        type: {
          name: "Int",
          kind: "SCALAR",
        },
      },
      {
        name: "image",
        type: {
          name: "ImageFieldOutput",
          kind: "OBJECT",
        },
      },
      {
        name: "mobileImage",
        type: {
          name: "ImageFieldOutput",
          kind: "OBJECT",
        },
      },
      {
        name: "links",
        type: {
          name: null,
          kind: "LIST",
        },
      },
      {
        name: "linksCount",
        type: {
          name: "Int",
          kind: "SCALAR",
        },
      },
      {
        name: "content",
        type: {
          name: "Topic_content_Document",
          kind: "OBJECT",
        },
      },
      {
        name: "images",
        type: {
          name: null,
          kind: "LIST",
        },
      },
      {
        name: "imagesCount",
        type: {
          name: "Int",
          kind: "SCALAR",
        },
      },
      {
        name: "files",
        type: {
          name: null,
          kind: "LIST",
        },
      },
      {
        name: "filesCount",
        type: {
          name: "Int",
          kind: "SCALAR",
        },
      },
      {
        name: "subsections",
        type: {
          name: null,
          kind: "LIST",
        },
      },
      {
        name: "subsectionsCount",
        type: {
          name: "Int",
          kind: "SCALAR",
        },
      },
      {
        name: "popupEmbed",
        type: {
          name: "Embed",
          kind: "OBJECT",
        },
      },
      {
        name: "popupAd",
        type: {
          name: "AdGroup",
          kind: "OBJECT",
        },
      },
      {
        name: "cookieExpiry",
        type: {
          name: "Int",
          kind: "SCALAR",
        },
      },
      {
        name: "bannerAds",
        type: {
          name: null,
          kind: "LIST",
        },
      },
      {
        name: "bannerAdsCount",
        type: {
          name: "Int",
          kind: "SCALAR",
        },
      },
      {
        name: "sidebarEmbeds",
        type: {
          name: null,
          kind: "LIST",
        },
      },
      {
        name: "sidebarEmbedsCount",
        type: {
          name: "Int",
          kind: "SCALAR",
        },
      },
      {
        name: "sidebarAd",
        type: {
          name: "AdGroup",
          kind: "OBJECT",
        },
      },
      {
        name: "contentAds",
        type: {
          name: null,
          kind: "LIST",
        },
      },
      {
        name: "contentAdsCount",
        type: {
          name: "Int",
          kind: "SCALAR",
        },
      },
      {
        name: "trending",
        type: {
          name: "Boolean",
          kind: "SCALAR",
        },
      },
      {
        name: "hidePageHeader",
        type: {
          name: "Boolean",
          kind: "SCALAR",
        },
      },
      {
        name: "showFeaturedPosts",
        type: {
          name: "Boolean",
          kind: "SCALAR",
        },
      },
      {
        name: "showRecentPosts",
        type: {
          name: "Boolean",
          kind: "SCALAR",
        },
      },
      {
        name: "posts",
        type: {
          name: null,
          kind: "LIST",
        },
      },
      {
        name: "postsCount",
        type: {
          name: "Int",
          kind: "SCALAR",
        },
      },
    ],
  },
];

const lookupSchema = {};

for (const schema of schemas) {
  lookupSchema[schema.name] = {};

  for (const field of schema.fields) {
    lookupSchema[schema.name][field.name] = field.type;
  }
}

export default lookupSchema;
