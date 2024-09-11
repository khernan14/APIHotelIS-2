import { getConnection } from "../database/connectionToSql.js";
import sql from "mssql";

export const insertCustomer = async (req, res) => {
  try {
    const { completeName, telephone, email } = req.body;
    const pool = await getConnection();
    const result = await pool
      .request()
      .input("completeName", sql.VarChar, completeName)
      .input("telephone", sql.VarChar, telephone)
      .input("email", sql.VarChar, email)
      .input("accion", sql.VarChar, "Insertar")
      .execute("CRUD_Customers");

    if (result.recordset.length > 0) {
      const customer = result.recordset[0];
      res.json({
        message: "El cliente se ha insertado correctamente",
        customer: {
          completeName: customer.completeName,
          telephone: customer.telephone,
          email: customer.email,
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
