import { Router } from "express";
import { insertEvents } from "../controllers/eventsReservation.controllers.js";

const router = Router();

router.post("/events", insertEvents);

export default router;
