import "dotenv/config";

import { createAuth } from "@keystone-6/auth";
import { config } from "@keystone-6/core";
import { statelessSessions, storedSessions } from "@keystone-6/core/session";
import { createClient } from "@redis/client";

import campaignLists from "./schema/campaigns/campaigns.js";
import fundistBasicLists from "./schema/campaigns/fundist/basic.js";
import fundistDonationLists from "./schema/campaigns/fundist/donation.js";
import fundistSignupLists from "./schema/campaigns/fundist/signup.js";
import categoryLists from "./schema/pages/categories.js";
import galleryLists from "./schema/pages/galleries.js";
import pageList from "./schema/pages/page.js";
import postList from "./schema/pages/post.js";
import userLists from "./schema/users.js";

const redis = createClient({ url: process.env.REDIS_URL });
redis.on("error", (err) => console.error("Redis Client Error", err));

function generateStorage(s3 = false) {
  if (s3) {
    return (types) => {
      const storage = {};

      for (const type of types) {
        storage[type + "s"] = {
          preserve: true,
          kind: "s3",
          type,
          bucketName: process.env.S3_BUCKET_NAME,
          region: process.env.S3_REGION,
          accessKeyId: process.env.S3_ACCESS_KEY_ID,
          secretAccessKey: process.env.S3_SECRET_ACCESS_KEY,
          endpoint: process.env.S3_ENDPOINT,
          acl: "public-read",
          // proxied: { baseUrl: "/${type}s" },
          // pathPrefix: "", if using bucket subfolder
        };
      }

      return storage;
    };
  }

  return (types) => {
    const storage = {};

    for (const type of types) {
      storage[type + "s"] = {
        kind: "local",
        type: type,
        generateUrl: (path) => `/${type}s${path}`,
        serverRoute: {
          path: `/${type}s`,
        },
        storagePath: `public/${type}s`,
      };
    }

    return storage;
  };
}

const { withAuth } = createAuth({
  listKey: "User",
  identityField: "email",
  sessionData: "id superuser admin permissions",
  secretField: "password",
  initFirstItem: {
    fields: ["name", "email", "password"],
    itemData: { superuser: true, admin: true },
  },
});

export default withAuth(
  config({
    db: {
      provider: process.env.DATABASE_PROVIDER,
      url: process.env.DATABASE_URL,
      // enableLogging: true,
      async onConnect() {
        if (process.env.REDIS_URL) await redis.connect();
      },
    },
    lists: {
      ...postList,
      ...categoryLists,
      ...campaignLists,
      ...pageList,
      ...userLists,
      ...galleryLists,
      ...fundistDonationLists,
      ...fundistSignupLists,
      ...fundistBasicLists,
    },
    storage: generateStorage(
      process.env.S3_STORAGE?.trim().toLowerCase() === "true",
    )(["image", "file"]),
    session: process.env.REDIS_URL
      ? storedSessions({
          store: ({ maxAge }) => ({
            async get(key) {
              const res = await redis.get(key);

              if (res && typeof res === "string") {
                return JSON.parse(res);
              }
            },
            async set(key, val) {
              await redis.set(key, JSON.stringify(val), { EX: maxAge });
            },
            async delete(key) {
              await redis.del(key);
            },
          }),
          maxAge: 60 * 60 * 24 * 30,
          secret: process.env.COOKIE_SECRET,
          secure:
            process.env.SECURE_SESSIONS?.trim() === "false" ? false : true,
        })
      : statelessSessions({
          maxAge: 60 * 60 * 24 * 30,
          secret: process.env.COOKIE_SECRET,
          secure:
            process.env.SECURE_SESSIONS?.trim() === "false" ? false : true,
        }),
    ui: {
      isAccessAllowed: (context) => !!context.session?.data.id,
      // getAdditionalFiles: [
      //   async () => {
      //     return [
      //       {
      //         mode: "copy",
      //         inputPath: `${
      //           process.env.NODE_ENV === "production"
      //             ? "/app/"
      //             : __dirname + "/../"
      //         }custom-static/script.js`,
      //         outputPath: "public/script.js",
      //       },
      //       {
      //         mode: "copy",
      //         inputPath: `${
      //           process.env.NODE_ENV === "production"
      //             ? "/app/"
      //             : __dirname + "/../"
      //         }custom-static/logo.svg`,
      //         outputPath: "public/logo.svg",
      //       },
      //     ];
      //   },
      // ],
    },
    server: {
      ...(process.env.SERVER_CORS_ORIGINS
        ? {
            // if this is set, why can access API?
            cors: {
              origin: process.env.SERVER_CORS_ORIGINS.split(",").map((origin) =>
                origin.trim(),
              ),
              credentials: true,
            },
          }
        : {}),
      extendExpressApp: (app) => {
        app.use("/api/graphql", async (req, res, next) => {
          if (process.env.NODE_ENV === "production") {
            // req.get("sec-fetch-site") === "same-origin"
            if (
              !(
                process.env.PUBLIC_GRAPHQL_API_ALLOWED_ORIGINS.split(",")
                  .map((origin) => origin.trim())
                  .includes(req.get("origin")) ||
                req.get("keystone-authorization") === process.env.API_KEY_CUSTOM
              )
            ) {
              res.status(401).end();
              return;
            }
          }

          next();
        });
      },
    },
  }),
);
