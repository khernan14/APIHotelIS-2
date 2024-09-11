import { getConnection } from "../database/connectionToSql.js";
import sql from "mssql";

export const getAllUsers = async (req, res) => {
  try {
    const pool = await getConnection();
    const result = await pool.request().query("SELECT * FROM Users");
    res.json(result.recordset);
  } catch (error) {
    res
      .status(500)
      .json({ message: "Error al obtener usuarios", error: error.message });
  }
};

export const createUsers = async (req, res) => {
  try {
    const {
      first_name,
      last_name,
      email,
      password_hash,
      phone_number,
      address,
      city,
      country,
      created_at,
      updated_at,
    } = req.body;

    const pool = await getConnection();
    const result = await pool
      .request()
      .input("first_name", sql.NVarChar, first_name)
      .input("last_name", sql.NVarChar, last_name)
      .input("email", sql.NVarChar, email)
      .input("password_hash", sql.NVarChar, password_hash)
      .input("phone_number", sql.NVarChar, phone_number)
      .input("address", sql.NVarChar, address)
      .input("city", sql.NVarChar, city)
      .input("country", sql.NVarChar, country)
      .input("created_at", sql.NVarChar, created_at)
      .input("updated_at", sql.NVarChar, updated_at)
      .query(
        `INSERT INTO Users (first_name, last_name, email, password_hash, phone_number, address, city, country, created_at, updated_at) VALUES (@first_name, @last_name, @email, @password_hash, @phone_number, @address, @city, @country, @created_at, @updated_at)`
      );
    res.status(201).json({ message: "Usuario creado exitosamente", result });
  } catch (error) {
    res
      .status(500)
      .json({ message: "Error al crear usuario", error: error.message });
  }
};

export const login = async (req, res) => {
  try {
    const { email, password_hash } = req.body;
    const pool = await getConnection();
    const result = await pool
      .request()
      .input("email", sql.VarChar, email)
      .input("password_hash", sql.VarChar, password_hash)
      .execute("IniciarSesion");

    if (result.recordset.length > 0) {
      // Usuario encontrado, devuelve todos los datos del usuario
      const user = result.recordset[0];
      res.json({
        message: "Inicio de sesión exitoso",
        user: {
          id: user.id,
          first_name: user.first_name,
          last_name: user.last_name,
          email: user.email,
          phone_number: user.phone_number,
          address: user.address,
          city: user.city,
          country: user.country,
        },
      });
    } else {
      // Usuario no encontrado o credenciales incorrectas
      res.status(401).json({ message: "Credenciales inválidas" });
    }
  } catch (error) {
    res
      .status(500)
      .json({ message: "Error en el inicio de sesión", error: error.message });
  }
};
