import { getConnection } from "../database/connectionToSql.js";
import sql from "mssql";

export const getRooms = async (req, res) => {
  try {
    const pool = await getConnection();
    console.log("Conexion establecida");

    const result = await pool
      .request()
      .input("accion", sql.NVarChar, "Mostrar")
      .execute("CRUD_Rooms");

    if (result.recordset.length > 0) {
      // Devolver un array con todas las habitaciones
      res.json({
        message: "Datos Obtenidos",
        rooms: result.recordset.map((room) => ({
          room_id: room.room_id,
          room_number: room.room_number,
          room_type: room.room_type,
          description: room.description,
          price_per_night: room.price_per_night,
          max_guests: room.max_guests,
          available: room.available,
          image_url: room.image_url,
        })),
      });
    } else {
      res.status(404).json({ message: "No se encontraron datos" });
    }
  } catch (error) {
    res
      .status(500)
      .json({ message: "Error en el servidor", error: error.message });
  }
};

export const getRoomsType = async (req, res) => {
  try {
    const pool = await getConnection();

    console.log("Conexión establecida");

    const { room_type } = req.params;
    const { check_in_date, check_out_date } = req.query;

    const result = await pool
      .request()
      .input("accion", sql.NVarChar, "MostrarRooms")
      .input("roomType", sql.NVarChar, room_type)
      .input("check_in_date", sql.DateTime, check_in_date)
      .input("check_out_date", sql.DateTime, check_out_date)
      .execute("CRUD_Rooms");

    if (result.recordset.length > 0) {
      res.json({
        message: "Datos Obtenidos",
        rooms: result.recordset.map((room) => ({
          room_id: room.room_id,
          room_number: room.room_number,
          room_type: room.room_type,
          description: room.description,
          price_per_night: room.price_per_night,
          max_guests: room.max_guests,
          image_url: room.image_url,
          check_in_date: room.check_in_date,
          check_out_date: room.check_out_date,
        })),
      });
      console.log(result);
    } else {
      res.status(404).json({ message: "No se encontraron datos" });
    }
  } catch (error) {
    res
      .status(500)
      .json({ message: "Error en el servidor", error: error.message });
  }
};

export const getRoomsAll = async (req, res) => {
  try {
    const pool = await getConnection();

    console.log("Conexión establecida con la base de datos.");

    const result = await pool
      .request()
      .input("accion", sql.NVarChar, "getRoomsAll")
      .execute("CRUD_Rooms");

    console.log("Resultado de la consulta: ", result); // Log para verificar los datos

    if (result.recordset.length > 0) {
      res.json({
        message: "Datos Obtenidos",
        rooms: result.recordset.map((room) => ({
          room_id: room.room_id,
          room_number: room.room_number,
          room_type: room.room_type,
          description: room.description,
          price_per_night: room.price_per_night,
          max_guests: room.max_guests,
          image_url: room.image_url,
        })),
      });
    } else {
      res.status(404).json({ message: "No se encontraron datos" });
    }
  } catch (error) {
    console.error("Error al obtener las habitaciones: ", error);
    res.status(500).json({ message: "Error al obtener los datos" });
  }
};

export const updateRoom = async (req, res) => {
  try {
    const pool = await getConnection();

    console.log("Conexión establecida con la base de datos.");

    const result = await pool
      .request()
      .input("room_number", sql.NVarChar(10), req.body.room_number) // room_number es NVARCHAR en tu SP
      .input("room_type", sql.NVarChar(50), req.body.room_type)
      .input("description", sql.NVarChar(300), req.body.description) // Ajusta el tamaño según tu SP
      .input("price_per_person", sql.Decimal(10, 2), req.body.price_per_night) // price_per_person en tu SP
      .input("max_guests", sql.Int, req.body.max_guests)
      .input("image_url", sql.NVarChar(200), req.body.image_url) // Parámetro opcional para la imagen
      .input("accion", sql.NVarChar(50), "update")
      .input("roomID", sql.Int, req.params.room_id) // Asegúrate de que coincide con @roomID en el SP
      .execute("CRUD_Rooms");

    console.log("Resultado de la consulta: ", result); // Verificar si hubo éxito

    res.json({ message: "Habitación actualizada correctamente" });
  } catch (error) {
    console.error("Error al actualizar la habitación: ", error);
    res.status(500).json({ message: "Error al actualizar la habitación" });
  }
};
