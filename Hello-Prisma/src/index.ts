import { PrismaClient } from "@prisma/client";
import cors from "cors";
import express, { Application } from "express";

const app: Application = express();
app.use(express.json());
app.use(cors());
app.use(express.urlencoded({ extended: true }));

const prisma = new PrismaClient();

const port = process.env.PORT || 5000;

async function main() {
    app.listen(port, () => {
        console.log(`Server running at http://localhost:${port}`);
    });
}

main();
