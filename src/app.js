import express from "express";
import productsRoute from "./routes/products.routes.js";
import usersRoute from "./routes/users.routes.js";
import roomsRoute from "./routes/rooms.routes.js";
import customersRoute from "./routes/customers.routes.js";
import bookingsRoute from "./routes/bookings.routes.js";
import paymentsRoute from "./routes/payments.routes.js";
import eventsReservationsRoute from "./routes/eventsReservations.routes.js";
import cors from "cors";

const app = express();

app.use(express.json());
app.use(cors());

app.use(productsRoute);
app.use(usersRoute);
app.use(roomsRoute);
app.use(customersRoute);

app.use(bookingsRoute);

app.use(paymentsRoute);

app.use(eventsReservationsRoute);

export default app;
