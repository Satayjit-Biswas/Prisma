/*
  Warnings:

  - You are about to drop the column `categoryID` on the `posts` table. All the data in the column will be lost.
  - You are about to drop the column `createAt` on the `posts` table. All the data in the column will be lost.
  - You are about to drop the column `userID` on the `profiles` table. All the data in the column will be lost.
  - You are about to drop the `categorys` table. If the table is not empty, all the data it contains will be lost.
  - A unique constraint covering the columns `[userId]` on the table `profiles` will be added. If there are existing duplicate values, this will fail.
  - Added the required column `categoryId` to the `posts` table without a default value. This is not possible if the table is not empty.
  - Added the required column `userId` to the `profiles` table without a default value. This is not possible if the table is not empty.

*/
-- DropForeignKey
ALTER TABLE "posts" DROP CONSTRAINT "posts_categoryID_fkey";

-- DropForeignKey
ALTER TABLE "profiles" DROP CONSTRAINT "profiles_userID_fkey";

-- DropIndex
DROP INDEX "posts_title_key";

-- DropIndex
DROP INDEX "profiles_bio_key";

-- DropIndex
DROP INDEX "profiles_userID_key";

-- AlterTable
ALTER TABLE "posts" DROP COLUMN "categoryID",
DROP COLUMN "createAt",
ADD COLUMN     "categoryId" INTEGER NOT NULL,
ADD COLUMN     "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP;

-- AlterTable
ALTER TABLE "profiles" DROP COLUMN "userID",
ADD COLUMN     "userId" INTEGER NOT NULL;

-- DropTable
DROP TABLE "categorys";

-- CreateTable
CREATE TABLE "categoris" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,

    CONSTRAINT "categoris_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "newModel" (
    "id" TEXT NOT NULL,
    "name" TEXT NOT NULL,

    CONSTRAINT "newModel_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "profiles_userId_key" ON "profiles"("userId");

-- AddForeignKey
ALTER TABLE "profiles" ADD CONSTRAINT "profiles_userId_fkey" FOREIGN KEY ("userId") REFERENCES "users"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "posts" ADD CONSTRAINT "posts_categoryId_fkey" FOREIGN KEY ("categoryId") REFERENCES "categoris"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
