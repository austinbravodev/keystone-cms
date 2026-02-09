-- AlterTable
ALTER TABLE "AdGroup" ADD COLUMN     "priority" INTEGER NOT NULL DEFAULT 5,
ADD COLUMN     "updatedAt" TIMESTAMP(3);

-- AlterTable
ALTER TABLE "Embed" ADD COLUMN     "priority" INTEGER NOT NULL DEFAULT 5,
ADD COLUMN     "updatedAt" TIMESTAMP(3);

-- AlterTable
ALTER TABLE "Journalist" ADD COLUMN     "priority" INTEGER NOT NULL DEFAULT 5,
ADD COLUMN     "updatedAt" TIMESTAMP(3);

-- AlterTable
ALTER TABLE "Page" ADD COLUMN     "priority" INTEGER NOT NULL DEFAULT 5,
ADD COLUMN     "updatedAt" TIMESTAMP(3);

-- AlterTable
ALTER TABLE "Post" ADD COLUMN     "priority" INTEGER NOT NULL DEFAULT 5,
ADD COLUMN     "updatedAt" TIMESTAMP(3);

-- AlterTable
ALTER TABLE "Region" ADD COLUMN     "priority" INTEGER NOT NULL DEFAULT 5,
ADD COLUMN     "updatedAt" TIMESTAMP(3);

-- AlterTable
ALTER TABLE "Show" ADD COLUMN     "priority" INTEGER NOT NULL DEFAULT 5,
ADD COLUMN     "updatedAt" TIMESTAMP(3);

-- AlterTable
ALTER TABLE "Topic" ADD COLUMN     "priority" INTEGER NOT NULL DEFAULT 5,
ADD COLUMN     "updatedAt" TIMESTAMP(3);

-- AlterTable
ALTER TABLE "User" ADD COLUMN     "priority" INTEGER NOT NULL DEFAULT 5,
ADD COLUMN     "updatedAt" TIMESTAMP(3);
