import cors from "cors";
import express, { Application, Request, Response } from "express";
import { UserRoutes } from "./modules/user/user.route";

const router = express.Router();
const app: Application = express();
app.use(express.json());
app.use(cors());
app.use(express.urlencoded({ extended: true }));
// All Routes
app.use("/api/v1/users", UserRoutes);

// default Routes
router.get("/", (req: Request, res: Response) => {
    res.send("Hello Prisma");
});
app.use(router);

export default app;
