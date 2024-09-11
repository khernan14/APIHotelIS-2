import { getConnection } from "../database/connectionToSql.js";
import sql from "mssql";
import { sendEmail } from "../config/emailServices.js";

export const insertBookings = async (req, res) => {
  try {
    console.log("Iniciando la inserción de reservas...");

    const {
      room_id,
      completeName,
      telephone,
      email,
      check_in_date,
      check_out_date,
      total_price,
      amount, // Añadido
      payment_method, // Añadido
      event_reservation_id, // Añadido
    } = req.body;

    console.log("Datos recibidos:", req.body);

    const pool = await getConnection();

    console.log("Conexión establecida con éxito");

    const result = await pool
      .request()
      .input("room_id", sql.Int, room_id)
      .input("completeName", sql.NVarChar(80), completeName)
      .input("telephone", sql.NVarChar(8), telephone)
      .input("email", sql.NVarChar(300), email)
      .input("check_in_date", sql.DateTime, check_in_date)
      .input("check_out_date", sql.DateTime, check_out_date)
      .input("total_price", sql.Decimal(10, 2), total_price)
      .input("amount", sql.Decimal(10, 2), amount)
      .input("payment_method", sql.NVarChar(50), payment_method)
      .input("event_reservation_id", sql.Int, event_reservation_id)
      .input("accion", "Insertar")
      .execute("InsertBookingAndPayment");

    console.log("Resultado de la inserción:", result);

    if (result.recordset.length > 0) {
      const booking = result.recordset[0];
      console.log("Reserva insertada correctamente:", booking);

      const roomDetailsResult = await pool
        .request()
        .input("roomID", sql.Int, room_id)
        .input("accion", sql.VarChar, "MostrarRoomsID")
        .execute("CRUD_Rooms");

      const roomDetails = roomDetailsResult.recordset[0];
      console.log("Detalles de la habitación:", roomDetails);

      try {
        console.log("Fecha de check-in recibida:", req.body.check_in_date);
        console.log("Fecha de check-out recibida:", req.body.check_out_date);

        // Asegúrate de que las fechas estén correctamente convertidas a objetos Date
        const checkInDate = new Date(req.body.check_in_date);
        const checkOutDate = new Date(req.body.check_out_date);

        // Verifica si las fechas son válidas
        if (isNaN(checkInDate.getTime()) || isNaN(checkOutDate.getTime())) {
          throw new Error("Las fechas de check-in o check-out son inválidas");
        }

        // Generar el contenido del correo de confirmación
        const confirmationEmailContent = `
  <!DOCTYPE html>
  <html>
  <head>
    <style>
      body {
        font-family: Arial, sans-serif;
        color: #333;
        margin: 0;
        padding: 0;
        background-color: #f4f4f4;
      }
      .container {
        width: 80%;
        margin: auto;
        background: #fff;
        padding: 20px;
        border-radius: 8px;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
      }
      .header {
        background-color: #fda94f;
        color: #fff;
        padding: 10px 0;
        text-align: center;
        border-radius: 8px 8px 0 0;
      }
      .header img {
        width: 150px;
        margin: 0 auto;
      }
      h1 {
        margin: 0;
      }
      p {
        margin: 10px 0;
      }
      table {
        width: 100%;
        border-collapse: collapse;
        margin: 20px 0;
      }
      table, th, td {
        border: 1px solid #ddd;
      }
      th, td {
        padding: 10px;
        text-align: left;
      }
      th {
        background-color: #f2f2f2;
      }
      .footer {
        text-align: center;
        margin-top: 20px;
        font-size: 0.9em;
        color: #777;
      }
    </style>
  </head>
  <body>
    <div class="container">
      <div class="header">
        <h1>Confirmación de Reserva</h1>
      </div>
      <p>Estimado ${completeName},</p>
      <p>Gracias por confiar en Hotel IS-2. La reserva ha sido confirmada con éxito.</p>
      <p><strong>Detalles de la Reserva:</strong></p>
      <table>
        <tr>
          <th>Tipo de Habitación</th>
          <td>${roomDetails.room_type}</td>
        </tr>
        <tr>
          <th>Número de Habitación</th>
          <td>${roomDetails.room_number}</td>
        </tr>
        <tr>
          <th>Descripción</th>
          <td>${roomDetails.description}</td>
        </tr>
        <tr>
          <th>Fecha de Check-In</th>
          <td>${checkInDate.toISOString().split("T")[0]}</td>
        </tr>
        <tr>
          <th>Fecha de Check-Out</th>
          <td>${checkOutDate.toISOString().split("T")[0]}</td>
        </tr>
        <tr>
          <th>Total a Pagar</th>
          <td>$${total_price.toFixed(2)}</td>
        </tr>
        <tr>
          <th>Cantidad de Personas</th>
          <td>${roomDetails.max_guests}</td>
        </tr>
      </table>
      <p>Para cualquier consulta, por favor, contacta con el Hotel.</p>
      <div class="footer">
        <p>Atentamente,</p>
        <p>Gerente Dennis Cruz</p>
      </div>
    </div>
  </body>
  </html>
`;

        // Enviar el correo de confirmación
        await sendEmail(
          req.body.email,
          "Confirmación de reserva Hotel",
          confirmationEmailContent
        );

        console.log("Correo de confirmación enviado correctamente");
      } catch (error) {
        console.error("Error al enviar correo de confirmación:", error);
      }

      res.json({
        message: "Los datos se han insertado correctamente",
        booking: {
          room_id: booking.room_id,
          completeName: booking.completeName,
          telephone: booking.telephone,
          email: booking.email,
          check_in_date: booking.check_in_date,
          check_out_date: booking.check_out_date,
          total_price: booking.total_price,
          amount: booking.amount,
          payment_method: booking.payment_method,
          event_reservation_id: booking.event_reservation_id,
        },
      });
    } else {
      console.log("Error al insertar la reserva");

      res.status(500).json({
        message: "Error al insertar el cliente",
      });
    }
  } catch (error) {
    console.log("Error en la inserción de reservas:", error.message);
    res
      .status(500)
      .json({ message: "Error en el servidor", error: error.message });
  }
};
