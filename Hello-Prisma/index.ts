import { PrismaClient } from "@prisma/client";

const prisma = new PrismaClient();

async function main() {
    // find and Get Database
    const getAlluser = await prisma.user.findMany();
    console.log(getAlluser);

    // post Data in database
    const postUser = await prisma.user.create({
        data: {
            email: "hi2@gmail.com",
            name: "Satayjit",
        },
    });
    console.log(postUser);
}

main();
