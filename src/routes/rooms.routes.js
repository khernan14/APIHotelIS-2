import { Router } from "express";
import {
  getRooms,
  getRoomsType,
  getRoomsAll,
  updateRoom,
} from "../controllers/rooms.controllers.js";

const router = Router();

router.get("/rooms", getRooms);
router.get("/rooms/:room_type", getRoomsType);
router.get("/room", getRoomsAll);
router.put("/rooms/:room_id", updateRoom);

export default router;
