import { Router } from "express";
import {
  createUsers,
  getAllUsers,
  login,
} from "../controllers/users.controllers.js";

const router = Router();

router.get("/users", getAllUsers);

// router.get("/products/:id", getProductsID);

router.post("/users", createUsers);

router.post("/users/login", login);

export default router;
