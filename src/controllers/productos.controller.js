import { getConnection } from "../database/connectionToSql.js";
import sql from "mssql";

export const getAllProducts = async (req, res) => {
  const pool = await getConnection();
  const result = await pool.request().query("SELECT  * FROM products");

  res.json(result.recordset);
};

export const getProductsID = (req, res) => {
  const id = req.params.id;
  res.send(`Obteniendo producto con id ${id}`);
};

export const updateProducts = (req, res) => {
  const id = req.params.id;
  //   const { name, price, description } = req.body;
  res.send(`Actualizando producto con id ${id}`);
};

export const deleteProducts = (req, res) => {
  const id = req.params.id;
  res.send(`Eliminando producto con id ${id}`);
};

export const createProducts = async (req, res) => {
  const pool = await getConnection();
  const result = await pool
    .request()
    .input("name", sql.NVarChar, req.body.name)
    .query(`INSERT INTO products (name) VALUES (@name)`);
  res.json(result);
};
