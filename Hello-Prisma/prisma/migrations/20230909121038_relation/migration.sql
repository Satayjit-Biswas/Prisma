/*
  Warnings:

  - A unique constraint covering the columns `[userID]` on the table `profiles` will be added. If there are existing duplicate values, this will fail.

*/
-- CreateIndex
CREATE UNIQUE INDEX "profiles_userID_key" ON "profiles"("userID");

-- AddForeignKey
ALTER TABLE "profiles" ADD CONSTRAINT "profiles_userID_fkey" FOREIGN KEY ("userID") REFERENCES "users"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "posts" ADD CONSTRAINT "posts_authorId_fkey" FOREIGN KEY ("authorId") REFERENCES "users"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "posts" ADD CONSTRAINT "posts_categoryID_fkey" FOREIGN KEY ("categoryID") REFERENCES "categorys"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
