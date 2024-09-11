import { getConnection } from "../database/connectionToSql.js";
import sql from "mssql";
import { sendEmail } from "../config/emailServices.js";

export const insertEvents = async (req, res) => {
  try {
    console.log("Iniciando la inserción del evento...");

    const {
      event_name,
      description,
      event_date,
      price_per_person,
      completeName,
      telephone,
      email,
      number_of_attendees,
      reservation_status,
    } = req.body;

    console.log("Datos recibidos:", req.body);

    // const formattedEventTime = convertTimeFormat(event_time);

    const pool = await getConnection();

    console.log("Conexión establecida con éxito");

    const result = await pool
      .request()
      .input("event_name", sql.NVarChar(100), event_name)
      .input("description", sql.NVarChar(200), description)
      .input("event_date", sql.Date, event_date)
      .input("price_per_person", sql.Decimal(10, 2), price_per_person)
      .input("completeName", sql.NVarChar(80), completeName)
      .input("telephone", sql.NVarChar(8), telephone)
      .input("email", sql.NVarChar(400), email)
      .input("number_of_attendees", sql.Int, number_of_attendees)
      .input("reservation_status", sql.NVarChar(15), reservation_status)
      .input("accion", "insertReservation")
      .execute("eventsHotel");

    console.log("Resultado de la inserción:", result);

    if (result.recordset.length > 0) {
      const events = result.recordset[0];
      console.log("Reserva insertada correctamente:", events);

      try {
        const confirmationEmailContent = `<div style="font-family: Arial, sans-serif; font-size: 16px; color: #333; padding: 20px; background-color: #f9f9f9;">
          <div style="max-width: 600px; margin: 0 auto; padding: 20px; background-color: #ffffff; border-radius: 10px; box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1); border: 1px solid #e0e0e0;">
            <h2 style="text-align: center; color: #4CAF50;">Confirmación de Solicitud de Reserva</h2>
            <p>Estimado/a <strong>${completeName}</strong>,</p>
            <p>Gracias por su interés en reservar con el <strong>Hotel IS-2</strong>. Nos complace informarle que su solicitud ha sido aprobada.</p>
            <p>
              Su fecha de reservacion del salon es el día <strong>${event_date}</strong>.
            </p>
            <p style="text-align: center;">
              <span style="display: inline-block; padding: 10px 20px; background-color: #4CAF50; color: #ffffff; border-radius: 5px; text-decoration: none;">Solicitud en Proceso</span>
            </p>
            <p>Saludos cordiales,<br>Equipo del Hotel IS-2</p>
          </div>
        </div>`;

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
        events: {
          event_name: events.event_name,
          description: events.description,
          event_date: events.event_date,
          price_per_person: events.price_per_person,
          completeName: events.completeName,
          telephone: events.telephone,
          email: events.email,
          number_of_attendees: events.number_of_attendees,
          reservation_status: events.reservation_status,
        },
      });
      console.log(events);
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
