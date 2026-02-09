/*
  Warnings:

  - You are about to drop the column `shareTags` on the `FundistDonation` table. All the data in the column will be lost.
  - You are about to drop the column `tags` on the `FundistDonation` table. All the data in the column will be lost.
  - You are about to drop the column `shareTags` on the `FundistSignup` table. All the data in the column will be lost.
  - You are about to drop the column `tags` on the `FundistSignup` table. All the data in the column will be lost.

*/
-- AlterTable
ALTER TABLE "FundistDonation" DROP COLUMN "shareTags",
DROP COLUMN "tags";

-- AlterTable
ALTER TABLE "FundistSignup" DROP COLUMN "shareTags",
DROP COLUMN "tags";

-- CreateTable
CREATE TABLE "NationBuilderTag" (
    "id" TEXT NOT NULL,
    "tag" TEXT NOT NULL DEFAULT '',

    CONSTRAINT "NationBuilderTag_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "NationBuilderShareTag" (
    "id" TEXT NOT NULL,
    "tag" TEXT NOT NULL DEFAULT '',

    CONSTRAINT "NationBuilderShareTag_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "NationBuilderTagCheckbox" (
    "id" TEXT NOT NULL,
    "tag" TEXT NOT NULL DEFAULT '',
    "label" TEXT NOT NULL DEFAULT '',

    CONSTRAINT "NationBuilderTagCheckbox_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "_FundistDonation_nationbuilderTags" (
    "A" TEXT NOT NULL,
    "B" TEXT NOT NULL
);

-- CreateTable
CREATE TABLE "_FundistDonation_nationbuilderShareTags" (
    "A" TEXT NOT NULL,
    "B" TEXT NOT NULL
);

-- CreateTable
CREATE TABLE "_FundistSignup_nationbuilderTagCheckboxes" (
    "A" TEXT NOT NULL,
    "B" TEXT NOT NULL
);

-- CreateTable
CREATE TABLE "_FundistSignup_nationbuilderTags" (
    "A" TEXT NOT NULL,
    "B" TEXT NOT NULL
);

-- CreateTable
CREATE TABLE "_FundistSignup_nationbuilderShareTags" (
    "A" TEXT NOT NULL,
    "B" TEXT NOT NULL
);

-- CreateIndex
CREATE UNIQUE INDEX "NationBuilderTag_tag_key" ON "NationBuilderTag"("tag");

-- CreateIndex
CREATE UNIQUE INDEX "NationBuilderShareTag_tag_key" ON "NationBuilderShareTag"("tag");

-- CreateIndex
CREATE UNIQUE INDEX "NationBuilderTagCheckbox_tag_key" ON "NationBuilderTagCheckbox"("tag");

-- CreateIndex
CREATE UNIQUE INDEX "_FundistDonation_nationbuilderTags_AB_unique" ON "_FundistDonation_nationbuilderTags"("A", "B");

-- CreateIndex
CREATE INDEX "_FundistDonation_nationbuilderTags_B_index" ON "_FundistDonation_nationbuilderTags"("B");

-- CreateIndex
CREATE UNIQUE INDEX "_FundistDonation_nationbuilderShareTags_AB_unique" ON "_FundistDonation_nationbuilderShareTags"("A", "B");

-- CreateIndex
CREATE INDEX "_FundistDonation_nationbuilderShareTags_B_index" ON "_FundistDonation_nationbuilderShareTags"("B");

-- CreateIndex
CREATE UNIQUE INDEX "_FundistSignup_nationbuilderTagCheckboxes_AB_unique" ON "_FundistSignup_nationbuilderTagCheckboxes"("A", "B");

-- CreateIndex
CREATE INDEX "_FundistSignup_nationbuilderTagCheckboxes_B_index" ON "_FundistSignup_nationbuilderTagCheckboxes"("B");

-- CreateIndex
CREATE UNIQUE INDEX "_FundistSignup_nationbuilderTags_AB_unique" ON "_FundistSignup_nationbuilderTags"("A", "B");

-- CreateIndex
CREATE INDEX "_FundistSignup_nationbuilderTags_B_index" ON "_FundistSignup_nationbuilderTags"("B");

-- CreateIndex
CREATE UNIQUE INDEX "_FundistSignup_nationbuilderShareTags_AB_unique" ON "_FundistSignup_nationbuilderShareTags"("A", "B");

-- CreateIndex
CREATE INDEX "_FundistSignup_nationbuilderShareTags_B_index" ON "_FundistSignup_nationbuilderShareTags"("B");

-- AddForeignKey
ALTER TABLE "_FundistDonation_nationbuilderTags" ADD CONSTRAINT "_FundistDonation_nationbuilderTags_A_fkey" FOREIGN KEY ("A") REFERENCES "FundistDonation"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_FundistDonation_nationbuilderTags" ADD CONSTRAINT "_FundistDonation_nationbuilderTags_B_fkey" FOREIGN KEY ("B") REFERENCES "NationBuilderTag"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_FundistDonation_nationbuilderShareTags" ADD CONSTRAINT "_FundistDonation_nationbuilderShareTags_A_fkey" FOREIGN KEY ("A") REFERENCES "FundistDonation"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_FundistDonation_nationbuilderShareTags" ADD CONSTRAINT "_FundistDonation_nationbuilderShareTags_B_fkey" FOREIGN KEY ("B") REFERENCES "NationBuilderShareTag"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_FundistSignup_nationbuilderTagCheckboxes" ADD CONSTRAINT "_FundistSignup_nationbuilderTagCheckboxes_A_fkey" FOREIGN KEY ("A") REFERENCES "FundistSignup"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_FundistSignup_nationbuilderTagCheckboxes" ADD CONSTRAINT "_FundistSignup_nationbuilderTagCheckboxes_B_fkey" FOREIGN KEY ("B") REFERENCES "NationBuilderTagCheckbox"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_FundistSignup_nationbuilderTags" ADD CONSTRAINT "_FundistSignup_nationbuilderTags_A_fkey" FOREIGN KEY ("A") REFERENCES "FundistSignup"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_FundistSignup_nationbuilderTags" ADD CONSTRAINT "_FundistSignup_nationbuilderTags_B_fkey" FOREIGN KEY ("B") REFERENCES "NationBuilderTag"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_FundistSignup_nationbuilderShareTags" ADD CONSTRAINT "_FundistSignup_nationbuilderShareTags_A_fkey" FOREIGN KEY ("A") REFERENCES "FundistSignup"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_FundistSignup_nationbuilderShareTags" ADD CONSTRAINT "_FundistSignup_nationbuilderShareTags_B_fkey" FOREIGN KEY ("B") REFERENCES "NationBuilderShareTag"("id") ON DELETE CASCADE ON UPDATE CASCADE;
