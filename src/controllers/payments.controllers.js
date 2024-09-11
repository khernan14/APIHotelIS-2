import { getConnection } from "../database/connectionToSql.js";
import sql from "mssql";

export const Payments = async (req, res) => {
  try {
    const {
      booking_id,
      event_reservation_id,
      amount,
      payment_date,
      payment_method,
    } = req.body;
    const pool = await getConnection();
    const result = await pool
      .request()

      .input("accion", sql.VarChar, "Insertar")
      .execute("InsertBookingAndPayment");

    if (result.recordset.length > 0) {
      const payment = result.recordset[0];
      res.json({
        message: "Los datos se han insertado correctamente",
        payment: {
          booking_id: payment.booking_id,
          event_reservation_id: payment.event_reservation_id,
          amount: payment.amount,
          payment_date: payment.payment_date,
          payment_method: payment.payment_method,
        },
      });
    } else {
      res.status(500).json({
        message: "Error al insertar el cliente",
        error: error.message,
      });
    }
  } catch (error) {
    res
      .status(500)
      .json({ message: "Error en el servidor", error: error.message });
  }
};
