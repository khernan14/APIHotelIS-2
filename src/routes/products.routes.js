import { Router } from "express";
import {
  getProductsID,
  getAllProducts,
  createProducts,
  updateProducts,
  deleteProducts,
} from "../controllers/productos.controller.js";

const router = Router();

router.get("/products", getAllProducts);

router.get("/products/:id", getProductsID);

router.post("/products", createProducts);

router.put("/products/:id", updateProducts);

router.delete("/.products/:id", deleteProducts);

export default router;
