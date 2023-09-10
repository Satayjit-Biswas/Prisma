import cors from "cors";
import express, { Application, Request, Response } from "express";
import { CategoryRoutes } from "./modules/category/category.route";
import { PostRoutes } from "./modules/post/post.route";
import { UserRoutes } from "./modules/user/user.route";

const router = express.Router();
const app: Application = express();
app.use(express.json());
app.use(cors());
app.use(express.urlencoded({ extended: true }));
// All Routes
app.use("/api/v1/users", UserRoutes);
app.use("/api/v1/category", CategoryRoutes);
app.use("/api/v1/post", PostRoutes);

// default Routes
router.get("/", (req: Request, res: Response) => {
    res.send("Hello Prisma");
});
app.use(router);

export default app;
