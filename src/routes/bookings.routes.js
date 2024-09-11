import { Router } from "express";
import { insertBookings } from "../controllers/bookings.controllers.js";

const router = Router();

router.post("/bookings", insertBookings);

export default router;
