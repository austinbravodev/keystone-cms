/*
  Warnings:

  - You are about to drop the column `code` on the `Embed` table. All the data in the column will be lost.

*/
-- AlterTable
ALTER TABLE "Embed" RENAME COLUMN "code" TO "rawCode";

-- AlterTable
ALTER TABLE "Embed" ADD COLUMN     "fundistBasic" TEXT,
ADD COLUMN     "fundistDonation" TEXT,
ADD COLUMN     "fundistSignup" TEXT;

-- AlterTable
ALTER TABLE "Page" ADD COLUMN     "author" TEXT NOT NULL DEFAULT '';

-- AlterTable
ALTER TABLE "Post" ADD COLUMN     "author" TEXT NOT NULL DEFAULT '';

-- CreateTable
CREATE TABLE "DonationTag" (
    "id" TEXT NOT NULL,
    "tag" TEXT NOT NULL DEFAULT '',

    CONSTRAINT "DonationTag_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "FundistDonation" (
    "id" TEXT NOT NULL,
    "url" TEXT NOT NULL DEFAULT '',
    "organization" TEXT NOT NULL,
    "paramTitle" TEXT NOT NULL DEFAULT '',
    "trackingTag" TEXT,
    "featuredImage_filesize" INTEGER,
    "featuredImage_extension" TEXT,
    "featuredImage_width" INTEGER,
    "featuredImage_height" INTEGER,
    "featuredImage_id" TEXT,
    "paramVideo" TEXT NOT NULL DEFAULT '',
    "journalist" TEXT,
    "paramSubtitle" TEXT NOT NULL DEFAULT '',
    "paramInterval" TEXT,
    "goalType" TEXT DEFAULT 'amount',
    "paramCurrency" TEXT DEFAULT 'cad',
    "goal" DOUBLE PRECISION,
    "paramAdd" DOUBLE PRECISION,
    "amounts" TEXT NOT NULL DEFAULT '',
    "customAmounts" TEXT NOT NULL DEFAULT '',
    "paramMessage_label" TEXT NOT NULL DEFAULT '',
    "tags" TEXT NOT NULL DEFAULT '',
    "shareTags" TEXT NOT NULL DEFAULT '',
    "paramAction" TEXT NOT NULL DEFAULT '',

    CONSTRAINT "FundistDonation_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "SignupTag" (
    "id" TEXT NOT NULL,
    "tag" TEXT NOT NULL DEFAULT '',

    CONSTRAINT "SignupTag_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "FundistSignup" (
    "id" TEXT NOT NULL,
    "url" TEXT NOT NULL DEFAULT '',
    "organization" TEXT NOT NULL,
    "paramTitle" TEXT NOT NULL DEFAULT '',
    "trackingTag" TEXT,
    "featuredImage_filesize" INTEGER,
    "featuredImage_extension" TEXT,
    "featuredImage_width" INTEGER,
    "featuredImage_height" INTEGER,
    "featuredImage_id" TEXT,
    "paramVideo" TEXT NOT NULL DEFAULT '',
    "journalist" TEXT,
    "paramSubtitle" TEXT NOT NULL DEFAULT '',
    "paramType" TEXT DEFAULT 'signup',
    "paramGoal" INTEGER,
    "paramAdd" INTEGER,
    "paramCountry_code" TEXT DEFAULT 'ca',
    "petitionID" INTEGER,
    "petitionIDShare" INTEGER,
    "paramMessage_label" TEXT NOT NULL DEFAULT '',
    "tags" TEXT NOT NULL DEFAULT '',
    "shareTags" TEXT NOT NULL DEFAULT '',

    CONSTRAINT "FundistSignup_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "BasicTag" (
    "id" TEXT NOT NULL,
    "tag" TEXT NOT NULL DEFAULT '',

    CONSTRAINT "BasicTag_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "FundistBasic" (
    "id" TEXT NOT NULL,
    "url" TEXT NOT NULL DEFAULT '',
    "organization" TEXT NOT NULL,
    "paramTitle" TEXT NOT NULL DEFAULT '',
    "trackingTag" TEXT,
    "featuredImage_filesize" INTEGER,
    "featuredImage_extension" TEXT,
    "featuredImage_width" INTEGER,
    "featuredImage_height" INTEGER,
    "featuredImage_id" TEXT,
    "paramVideo" TEXT NOT NULL DEFAULT '',
    "journalist" TEXT,
    "paramSubtitle" TEXT NOT NULL DEFAULT '',
    "sponsored" BOOLEAN NOT NULL DEFAULT false,
    "paramCampaignLink" TEXT NOT NULL DEFAULT '',
    "paramAction" TEXT NOT NULL DEFAULT '',

    CONSTRAINT "FundistBasic_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "DonationTag_tag_key" ON "DonationTag"("tag");

-- CreateIndex
CREATE INDEX "FundistDonation_trackingTag_idx" ON "FundistDonation"("trackingTag");

-- CreateIndex
CREATE INDEX "FundistDonation_journalist_idx" ON "FundistDonation"("journalist");

-- CreateIndex
CREATE UNIQUE INDEX "SignupTag_tag_key" ON "SignupTag"("tag");

-- CreateIndex
CREATE INDEX "FundistSignup_trackingTag_idx" ON "FundistSignup"("trackingTag");

-- CreateIndex
CREATE INDEX "FundistSignup_journalist_idx" ON "FundistSignup"("journalist");

-- CreateIndex
CREATE UNIQUE INDEX "BasicTag_tag_key" ON "BasicTag"("tag");

-- CreateIndex
CREATE INDEX "FundistBasic_trackingTag_idx" ON "FundistBasic"("trackingTag");

-- CreateIndex
CREATE INDEX "FundistBasic_journalist_idx" ON "FundistBasic"("journalist");

-- CreateIndex
CREATE INDEX "Embed_fundistDonation_idx" ON "Embed"("fundistDonation");

-- CreateIndex
CREATE INDEX "Embed_fundistSignup_idx" ON "Embed"("fundistSignup");

-- CreateIndex
CREATE INDEX "Embed_fundistBasic_idx" ON "Embed"("fundistBasic");

-- AddForeignKey
ALTER TABLE "Embed" ADD CONSTRAINT "Embed_fundistDonation_fkey" FOREIGN KEY ("fundistDonation") REFERENCES "FundistDonation"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Embed" ADD CONSTRAINT "Embed_fundistSignup_fkey" FOREIGN KEY ("fundistSignup") REFERENCES "FundistSignup"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Embed" ADD CONSTRAINT "Embed_fundistBasic_fkey" FOREIGN KEY ("fundistBasic") REFERENCES "FundistBasic"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "FundistDonation" ADD CONSTRAINT "FundistDonation_trackingTag_fkey" FOREIGN KEY ("trackingTag") REFERENCES "DonationTag"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "FundistDonation" ADD CONSTRAINT "FundistDonation_journalist_fkey" FOREIGN KEY ("journalist") REFERENCES "Journalist"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "FundistSignup" ADD CONSTRAINT "FundistSignup_trackingTag_fkey" FOREIGN KEY ("trackingTag") REFERENCES "SignupTag"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "FundistSignup" ADD CONSTRAINT "FundistSignup_journalist_fkey" FOREIGN KEY ("journalist") REFERENCES "Journalist"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "FundistBasic" ADD CONSTRAINT "FundistBasic_trackingTag_fkey" FOREIGN KEY ("trackingTag") REFERENCES "BasicTag"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "FundistBasic" ADD CONSTRAINT "FundistBasic_journalist_fkey" FOREIGN KEY ("journalist") REFERENCES "Journalist"("id") ON DELETE SET NULL ON UPDATE CASCADE;
