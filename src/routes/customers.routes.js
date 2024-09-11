import { Router } from "express";
import { insertCustomer } from "../controllers/customers.controllers.js";

const router = Router();

router.post("/customers", insertCustomer);

export default router;
