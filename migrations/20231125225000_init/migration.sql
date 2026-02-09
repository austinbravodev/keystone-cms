-- CreateTable
CREATE TABLE "Post" (
    "id" TEXT NOT NULL,
    "title" TEXT NOT NULL DEFAULT '',
    "subtitle" TEXT NOT NULL DEFAULT '',
    "clone" TEXT,
    "redirectURL" TEXT NOT NULL DEFAULT '',
    "slug" TEXT NOT NULL DEFAULT '',
    "status" TEXT DEFAULT 'published',
    "publishedAt" TIMESTAMP(3),
    "language" TEXT DEFAULT 'en',
    "sharingImage_filesize" INTEGER,
    "sharingImage_extension" TEXT,
    "sharingImage_width" INTEGER,
    "sharingImage_height" INTEGER,
    "sharingImage_id" TEXT,
    "type" TEXT DEFAULT 'news',
    "liveAt" TIMESTAMP(3),
    "ended" BOOLEAN NOT NULL DEFAULT false,
    "featured" BOOLEAN NOT NULL DEFAULT false,
    "allowComments" BOOLEAN NOT NULL DEFAULT true,
    "showRelatedPosts" BOOLEAN NOT NULL DEFAULT true,
    "featuredImage_filesize" INTEGER,
    "featuredImage_extension" TEXT,
    "featuredImage_width" INTEGER,
    "featuredImage_height" INTEGER,
    "featuredImage_id" TEXT,
    "featuredImageURL" TEXT NOT NULL DEFAULT '',
    "caption" TEXT NOT NULL DEFAULT '',
    "featuredVideo" TEXT NOT NULL DEFAULT '',
    "videoAccess" TEXT,
    "audio" TEXT NOT NULL DEFAULT '',
    "audioAccess" TEXT,
    "content" JSONB NOT NULL DEFAULT '[{"type":"paragraph","children":[{"text":""}]}]',
    "contentAccess" TEXT,
    "popupEmbed" TEXT,
    "popupAd" TEXT,
    "cookieExpiry" INTEGER DEFAULT 30,
    "sidebarAd" TEXT,

    CONSTRAINT "Post_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Link" (
    "id" TEXT NOT NULL,
    "text" TEXT NOT NULL DEFAULT '',
    "url" TEXT NOT NULL DEFAULT '',

    CONSTRAINT "Link_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "ImageLink" (
    "id" TEXT NOT NULL,
    "image_filesize" INTEGER,
    "image_extension" TEXT,
    "image_width" INTEGER,
    "image_height" INTEGER,
    "image_id" TEXT,
    "url" TEXT NOT NULL DEFAULT '',

    CONSTRAINT "ImageLink_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Subsection" (
    "id" TEXT NOT NULL,
    "topic" TEXT,
    "show" TEXT,
    "region" TEXT,
    "journalist" TEXT,

    CONSTRAINT "Subsection_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Topic" (
    "id" TEXT NOT NULL,
    "title" TEXT NOT NULL DEFAULT '',
    "subtitle" TEXT NOT NULL DEFAULT '',
    "clone" TEXT,
    "slug" TEXT NOT NULL DEFAULT '',
    "status" TEXT DEFAULT 'published',
    "publishedAt" TIMESTAMP(3),
    "language" TEXT DEFAULT 'en',
    "sharingImage_filesize" INTEGER,
    "sharingImage_extension" TEXT,
    "sharingImage_width" INTEGER,
    "sharingImage_height" INTEGER,
    "sharingImage_id" TEXT,
    "image_filesize" INTEGER,
    "image_extension" TEXT,
    "image_width" INTEGER,
    "image_height" INTEGER,
    "image_id" TEXT,
    "mobileImage_filesize" INTEGER,
    "mobileImage_extension" TEXT,
    "mobileImage_width" INTEGER,
    "mobileImage_height" INTEGER,
    "mobileImage_id" TEXT,
    "content" JSONB NOT NULL DEFAULT '[{"type":"paragraph","children":[{"text":""}]}]',
    "popupEmbed" TEXT,
    "popupAd" TEXT,
    "cookieExpiry" INTEGER DEFAULT 30,
    "sidebarAd" TEXT,
    "trending" BOOLEAN NOT NULL DEFAULT false,
    "hidePageHeader" BOOLEAN NOT NULL DEFAULT false,
    "showFeaturedPosts" BOOLEAN NOT NULL DEFAULT true,
    "showRecentPosts" BOOLEAN NOT NULL DEFAULT true,

    CONSTRAINT "Topic_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Journalist" (
    "id" TEXT NOT NULL,
    "title" TEXT NOT NULL DEFAULT '',
    "subtitle" TEXT NOT NULL DEFAULT '',
    "clone" TEXT,
    "slug" TEXT NOT NULL DEFAULT '',
    "status" TEXT DEFAULT 'published',
    "publishedAt" TIMESTAMP(3),
    "language" TEXT DEFAULT 'en',
    "sharingImage_filesize" INTEGER,
    "sharingImage_extension" TEXT,
    "sharingImage_width" INTEGER,
    "sharingImage_height" INTEGER,
    "sharingImage_id" TEXT,
    "image_filesize" INTEGER,
    "image_extension" TEXT,
    "image_width" INTEGER,
    "image_height" INTEGER,
    "image_id" TEXT,
    "mobileImage_filesize" INTEGER,
    "mobileImage_extension" TEXT,
    "mobileImage_width" INTEGER,
    "mobileImage_height" INTEGER,
    "mobileImage_id" TEXT,
    "content" JSONB NOT NULL DEFAULT '[{"type":"paragraph","children":[{"text":""}]}]',
    "popupEmbed" TEXT,
    "popupAd" TEXT,
    "cookieExpiry" INTEGER DEFAULT 30,
    "sidebarAd" TEXT,
    "avatar_filesize" INTEGER,
    "avatar_extension" TEXT,
    "avatar_width" INTEGER,
    "avatar_height" INTEGER,
    "avatar_id" TEXT,
    "hidePageHeader" BOOLEAN NOT NULL DEFAULT false,
    "showFeaturedPosts" BOOLEAN NOT NULL DEFAULT true,
    "showRecentPosts" BOOLEAN NOT NULL DEFAULT true,

    CONSTRAINT "Journalist_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Show" (
    "id" TEXT NOT NULL,
    "title" TEXT NOT NULL DEFAULT '',
    "subtitle" TEXT NOT NULL DEFAULT '',
    "clone" TEXT,
    "slug" TEXT NOT NULL DEFAULT '',
    "status" TEXT DEFAULT 'published',
    "publishedAt" TIMESTAMP(3),
    "language" TEXT DEFAULT 'en',
    "sharingImage_filesize" INTEGER,
    "sharingImage_extension" TEXT,
    "sharingImage_width" INTEGER,
    "sharingImage_height" INTEGER,
    "sharingImage_id" TEXT,
    "image_filesize" INTEGER,
    "image_extension" TEXT,
    "image_width" INTEGER,
    "image_height" INTEGER,
    "image_id" TEXT,
    "mobileImage_filesize" INTEGER,
    "mobileImage_extension" TEXT,
    "mobileImage_width" INTEGER,
    "mobileImage_height" INTEGER,
    "mobileImage_id" TEXT,
    "content" JSONB NOT NULL DEFAULT '[{"type":"paragraph","children":[{"text":""}]}]',
    "popupEmbed" TEXT,
    "popupAd" TEXT,
    "cookieExpiry" INTEGER DEFAULT 30,
    "sidebarAd" TEXT,
    "hidePageHeader" BOOLEAN NOT NULL DEFAULT false,
    "showFeaturedPosts" BOOLEAN NOT NULL DEFAULT true,
    "showRecentPosts" BOOLEAN NOT NULL DEFAULT true,

    CONSTRAINT "Show_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Region" (
    "id" TEXT NOT NULL,
    "title" TEXT NOT NULL DEFAULT '',
    "subtitle" TEXT NOT NULL DEFAULT '',
    "clone" TEXT,
    "abbreviation" TEXT NOT NULL DEFAULT '',
    "slug" TEXT NOT NULL DEFAULT '',
    "status" TEXT DEFAULT 'published',
    "publishedAt" TIMESTAMP(3),
    "language" TEXT DEFAULT 'en',
    "sharingImage_filesize" INTEGER,
    "sharingImage_extension" TEXT,
    "sharingImage_width" INTEGER,
    "sharingImage_height" INTEGER,
    "sharingImage_id" TEXT,
    "image_filesize" INTEGER,
    "image_extension" TEXT,
    "image_width" INTEGER,
    "image_height" INTEGER,
    "image_id" TEXT,
    "mobileImage_filesize" INTEGER,
    "mobileImage_extension" TEXT,
    "mobileImage_width" INTEGER,
    "mobileImage_height" INTEGER,
    "mobileImage_id" TEXT,
    "content" JSONB NOT NULL DEFAULT '[{"type":"paragraph","children":[{"text":""}]}]',
    "popupEmbed" TEXT,
    "popupAd" TEXT,
    "cookieExpiry" INTEGER DEFAULT 30,
    "sidebarAd" TEXT,
    "logo_filesize" INTEGER,
    "logo_extension" TEXT,
    "logo_width" INTEGER,
    "logo_height" INTEGER,
    "logo_id" TEXT,
    "sideMenu" TEXT NOT NULL DEFAULT '',
    "hidePageHeader" BOOLEAN NOT NULL DEFAULT false,
    "showFeaturedPosts" BOOLEAN NOT NULL DEFAULT true,
    "showRecentPosts" BOOLEAN NOT NULL DEFAULT true,

    CONSTRAINT "Region_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "PopupAd" (
    "id" TEXT NOT NULL,
    "image_filesize" INTEGER,
    "image_extension" TEXT,
    "image_width" INTEGER,
    "image_height" INTEGER,
    "image_id" TEXT,
    "mobileImage_filesize" INTEGER,
    "mobileImage_extension" TEXT,
    "mobileImage_width" INTEGER,
    "mobileImage_height" INTEGER,
    "mobileImage_id" TEXT,

    CONSTRAINT "PopupAd_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "BannerAd" (
    "id" TEXT NOT NULL,
    "image_filesize" INTEGER,
    "image_extension" TEXT,
    "image_width" INTEGER,
    "image_height" INTEGER,
    "image_id" TEXT,
    "mobileImage_filesize" INTEGER,
    "mobileImage_extension" TEXT,
    "mobileImage_width" INTEGER,
    "mobileImage_height" INTEGER,
    "mobileImage_id" TEXT,

    CONSTRAINT "BannerAd_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "ContentAd" (
    "id" TEXT NOT NULL,
    "image_filesize" INTEGER,
    "image_extension" TEXT,
    "image_width" INTEGER,
    "image_height" INTEGER,
    "image_id" TEXT,
    "mobileImage_filesize" INTEGER,
    "mobileImage_extension" TEXT,
    "mobileImage_width" INTEGER,
    "mobileImage_height" INTEGER,
    "mobileImage_id" TEXT,

    CONSTRAINT "ContentAd_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "SidebarAd" (
    "id" TEXT NOT NULL,
    "image_filesize" INTEGER,
    "image_extension" TEXT,
    "image_width" INTEGER,
    "image_height" INTEGER,
    "image_id" TEXT,
    "mobileImage_filesize" INTEGER,
    "mobileImage_extension" TEXT,
    "mobileImage_width" INTEGER,
    "mobileImage_height" INTEGER,
    "mobileImage_id" TEXT,

    CONSTRAINT "SidebarAd_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Embed" (
    "id" TEXT NOT NULL,
    "label" TEXT NOT NULL DEFAULT '',
    "code" TEXT NOT NULL DEFAULT '',
    "tag" TEXT NOT NULL DEFAULT '',

    CONSTRAINT "Embed_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "AdGroup" (
    "id" TEXT NOT NULL,
    "alt" TEXT NOT NULL DEFAULT '',
    "link" TEXT NOT NULL DEFAULT '',
    "tag" TEXT NOT NULL DEFAULT '',
    "popupAd" TEXT,
    "bannerAd" TEXT,
    "contentAd" TEXT,
    "sidebarAd" TEXT,

    CONSTRAINT "AdGroup_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Page" (
    "id" TEXT NOT NULL,
    "title" TEXT NOT NULL DEFAULT '',
    "subtitle" TEXT NOT NULL DEFAULT '',
    "clone" TEXT,
    "redirectURL" TEXT NOT NULL DEFAULT '',
    "slug" TEXT NOT NULL DEFAULT '',
    "status" TEXT DEFAULT 'published',
    "publishedAt" TIMESTAMP(3),
    "language" TEXT DEFAULT 'en',
    "sharingImage_filesize" INTEGER,
    "sharingImage_extension" TEXT,
    "sharingImage_width" INTEGER,
    "sharingImage_height" INTEGER,
    "sharingImage_id" TEXT,
    "allowComments" BOOLEAN NOT NULL DEFAULT false,
    "featuredImage_filesize" INTEGER,
    "featuredImage_extension" TEXT,
    "featuredImage_width" INTEGER,
    "featuredImage_height" INTEGER,
    "featuredImage_id" TEXT,
    "featuredImageURL" TEXT NOT NULL DEFAULT '',
    "caption" TEXT NOT NULL DEFAULT '',
    "featuredVideo" TEXT NOT NULL DEFAULT '',
    "videoAccess" TEXT,
    "audio" TEXT NOT NULL DEFAULT '',
    "audioAccess" TEXT,
    "content" JSONB NOT NULL DEFAULT '[{"type":"paragraph","children":[{"text":""}]}]',
    "contentAccess" TEXT,
    "popupEmbed" TEXT,
    "popupAd" TEXT,
    "cookieExpiry" INTEGER DEFAULT 30,
    "sidebarAd" TEXT,

    CONSTRAINT "Page_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Role" (
    "id" TEXT NOT NULL,
    "name" TEXT NOT NULL DEFAULT '',
    "region" TEXT,
    "admin" BOOLEAN NOT NULL DEFAULT false,
    "permissions" JSONB NOT NULL DEFAULT '[]',

    CONSTRAINT "Role_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "User" (
    "id" TEXT NOT NULL,
    "name" TEXT NOT NULL DEFAULT '',
    "email" TEXT NOT NULL DEFAULT '',
    "password" TEXT NOT NULL,
    "language" TEXT DEFAULT 'en',
    "superuser" BOOLEAN NOT NULL DEFAULT false,

    CONSTRAINT "User_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "File" (
    "id" TEXT NOT NULL,
    "file_filesize" INTEGER,
    "file_filename" TEXT,
    "title" TEXT NOT NULL DEFAULT '',

    CONSTRAINT "File_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Image" (
    "id" TEXT NOT NULL,
    "image_filesize" INTEGER,
    "image_extension" TEXT,
    "image_width" INTEGER,
    "image_height" INTEGER,
    "image_id" TEXT,
    "alt" TEXT NOT NULL DEFAULT '',
    "caption" TEXT NOT NULL DEFAULT '',

    CONSTRAINT "Image_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "_Post_shows" (
    "A" TEXT NOT NULL,
    "B" TEXT NOT NULL
);

-- CreateTable
CREATE TABLE "_Post_regions" (
    "A" TEXT NOT NULL,
    "B" TEXT NOT NULL
);

-- CreateTable
CREATE TABLE "_Post_topics" (
    "A" TEXT NOT NULL,
    "B" TEXT NOT NULL
);

-- CreateTable
CREATE TABLE "_Topic_links" (
    "A" TEXT NOT NULL,
    "B" TEXT NOT NULL
);

-- CreateTable
CREATE TABLE "_Show_links" (
    "A" TEXT NOT NULL,
    "B" TEXT NOT NULL
);

-- CreateTable
CREATE TABLE "_Region_links" (
    "A" TEXT NOT NULL,
    "B" TEXT NOT NULL
);

-- CreateTable
CREATE TABLE "_Region_buttons" (
    "A" TEXT NOT NULL,
    "B" TEXT NOT NULL
);

-- CreateTable
CREATE TABLE "_Region_footerMenu" (
    "A" TEXT NOT NULL,
    "B" TEXT NOT NULL
);

-- CreateTable
CREATE TABLE "_Region_socialLinks" (
    "A" TEXT NOT NULL,
    "B" TEXT NOT NULL
);

-- CreateTable
CREATE TABLE "_Topic_subsections" (
    "A" TEXT NOT NULL,
    "B" TEXT NOT NULL
);

-- CreateTable
CREATE TABLE "_Journalist_shows" (
    "A" TEXT NOT NULL,
    "B" TEXT NOT NULL
);

-- CreateTable
CREATE TABLE "_Journalist_regions" (
    "A" TEXT NOT NULL,
    "B" TEXT NOT NULL
);

-- CreateTable
CREATE TABLE "_Journalist_links" (
    "A" TEXT NOT NULL,
    "B" TEXT NOT NULL
);

-- CreateTable
CREATE TABLE "_Journalist_subsections" (
    "A" TEXT NOT NULL,
    "B" TEXT NOT NULL
);

-- CreateTable
CREATE TABLE "_Journalist_posts" (
    "A" TEXT NOT NULL,
    "B" TEXT NOT NULL
);

-- CreateTable
CREATE TABLE "_Page_journalists" (
    "A" TEXT NOT NULL,
    "B" TEXT NOT NULL
);

-- CreateTable
CREATE TABLE "_Show_subsections" (
    "A" TEXT NOT NULL,
    "B" TEXT NOT NULL
);

-- CreateTable
CREATE TABLE "_Region_shows" (
    "A" TEXT NOT NULL,
    "B" TEXT NOT NULL
);

-- CreateTable
CREATE TABLE "_Region_topics" (
    "A" TEXT NOT NULL,
    "B" TEXT NOT NULL
);

-- CreateTable
CREATE TABLE "_Region_subsections" (
    "A" TEXT NOT NULL,
    "B" TEXT NOT NULL
);

-- CreateTable
CREATE TABLE "_User_regions" (
    "A" TEXT NOT NULL,
    "B" TEXT NOT NULL
);

-- CreateTable
CREATE TABLE "_Embed_regions" (
    "A" TEXT NOT NULL,
    "B" TEXT NOT NULL
);

-- CreateTable
CREATE TABLE "_Post_sidebarEmbeds" (
    "A" TEXT NOT NULL,
    "B" TEXT NOT NULL
);

-- CreateTable
CREATE TABLE "_Topic_sidebarEmbeds" (
    "A" TEXT NOT NULL,
    "B" TEXT NOT NULL
);

-- CreateTable
CREATE TABLE "_Journalist_sidebarEmbeds" (
    "A" TEXT NOT NULL,
    "B" TEXT NOT NULL
);

-- CreateTable
CREATE TABLE "_Show_sidebarEmbeds" (
    "A" TEXT NOT NULL,
    "B" TEXT NOT NULL
);

-- CreateTable
CREATE TABLE "_Region_sidebarEmbeds" (
    "A" TEXT NOT NULL,
    "B" TEXT NOT NULL
);

-- CreateTable
CREATE TABLE "_Page_sidebarEmbeds" (
    "A" TEXT NOT NULL,
    "B" TEXT NOT NULL
);

-- CreateTable
CREATE TABLE "_AdGroup_regions" (
    "A" TEXT NOT NULL,
    "B" TEXT NOT NULL
);

-- CreateTable
CREATE TABLE "_Post_bannerAds" (
    "A" TEXT NOT NULL,
    "B" TEXT NOT NULL
);

-- CreateTable
CREATE TABLE "_Post_contentAds" (
    "A" TEXT NOT NULL,
    "B" TEXT NOT NULL
);

-- CreateTable
CREATE TABLE "_Topic_bannerAds" (
    "A" TEXT NOT NULL,
    "B" TEXT NOT NULL
);

-- CreateTable
CREATE TABLE "_Topic_contentAds" (
    "A" TEXT NOT NULL,
    "B" TEXT NOT NULL
);

-- CreateTable
CREATE TABLE "_Journalist_bannerAds" (
    "A" TEXT NOT NULL,
    "B" TEXT NOT NULL
);

-- CreateTable
CREATE TABLE "_Journalist_contentAds" (
    "A" TEXT NOT NULL,
    "B" TEXT NOT NULL
);

-- CreateTable
CREATE TABLE "_Show_bannerAds" (
    "A" TEXT NOT NULL,
    "B" TEXT NOT NULL
);

-- CreateTable
CREATE TABLE "_Show_contentAds" (
    "A" TEXT NOT NULL,
    "B" TEXT NOT NULL
);

-- CreateTable
CREATE TABLE "_Region_bannerAds" (
    "A" TEXT NOT NULL,
    "B" TEXT NOT NULL
);

-- CreateTable
CREATE TABLE "_Region_contentAds" (
    "A" TEXT NOT NULL,
    "B" TEXT NOT NULL
);

-- CreateTable
CREATE TABLE "_Page_bannerAds" (
    "A" TEXT NOT NULL,
    "B" TEXT NOT NULL
);

-- CreateTable
CREATE TABLE "_Page_contentAds" (
    "A" TEXT NOT NULL,
    "B" TEXT NOT NULL
);

-- CreateTable
CREATE TABLE "_Page_shows" (
    "A" TEXT NOT NULL,
    "B" TEXT NOT NULL
);

-- CreateTable
CREATE TABLE "_Page_regions" (
    "A" TEXT NOT NULL,
    "B" TEXT NOT NULL
);

-- CreateTable
CREATE TABLE "_Page_topics" (
    "A" TEXT NOT NULL,
    "B" TEXT NOT NULL
);

-- CreateTable
CREATE TABLE "_User_roles" (
    "A" TEXT NOT NULL,
    "B" TEXT NOT NULL
);

-- CreateTable
CREATE TABLE "_Post_files" (
    "A" TEXT NOT NULL,
    "B" TEXT NOT NULL
);

-- CreateTable
CREATE TABLE "_Topic_files" (
    "A" TEXT NOT NULL,
    "B" TEXT NOT NULL
);

-- CreateTable
CREATE TABLE "_Journalist_files" (
    "A" TEXT NOT NULL,
    "B" TEXT NOT NULL
);

-- CreateTable
CREATE TABLE "_Show_files" (
    "A" TEXT NOT NULL,
    "B" TEXT NOT NULL
);

-- CreateTable
CREATE TABLE "_Region_files" (
    "A" TEXT NOT NULL,
    "B" TEXT NOT NULL
);

-- CreateTable
CREATE TABLE "_Page_files" (
    "A" TEXT NOT NULL,
    "B" TEXT NOT NULL
);

-- CreateTable
CREATE TABLE "_Post_images" (
    "A" TEXT NOT NULL,
    "B" TEXT NOT NULL
);

-- CreateTable
CREATE TABLE "_Topic_images" (
    "A" TEXT NOT NULL,
    "B" TEXT NOT NULL
);

-- CreateTable
CREATE TABLE "_Journalist_images" (
    "A" TEXT NOT NULL,
    "B" TEXT NOT NULL
);

-- CreateTable
CREATE TABLE "_Show_images" (
    "A" TEXT NOT NULL,
    "B" TEXT NOT NULL
);

-- CreateTable
CREATE TABLE "_Region_images" (
    "A" TEXT NOT NULL,
    "B" TEXT NOT NULL
);

-- CreateTable
CREATE TABLE "_Page_images" (
    "A" TEXT NOT NULL,
    "B" TEXT NOT NULL
);

-- CreateIndex
CREATE UNIQUE INDEX "Post_slug_key" ON "Post"("slug");

-- CreateIndex
CREATE INDEX "Post_clone_idx" ON "Post"("clone");

-- CreateIndex
CREATE INDEX "Post_popupEmbed_idx" ON "Post"("popupEmbed");

-- CreateIndex
CREATE INDEX "Post_popupAd_idx" ON "Post"("popupAd");

-- CreateIndex
CREATE INDEX "Post_sidebarAd_idx" ON "Post"("sidebarAd");

-- CreateIndex
CREATE INDEX "Subsection_topic_idx" ON "Subsection"("topic");

-- CreateIndex
CREATE INDEX "Subsection_show_idx" ON "Subsection"("show");

-- CreateIndex
CREATE INDEX "Subsection_region_idx" ON "Subsection"("region");

-- CreateIndex
CREATE INDEX "Subsection_journalist_idx" ON "Subsection"("journalist");

-- CreateIndex
CREATE UNIQUE INDEX "Topic_slug_key" ON "Topic"("slug");

-- CreateIndex
CREATE INDEX "Topic_clone_idx" ON "Topic"("clone");

-- CreateIndex
CREATE INDEX "Topic_popupEmbed_idx" ON "Topic"("popupEmbed");

-- CreateIndex
CREATE INDEX "Topic_popupAd_idx" ON "Topic"("popupAd");

-- CreateIndex
CREATE INDEX "Topic_sidebarAd_idx" ON "Topic"("sidebarAd");

-- CreateIndex
CREATE UNIQUE INDEX "Journalist_slug_key" ON "Journalist"("slug");

-- CreateIndex
CREATE INDEX "Journalist_clone_idx" ON "Journalist"("clone");

-- CreateIndex
CREATE INDEX "Journalist_popupEmbed_idx" ON "Journalist"("popupEmbed");

-- CreateIndex
CREATE INDEX "Journalist_popupAd_idx" ON "Journalist"("popupAd");

-- CreateIndex
CREATE INDEX "Journalist_sidebarAd_idx" ON "Journalist"("sidebarAd");

-- CreateIndex
CREATE UNIQUE INDEX "Show_slug_key" ON "Show"("slug");

-- CreateIndex
CREATE INDEX "Show_clone_idx" ON "Show"("clone");

-- CreateIndex
CREATE INDEX "Show_popupEmbed_idx" ON "Show"("popupEmbed");

-- CreateIndex
CREATE INDEX "Show_popupAd_idx" ON "Show"("popupAd");

-- CreateIndex
CREATE INDEX "Show_sidebarAd_idx" ON "Show"("sidebarAd");

-- CreateIndex
CREATE UNIQUE INDEX "Region_slug_key" ON "Region"("slug");

-- CreateIndex
CREATE INDEX "Region_clone_idx" ON "Region"("clone");

-- CreateIndex
CREATE INDEX "Region_popupEmbed_idx" ON "Region"("popupEmbed");

-- CreateIndex
CREATE INDEX "Region_popupAd_idx" ON "Region"("popupAd");

-- CreateIndex
CREATE INDEX "Region_sidebarAd_idx" ON "Region"("sidebarAd");

-- CreateIndex
CREATE UNIQUE INDEX "AdGroup_popupAd_key" ON "AdGroup"("popupAd");

-- CreateIndex
CREATE UNIQUE INDEX "AdGroup_bannerAd_key" ON "AdGroup"("bannerAd");

-- CreateIndex
CREATE UNIQUE INDEX "AdGroup_contentAd_key" ON "AdGroup"("contentAd");

-- CreateIndex
CREATE UNIQUE INDEX "AdGroup_sidebarAd_key" ON "AdGroup"("sidebarAd");

-- CreateIndex
CREATE UNIQUE INDEX "Page_slug_key" ON "Page"("slug");

-- CreateIndex
CREATE INDEX "Page_clone_idx" ON "Page"("clone");

-- CreateIndex
CREATE INDEX "Page_popupEmbed_idx" ON "Page"("popupEmbed");

-- CreateIndex
CREATE INDEX "Page_popupAd_idx" ON "Page"("popupAd");

-- CreateIndex
CREATE INDEX "Page_sidebarAd_idx" ON "Page"("sidebarAd");

-- CreateIndex
CREATE UNIQUE INDEX "Role_name_key" ON "Role"("name");

-- CreateIndex
CREATE INDEX "Role_region_idx" ON "Role"("region");

-- CreateIndex
CREATE UNIQUE INDEX "User_email_key" ON "User"("email");

-- CreateIndex
CREATE UNIQUE INDEX "_Post_shows_AB_unique" ON "_Post_shows"("A", "B");

-- CreateIndex
CREATE INDEX "_Post_shows_B_index" ON "_Post_shows"("B");

-- CreateIndex
CREATE UNIQUE INDEX "_Post_regions_AB_unique" ON "_Post_regions"("A", "B");

-- CreateIndex
CREATE INDEX "_Post_regions_B_index" ON "_Post_regions"("B");

-- CreateIndex
CREATE UNIQUE INDEX "_Post_topics_AB_unique" ON "_Post_topics"("A", "B");

-- CreateIndex
CREATE INDEX "_Post_topics_B_index" ON "_Post_topics"("B");

-- CreateIndex
CREATE UNIQUE INDEX "_Topic_links_AB_unique" ON "_Topic_links"("A", "B");

-- CreateIndex
CREATE INDEX "_Topic_links_B_index" ON "_Topic_links"("B");

-- CreateIndex
CREATE UNIQUE INDEX "_Show_links_AB_unique" ON "_Show_links"("A", "B");

-- CreateIndex
CREATE INDEX "_Show_links_B_index" ON "_Show_links"("B");

-- CreateIndex
CREATE UNIQUE INDEX "_Region_links_AB_unique" ON "_Region_links"("A", "B");

-- CreateIndex
CREATE INDEX "_Region_links_B_index" ON "_Region_links"("B");

-- CreateIndex
CREATE UNIQUE INDEX "_Region_buttons_AB_unique" ON "_Region_buttons"("A", "B");

-- CreateIndex
CREATE INDEX "_Region_buttons_B_index" ON "_Region_buttons"("B");

-- CreateIndex
CREATE UNIQUE INDEX "_Region_footerMenu_AB_unique" ON "_Region_footerMenu"("A", "B");

-- CreateIndex
CREATE INDEX "_Region_footerMenu_B_index" ON "_Region_footerMenu"("B");

-- CreateIndex
CREATE UNIQUE INDEX "_Region_socialLinks_AB_unique" ON "_Region_socialLinks"("A", "B");

-- CreateIndex
CREATE INDEX "_Region_socialLinks_B_index" ON "_Region_socialLinks"("B");

-- CreateIndex
CREATE UNIQUE INDEX "_Topic_subsections_AB_unique" ON "_Topic_subsections"("A", "B");

-- CreateIndex
CREATE INDEX "_Topic_subsections_B_index" ON "_Topic_subsections"("B");

-- CreateIndex
CREATE UNIQUE INDEX "_Journalist_shows_AB_unique" ON "_Journalist_shows"("A", "B");

-- CreateIndex
CREATE INDEX "_Journalist_shows_B_index" ON "_Journalist_shows"("B");

-- CreateIndex
CREATE UNIQUE INDEX "_Journalist_regions_AB_unique" ON "_Journalist_regions"("A", "B");

-- CreateIndex
CREATE INDEX "_Journalist_regions_B_index" ON "_Journalist_regions"("B");

-- CreateIndex
CREATE UNIQUE INDEX "_Journalist_links_AB_unique" ON "_Journalist_links"("A", "B");

-- CreateIndex
CREATE INDEX "_Journalist_links_B_index" ON "_Journalist_links"("B");

-- CreateIndex
CREATE UNIQUE INDEX "_Journalist_subsections_AB_unique" ON "_Journalist_subsections"("A", "B");

-- CreateIndex
CREATE INDEX "_Journalist_subsections_B_index" ON "_Journalist_subsections"("B");

-- CreateIndex
CREATE UNIQUE INDEX "_Journalist_posts_AB_unique" ON "_Journalist_posts"("A", "B");

-- CreateIndex
CREATE INDEX "_Journalist_posts_B_index" ON "_Journalist_posts"("B");

-- CreateIndex
CREATE UNIQUE INDEX "_Page_journalists_AB_unique" ON "_Page_journalists"("A", "B");

-- CreateIndex
CREATE INDEX "_Page_journalists_B_index" ON "_Page_journalists"("B");

-- CreateIndex
CREATE UNIQUE INDEX "_Show_subsections_AB_unique" ON "_Show_subsections"("A", "B");

-- CreateIndex
CREATE INDEX "_Show_subsections_B_index" ON "_Show_subsections"("B");

-- CreateIndex
CREATE UNIQUE INDEX "_Region_shows_AB_unique" ON "_Region_shows"("A", "B");

-- CreateIndex
CREATE INDEX "_Region_shows_B_index" ON "_Region_shows"("B");

-- CreateIndex
CREATE UNIQUE INDEX "_Region_topics_AB_unique" ON "_Region_topics"("A", "B");

-- CreateIndex
CREATE INDEX "_Region_topics_B_index" ON "_Region_topics"("B");

-- CreateIndex
CREATE UNIQUE INDEX "_Region_subsections_AB_unique" ON "_Region_subsections"("A", "B");

-- CreateIndex
CREATE INDEX "_Region_subsections_B_index" ON "_Region_subsections"("B");

-- CreateIndex
CREATE UNIQUE INDEX "_User_regions_AB_unique" ON "_User_regions"("A", "B");

-- CreateIndex
CREATE INDEX "_User_regions_B_index" ON "_User_regions"("B");

-- CreateIndex
CREATE UNIQUE INDEX "_Embed_regions_AB_unique" ON "_Embed_regions"("A", "B");

-- CreateIndex
CREATE INDEX "_Embed_regions_B_index" ON "_Embed_regions"("B");

-- CreateIndex
CREATE UNIQUE INDEX "_Post_sidebarEmbeds_AB_unique" ON "_Post_sidebarEmbeds"("A", "B");

-- CreateIndex
CREATE INDEX "_Post_sidebarEmbeds_B_index" ON "_Post_sidebarEmbeds"("B");

-- CreateIndex
CREATE UNIQUE INDEX "_Topic_sidebarEmbeds_AB_unique" ON "_Topic_sidebarEmbeds"("A", "B");

-- CreateIndex
CREATE INDEX "_Topic_sidebarEmbeds_B_index" ON "_Topic_sidebarEmbeds"("B");

-- CreateIndex
CREATE UNIQUE INDEX "_Journalist_sidebarEmbeds_AB_unique" ON "_Journalist_sidebarEmbeds"("A", "B");

-- CreateIndex
CREATE INDEX "_Journalist_sidebarEmbeds_B_index" ON "_Journalist_sidebarEmbeds"("B");

-- CreateIndex
CREATE UNIQUE INDEX "_Show_sidebarEmbeds_AB_unique" ON "_Show_sidebarEmbeds"("A", "B");

-- CreateIndex
CREATE INDEX "_Show_sidebarEmbeds_B_index" ON "_Show_sidebarEmbeds"("B");

-- CreateIndex
CREATE UNIQUE INDEX "_Region_sidebarEmbeds_AB_unique" ON "_Region_sidebarEmbeds"("A", "B");

-- CreateIndex
CREATE INDEX "_Region_sidebarEmbeds_B_index" ON "_Region_sidebarEmbeds"("B");

-- CreateIndex
CREATE UNIQUE INDEX "_Page_sidebarEmbeds_AB_unique" ON "_Page_sidebarEmbeds"("A", "B");

-- CreateIndex
CREATE INDEX "_Page_sidebarEmbeds_B_index" ON "_Page_sidebarEmbeds"("B");

-- CreateIndex
CREATE UNIQUE INDEX "_AdGroup_regions_AB_unique" ON "_AdGroup_regions"("A", "B");

-- CreateIndex
CREATE INDEX "_AdGroup_regions_B_index" ON "_AdGroup_regions"("B");

-- CreateIndex
CREATE UNIQUE INDEX "_Post_bannerAds_AB_unique" ON "_Post_bannerAds"("A", "B");

-- CreateIndex
CREATE INDEX "_Post_bannerAds_B_index" ON "_Post_bannerAds"("B");

-- CreateIndex
CREATE UNIQUE INDEX "_Post_contentAds_AB_unique" ON "_Post_contentAds"("A", "B");

-- CreateIndex
CREATE INDEX "_Post_contentAds_B_index" ON "_Post_contentAds"("B");

-- CreateIndex
CREATE UNIQUE INDEX "_Topic_bannerAds_AB_unique" ON "_Topic_bannerAds"("A", "B");

-- CreateIndex
CREATE INDEX "_Topic_bannerAds_B_index" ON "_Topic_bannerAds"("B");

-- CreateIndex
CREATE UNIQUE INDEX "_Topic_contentAds_AB_unique" ON "_Topic_contentAds"("A", "B");

-- CreateIndex
CREATE INDEX "_Topic_contentAds_B_index" ON "_Topic_contentAds"("B");

-- CreateIndex
CREATE UNIQUE INDEX "_Journalist_bannerAds_AB_unique" ON "_Journalist_bannerAds"("A", "B");

-- CreateIndex
CREATE INDEX "_Journalist_bannerAds_B_index" ON "_Journalist_bannerAds"("B");

-- CreateIndex
CREATE UNIQUE INDEX "_Journalist_contentAds_AB_unique" ON "_Journalist_contentAds"("A", "B");

-- CreateIndex
CREATE INDEX "_Journalist_contentAds_B_index" ON "_Journalist_contentAds"("B");

-- CreateIndex
CREATE UNIQUE INDEX "_Show_bannerAds_AB_unique" ON "_Show_bannerAds"("A", "B");

-- CreateIndex
CREATE INDEX "_Show_bannerAds_B_index" ON "_Show_bannerAds"("B");

-- CreateIndex
CREATE UNIQUE INDEX "_Show_contentAds_AB_unique" ON "_Show_contentAds"("A", "B");

-- CreateIndex
CREATE INDEX "_Show_contentAds_B_index" ON "_Show_contentAds"("B");

-- CreateIndex
CREATE UNIQUE INDEX "_Region_bannerAds_AB_unique" ON "_Region_bannerAds"("A", "B");

-- CreateIndex
CREATE INDEX "_Region_bannerAds_B_index" ON "_Region_bannerAds"("B");

-- CreateIndex
CREATE UNIQUE INDEX "_Region_contentAds_AB_unique" ON "_Region_contentAds"("A", "B");

-- CreateIndex
CREATE INDEX "_Region_contentAds_B_index" ON "_Region_contentAds"("B");

-- CreateIndex
CREATE UNIQUE INDEX "_Page_bannerAds_AB_unique" ON "_Page_bannerAds"("A", "B");

-- CreateIndex
CREATE INDEX "_Page_bannerAds_B_index" ON "_Page_bannerAds"("B");

-- CreateIndex
CREATE UNIQUE INDEX "_Page_contentAds_AB_unique" ON "_Page_contentAds"("A", "B");

-- CreateIndex
CREATE INDEX "_Page_contentAds_B_index" ON "_Page_contentAds"("B");

-- CreateIndex
CREATE UNIQUE INDEX "_Page_shows_AB_unique" ON "_Page_shows"("A", "B");

-- CreateIndex
CREATE INDEX "_Page_shows_B_index" ON "_Page_shows"("B");

-- CreateIndex
CREATE UNIQUE INDEX "_Page_regions_AB_unique" ON "_Page_regions"("A", "B");

-- CreateIndex
CREATE INDEX "_Page_regions_B_index" ON "_Page_regions"("B");

-- CreateIndex
CREATE UNIQUE INDEX "_Page_topics_AB_unique" ON "_Page_topics"("A", "B");

-- CreateIndex
CREATE INDEX "_Page_topics_B_index" ON "_Page_topics"("B");

-- CreateIndex
CREATE UNIQUE INDEX "_User_roles_AB_unique" ON "_User_roles"("A", "B");

-- CreateIndex
CREATE INDEX "_User_roles_B_index" ON "_User_roles"("B");

-- CreateIndex
CREATE UNIQUE INDEX "_Post_files_AB_unique" ON "_Post_files"("A", "B");

-- CreateIndex
CREATE INDEX "_Post_files_B_index" ON "_Post_files"("B");

-- CreateIndex
CREATE UNIQUE INDEX "_Topic_files_AB_unique" ON "_Topic_files"("A", "B");

-- CreateIndex
CREATE INDEX "_Topic_files_B_index" ON "_Topic_files"("B");

-- CreateIndex
CREATE UNIQUE INDEX "_Journalist_files_AB_unique" ON "_Journalist_files"("A", "B");

-- CreateIndex
CREATE INDEX "_Journalist_files_B_index" ON "_Journalist_files"("B");

-- CreateIndex
CREATE UNIQUE INDEX "_Show_files_AB_unique" ON "_Show_files"("A", "B");

-- CreateIndex
CREATE INDEX "_Show_files_B_index" ON "_Show_files"("B");

-- CreateIndex
CREATE UNIQUE INDEX "_Region_files_AB_unique" ON "_Region_files"("A", "B");

-- CreateIndex
CREATE INDEX "_Region_files_B_index" ON "_Region_files"("B");

-- CreateIndex
CREATE UNIQUE INDEX "_Page_files_AB_unique" ON "_Page_files"("A", "B");

-- CreateIndex
CREATE INDEX "_Page_files_B_index" ON "_Page_files"("B");

-- CreateIndex
CREATE UNIQUE INDEX "_Post_images_AB_unique" ON "_Post_images"("A", "B");

-- CreateIndex
CREATE INDEX "_Post_images_B_index" ON "_Post_images"("B");

-- CreateIndex
CREATE UNIQUE INDEX "_Topic_images_AB_unique" ON "_Topic_images"("A", "B");

-- CreateIndex
CREATE INDEX "_Topic_images_B_index" ON "_Topic_images"("B");

-- CreateIndex
CREATE UNIQUE INDEX "_Journalist_images_AB_unique" ON "_Journalist_images"("A", "B");

-- CreateIndex
CREATE INDEX "_Journalist_images_B_index" ON "_Journalist_images"("B");

-- CreateIndex
CREATE UNIQUE INDEX "_Show_images_AB_unique" ON "_Show_images"("A", "B");

-- CreateIndex
CREATE INDEX "_Show_images_B_index" ON "_Show_images"("B");

-- CreateIndex
CREATE UNIQUE INDEX "_Region_images_AB_unique" ON "_Region_images"("A", "B");

-- CreateIndex
CREATE INDEX "_Region_images_B_index" ON "_Region_images"("B");

-- CreateIndex
CREATE UNIQUE INDEX "_Page_images_AB_unique" ON "_Page_images"("A", "B");

-- CreateIndex
CREATE INDEX "_Page_images_B_index" ON "_Page_images"("B");

-- AddForeignKey
ALTER TABLE "Post" ADD CONSTRAINT "Post_clone_fkey" FOREIGN KEY ("clone") REFERENCES "Post"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Post" ADD CONSTRAINT "Post_popupEmbed_fkey" FOREIGN KEY ("popupEmbed") REFERENCES "Embed"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Post" ADD CONSTRAINT "Post_popupAd_fkey" FOREIGN KEY ("popupAd") REFERENCES "AdGroup"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Post" ADD CONSTRAINT "Post_sidebarAd_fkey" FOREIGN KEY ("sidebarAd") REFERENCES "AdGroup"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Subsection" ADD CONSTRAINT "Subsection_topic_fkey" FOREIGN KEY ("topic") REFERENCES "Topic"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Subsection" ADD CONSTRAINT "Subsection_show_fkey" FOREIGN KEY ("show") REFERENCES "Show"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Subsection" ADD CONSTRAINT "Subsection_region_fkey" FOREIGN KEY ("region") REFERENCES "Region"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Subsection" ADD CONSTRAINT "Subsection_journalist_fkey" FOREIGN KEY ("journalist") REFERENCES "Journalist"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Topic" ADD CONSTRAINT "Topic_clone_fkey" FOREIGN KEY ("clone") REFERENCES "Topic"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Topic" ADD CONSTRAINT "Topic_popupEmbed_fkey" FOREIGN KEY ("popupEmbed") REFERENCES "Embed"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Topic" ADD CONSTRAINT "Topic_popupAd_fkey" FOREIGN KEY ("popupAd") REFERENCES "AdGroup"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Topic" ADD CONSTRAINT "Topic_sidebarAd_fkey" FOREIGN KEY ("sidebarAd") REFERENCES "AdGroup"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Journalist" ADD CONSTRAINT "Journalist_clone_fkey" FOREIGN KEY ("clone") REFERENCES "Journalist"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Journalist" ADD CONSTRAINT "Journalist_popupEmbed_fkey" FOREIGN KEY ("popupEmbed") REFERENCES "Embed"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Journalist" ADD CONSTRAINT "Journalist_popupAd_fkey" FOREIGN KEY ("popupAd") REFERENCES "AdGroup"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Journalist" ADD CONSTRAINT "Journalist_sidebarAd_fkey" FOREIGN KEY ("sidebarAd") REFERENCES "AdGroup"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Show" ADD CONSTRAINT "Show_clone_fkey" FOREIGN KEY ("clone") REFERENCES "Show"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Show" ADD CONSTRAINT "Show_popupEmbed_fkey" FOREIGN KEY ("popupEmbed") REFERENCES "Embed"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Show" ADD CONSTRAINT "Show_popupAd_fkey" FOREIGN KEY ("popupAd") REFERENCES "AdGroup"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Show" ADD CONSTRAINT "Show_sidebarAd_fkey" FOREIGN KEY ("sidebarAd") REFERENCES "AdGroup"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Region" ADD CONSTRAINT "Region_clone_fkey" FOREIGN KEY ("clone") REFERENCES "Region"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Region" ADD CONSTRAINT "Region_popupEmbed_fkey" FOREIGN KEY ("popupEmbed") REFERENCES "Embed"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Region" ADD CONSTRAINT "Region_popupAd_fkey" FOREIGN KEY ("popupAd") REFERENCES "AdGroup"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Region" ADD CONSTRAINT "Region_sidebarAd_fkey" FOREIGN KEY ("sidebarAd") REFERENCES "AdGroup"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "AdGroup" ADD CONSTRAINT "AdGroup_popupAd_fkey" FOREIGN KEY ("popupAd") REFERENCES "PopupAd"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "AdGroup" ADD CONSTRAINT "AdGroup_bannerAd_fkey" FOREIGN KEY ("bannerAd") REFERENCES "BannerAd"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "AdGroup" ADD CONSTRAINT "AdGroup_contentAd_fkey" FOREIGN KEY ("contentAd") REFERENCES "ContentAd"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "AdGroup" ADD CONSTRAINT "AdGroup_sidebarAd_fkey" FOREIGN KEY ("sidebarAd") REFERENCES "SidebarAd"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Page" ADD CONSTRAINT "Page_clone_fkey" FOREIGN KEY ("clone") REFERENCES "Page"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Page" ADD CONSTRAINT "Page_popupEmbed_fkey" FOREIGN KEY ("popupEmbed") REFERENCES "Embed"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Page" ADD CONSTRAINT "Page_popupAd_fkey" FOREIGN KEY ("popupAd") REFERENCES "AdGroup"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Page" ADD CONSTRAINT "Page_sidebarAd_fkey" FOREIGN KEY ("sidebarAd") REFERENCES "AdGroup"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Role" ADD CONSTRAINT "Role_region_fkey" FOREIGN KEY ("region") REFERENCES "Region"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_Post_shows" ADD CONSTRAINT "_Post_shows_A_fkey" FOREIGN KEY ("A") REFERENCES "Post"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_Post_shows" ADD CONSTRAINT "_Post_shows_B_fkey" FOREIGN KEY ("B") REFERENCES "Show"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_Post_regions" ADD CONSTRAINT "_Post_regions_A_fkey" FOREIGN KEY ("A") REFERENCES "Post"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_Post_regions" ADD CONSTRAINT "_Post_regions_B_fkey" FOREIGN KEY ("B") REFERENCES "Region"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_Post_topics" ADD CONSTRAINT "_Post_topics_A_fkey" FOREIGN KEY ("A") REFERENCES "Post"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_Post_topics" ADD CONSTRAINT "_Post_topics_B_fkey" FOREIGN KEY ("B") REFERENCES "Topic"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_Topic_links" ADD CONSTRAINT "_Topic_links_A_fkey" FOREIGN KEY ("A") REFERENCES "Link"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_Topic_links" ADD CONSTRAINT "_Topic_links_B_fkey" FOREIGN KEY ("B") REFERENCES "Topic"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_Show_links" ADD CONSTRAINT "_Show_links_A_fkey" FOREIGN KEY ("A") REFERENCES "Link"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_Show_links" ADD CONSTRAINT "_Show_links_B_fkey" FOREIGN KEY ("B") REFERENCES "Show"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_Region_links" ADD CONSTRAINT "_Region_links_A_fkey" FOREIGN KEY ("A") REFERENCES "Link"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_Region_links" ADD CONSTRAINT "_Region_links_B_fkey" FOREIGN KEY ("B") REFERENCES "Region"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_Region_buttons" ADD CONSTRAINT "_Region_buttons_A_fkey" FOREIGN KEY ("A") REFERENCES "Link"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_Region_buttons" ADD CONSTRAINT "_Region_buttons_B_fkey" FOREIGN KEY ("B") REFERENCES "Region"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_Region_footerMenu" ADD CONSTRAINT "_Region_footerMenu_A_fkey" FOREIGN KEY ("A") REFERENCES "Link"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_Region_footerMenu" ADD CONSTRAINT "_Region_footerMenu_B_fkey" FOREIGN KEY ("B") REFERENCES "Region"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_Region_socialLinks" ADD CONSTRAINT "_Region_socialLinks_A_fkey" FOREIGN KEY ("A") REFERENCES "ImageLink"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_Region_socialLinks" ADD CONSTRAINT "_Region_socialLinks_B_fkey" FOREIGN KEY ("B") REFERENCES "Region"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_Topic_subsections" ADD CONSTRAINT "_Topic_subsections_A_fkey" FOREIGN KEY ("A") REFERENCES "Subsection"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_Topic_subsections" ADD CONSTRAINT "_Topic_subsections_B_fkey" FOREIGN KEY ("B") REFERENCES "Topic"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_Journalist_shows" ADD CONSTRAINT "_Journalist_shows_A_fkey" FOREIGN KEY ("A") REFERENCES "Journalist"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_Journalist_shows" ADD CONSTRAINT "_Journalist_shows_B_fkey" FOREIGN KEY ("B") REFERENCES "Show"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_Journalist_regions" ADD CONSTRAINT "_Journalist_regions_A_fkey" FOREIGN KEY ("A") REFERENCES "Journalist"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_Journalist_regions" ADD CONSTRAINT "_Journalist_regions_B_fkey" FOREIGN KEY ("B") REFERENCES "Region"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_Journalist_links" ADD CONSTRAINT "_Journalist_links_A_fkey" FOREIGN KEY ("A") REFERENCES "Journalist"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_Journalist_links" ADD CONSTRAINT "_Journalist_links_B_fkey" FOREIGN KEY ("B") REFERENCES "Link"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_Journalist_subsections" ADD CONSTRAINT "_Journalist_subsections_A_fkey" FOREIGN KEY ("A") REFERENCES "Journalist"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_Journalist_subsections" ADD CONSTRAINT "_Journalist_subsections_B_fkey" FOREIGN KEY ("B") REFERENCES "Subsection"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_Journalist_posts" ADD CONSTRAINT "_Journalist_posts_A_fkey" FOREIGN KEY ("A") REFERENCES "Journalist"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_Journalist_posts" ADD CONSTRAINT "_Journalist_posts_B_fkey" FOREIGN KEY ("B") REFERENCES "Post"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_Page_journalists" ADD CONSTRAINT "_Page_journalists_A_fkey" FOREIGN KEY ("A") REFERENCES "Journalist"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_Page_journalists" ADD CONSTRAINT "_Page_journalists_B_fkey" FOREIGN KEY ("B") REFERENCES "Page"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_Show_subsections" ADD CONSTRAINT "_Show_subsections_A_fkey" FOREIGN KEY ("A") REFERENCES "Show"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_Show_subsections" ADD CONSTRAINT "_Show_subsections_B_fkey" FOREIGN KEY ("B") REFERENCES "Subsection"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_Region_shows" ADD CONSTRAINT "_Region_shows_A_fkey" FOREIGN KEY ("A") REFERENCES "Region"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_Region_shows" ADD CONSTRAINT "_Region_shows_B_fkey" FOREIGN KEY ("B") REFERENCES "Show"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_Region_topics" ADD CONSTRAINT "_Region_topics_A_fkey" FOREIGN KEY ("A") REFERENCES "Region"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_Region_topics" ADD CONSTRAINT "_Region_topics_B_fkey" FOREIGN KEY ("B") REFERENCES "Topic"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_Region_subsections" ADD CONSTRAINT "_Region_subsections_A_fkey" FOREIGN KEY ("A") REFERENCES "Region"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_Region_subsections" ADD CONSTRAINT "_Region_subsections_B_fkey" FOREIGN KEY ("B") REFERENCES "Subsection"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_User_regions" ADD CONSTRAINT "_User_regions_A_fkey" FOREIGN KEY ("A") REFERENCES "Region"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_User_regions" ADD CONSTRAINT "_User_regions_B_fkey" FOREIGN KEY ("B") REFERENCES "User"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_Embed_regions" ADD CONSTRAINT "_Embed_regions_A_fkey" FOREIGN KEY ("A") REFERENCES "Embed"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_Embed_regions" ADD CONSTRAINT "_Embed_regions_B_fkey" FOREIGN KEY ("B") REFERENCES "Region"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_Post_sidebarEmbeds" ADD CONSTRAINT "_Post_sidebarEmbeds_A_fkey" FOREIGN KEY ("A") REFERENCES "Embed"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_Post_sidebarEmbeds" ADD CONSTRAINT "_Post_sidebarEmbeds_B_fkey" FOREIGN KEY ("B") REFERENCES "Post"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_Topic_sidebarEmbeds" ADD CONSTRAINT "_Topic_sidebarEmbeds_A_fkey" FOREIGN KEY ("A") REFERENCES "Embed"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_Topic_sidebarEmbeds" ADD CONSTRAINT "_Topic_sidebarEmbeds_B_fkey" FOREIGN KEY ("B") REFERENCES "Topic"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_Journalist_sidebarEmbeds" ADD CONSTRAINT "_Journalist_sidebarEmbeds_A_fkey" FOREIGN KEY ("A") REFERENCES "Embed"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_Journalist_sidebarEmbeds" ADD CONSTRAINT "_Journalist_sidebarEmbeds_B_fkey" FOREIGN KEY ("B") REFERENCES "Journalist"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_Show_sidebarEmbeds" ADD CONSTRAINT "_Show_sidebarEmbeds_A_fkey" FOREIGN KEY ("A") REFERENCES "Embed"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_Show_sidebarEmbeds" ADD CONSTRAINT "_Show_sidebarEmbeds_B_fkey" FOREIGN KEY ("B") REFERENCES "Show"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_Region_sidebarEmbeds" ADD CONSTRAINT "_Region_sidebarEmbeds_A_fkey" FOREIGN KEY ("A") REFERENCES "Embed"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_Region_sidebarEmbeds" ADD CONSTRAINT "_Region_sidebarEmbeds_B_fkey" FOREIGN KEY ("B") REFERENCES "Region"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_Page_sidebarEmbeds" ADD CONSTRAINT "_Page_sidebarEmbeds_A_fkey" FOREIGN KEY ("A") REFERENCES "Embed"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_Page_sidebarEmbeds" ADD CONSTRAINT "_Page_sidebarEmbeds_B_fkey" FOREIGN KEY ("B") REFERENCES "Page"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_AdGroup_regions" ADD CONSTRAINT "_AdGroup_regions_A_fkey" FOREIGN KEY ("A") REFERENCES "AdGroup"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_AdGroup_regions" ADD CONSTRAINT "_AdGroup_regions_B_fkey" FOREIGN KEY ("B") REFERENCES "Region"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_Post_bannerAds" ADD CONSTRAINT "_Post_bannerAds_A_fkey" FOREIGN KEY ("A") REFERENCES "AdGroup"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_Post_bannerAds" ADD CONSTRAINT "_Post_bannerAds_B_fkey" FOREIGN KEY ("B") REFERENCES "Post"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_Post_contentAds" ADD CONSTRAINT "_Post_contentAds_A_fkey" FOREIGN KEY ("A") REFERENCES "AdGroup"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_Post_contentAds" ADD CONSTRAINT "_Post_contentAds_B_fkey" FOREIGN KEY ("B") REFERENCES "Post"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_Topic_bannerAds" ADD CONSTRAINT "_Topic_bannerAds_A_fkey" FOREIGN KEY ("A") REFERENCES "AdGroup"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_Topic_bannerAds" ADD CONSTRAINT "_Topic_bannerAds_B_fkey" FOREIGN KEY ("B") REFERENCES "Topic"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_Topic_contentAds" ADD CONSTRAINT "_Topic_contentAds_A_fkey" FOREIGN KEY ("A") REFERENCES "AdGroup"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_Topic_contentAds" ADD CONSTRAINT "_Topic_contentAds_B_fkey" FOREIGN KEY ("B") REFERENCES "Topic"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_Journalist_bannerAds" ADD CONSTRAINT "_Journalist_bannerAds_A_fkey" FOREIGN KEY ("A") REFERENCES "AdGroup"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_Journalist_bannerAds" ADD CONSTRAINT "_Journalist_bannerAds_B_fkey" FOREIGN KEY ("B") REFERENCES "Journalist"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_Journalist_contentAds" ADD CONSTRAINT "_Journalist_contentAds_A_fkey" FOREIGN KEY ("A") REFERENCES "AdGroup"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_Journalist_contentAds" ADD CONSTRAINT "_Journalist_contentAds_B_fkey" FOREIGN KEY ("B") REFERENCES "Journalist"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_Show_bannerAds" ADD CONSTRAINT "_Show_bannerAds_A_fkey" FOREIGN KEY ("A") REFERENCES "AdGroup"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_Show_bannerAds" ADD CONSTRAINT "_Show_bannerAds_B_fkey" FOREIGN KEY ("B") REFERENCES "Show"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_Show_contentAds" ADD CONSTRAINT "_Show_contentAds_A_fkey" FOREIGN KEY ("A") REFERENCES "AdGroup"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_Show_contentAds" ADD CONSTRAINT "_Show_contentAds_B_fkey" FOREIGN KEY ("B") REFERENCES "Show"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_Region_bannerAds" ADD CONSTRAINT "_Region_bannerAds_A_fkey" FOREIGN KEY ("A") REFERENCES "AdGroup"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_Region_bannerAds" ADD CONSTRAINT "_Region_bannerAds_B_fkey" FOREIGN KEY ("B") REFERENCES "Region"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_Region_contentAds" ADD CONSTRAINT "_Region_contentAds_A_fkey" FOREIGN KEY ("A") REFERENCES "AdGroup"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_Region_contentAds" ADD CONSTRAINT "_Region_contentAds_B_fkey" FOREIGN KEY ("B") REFERENCES "Region"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_Page_bannerAds" ADD CONSTRAINT "_Page_bannerAds_A_fkey" FOREIGN KEY ("A") REFERENCES "AdGroup"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_Page_bannerAds" ADD CONSTRAINT "_Page_bannerAds_B_fkey" FOREIGN KEY ("B") REFERENCES "Page"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_Page_contentAds" ADD CONSTRAINT "_Page_contentAds_A_fkey" FOREIGN KEY ("A") REFERENCES "AdGroup"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_Page_contentAds" ADD CONSTRAINT "_Page_contentAds_B_fkey" FOREIGN KEY ("B") REFERENCES "Page"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_Page_shows" ADD CONSTRAINT "_Page_shows_A_fkey" FOREIGN KEY ("A") REFERENCES "Page"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_Page_shows" ADD CONSTRAINT "_Page_shows_B_fkey" FOREIGN KEY ("B") REFERENCES "Show"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_Page_regions" ADD CONSTRAINT "_Page_regions_A_fkey" FOREIGN KEY ("A") REFERENCES "Page"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_Page_regions" ADD CONSTRAINT "_Page_regions_B_fkey" FOREIGN KEY ("B") REFERENCES "Region"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_Page_topics" ADD CONSTRAINT "_Page_topics_A_fkey" FOREIGN KEY ("A") REFERENCES "Page"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_Page_topics" ADD CONSTRAINT "_Page_topics_B_fkey" FOREIGN KEY ("B") REFERENCES "Topic"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_User_roles" ADD CONSTRAINT "_User_roles_A_fkey" FOREIGN KEY ("A") REFERENCES "Role"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_User_roles" ADD CONSTRAINT "_User_roles_B_fkey" FOREIGN KEY ("B") REFERENCES "User"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_Post_files" ADD CONSTRAINT "_Post_files_A_fkey" FOREIGN KEY ("A") REFERENCES "File"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_Post_files" ADD CONSTRAINT "_Post_files_B_fkey" FOREIGN KEY ("B") REFERENCES "Post"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_Topic_files" ADD CONSTRAINT "_Topic_files_A_fkey" FOREIGN KEY ("A") REFERENCES "File"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_Topic_files" ADD CONSTRAINT "_Topic_files_B_fkey" FOREIGN KEY ("B") REFERENCES "Topic"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_Journalist_files" ADD CONSTRAINT "_Journalist_files_A_fkey" FOREIGN KEY ("A") REFERENCES "File"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_Journalist_files" ADD CONSTRAINT "_Journalist_files_B_fkey" FOREIGN KEY ("B") REFERENCES "Journalist"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_Show_files" ADD CONSTRAINT "_Show_files_A_fkey" FOREIGN KEY ("A") REFERENCES "File"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_Show_files" ADD CONSTRAINT "_Show_files_B_fkey" FOREIGN KEY ("B") REFERENCES "Show"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_Region_files" ADD CONSTRAINT "_Region_files_A_fkey" FOREIGN KEY ("A") REFERENCES "File"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_Region_files" ADD CONSTRAINT "_Region_files_B_fkey" FOREIGN KEY ("B") REFERENCES "Region"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_Page_files" ADD CONSTRAINT "_Page_files_A_fkey" FOREIGN KEY ("A") REFERENCES "File"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_Page_files" ADD CONSTRAINT "_Page_files_B_fkey" FOREIGN KEY ("B") REFERENCES "Page"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_Post_images" ADD CONSTRAINT "_Post_images_A_fkey" FOREIGN KEY ("A") REFERENCES "Image"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_Post_images" ADD CONSTRAINT "_Post_images_B_fkey" FOREIGN KEY ("B") REFERENCES "Post"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_Topic_images" ADD CONSTRAINT "_Topic_images_A_fkey" FOREIGN KEY ("A") REFERENCES "Image"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_Topic_images" ADD CONSTRAINT "_Topic_images_B_fkey" FOREIGN KEY ("B") REFERENCES "Topic"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_Journalist_images" ADD CONSTRAINT "_Journalist_images_A_fkey" FOREIGN KEY ("A") REFERENCES "Image"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_Journalist_images" ADD CONSTRAINT "_Journalist_images_B_fkey" FOREIGN KEY ("B") REFERENCES "Journalist"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_Show_images" ADD CONSTRAINT "_Show_images_A_fkey" FOREIGN KEY ("A") REFERENCES "Image"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_Show_images" ADD CONSTRAINT "_Show_images_B_fkey" FOREIGN KEY ("B") REFERENCES "Show"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_Region_images" ADD CONSTRAINT "_Region_images_A_fkey" FOREIGN KEY ("A") REFERENCES "Image"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_Region_images" ADD CONSTRAINT "_Region_images_B_fkey" FOREIGN KEY ("B") REFERENCES "Region"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_Page_images" ADD CONSTRAINT "_Page_images_A_fkey" FOREIGN KEY ("A") REFERENCES "Image"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_Page_images" ADD CONSTRAINT "_Page_images_B_fkey" FOREIGN KEY ("B") REFERENCES "Page"("id") ON DELETE CASCADE ON UPDATE CASCADE;
