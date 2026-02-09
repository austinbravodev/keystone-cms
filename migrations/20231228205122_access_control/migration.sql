/*
  Warnings:

  - You are about to drop the `Role` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `_User_roles` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropForeignKey
ALTER TABLE "Role" DROP CONSTRAINT "Role_region_fkey";

-- DropForeignKey
ALTER TABLE "_User_roles" DROP CONSTRAINT "_User_roles_A_fkey";

-- DropForeignKey
ALTER TABLE "_User_roles" DROP CONSTRAINT "_User_roles_B_fkey";

-- AlterTable
ALTER TABLE "User" ADD COLUMN     "permissions" JSONB NOT NULL DEFAULT '[]';

-- DropTable
DROP TABLE "Role";

-- DropTable
DROP TABLE "_User_roles";
