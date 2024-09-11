import sql from "mssql";

const dbSettings = {
  user: "pruebas2020",
  password: "Honduras2024",
  server: "KHERNAN14\\SQLEXPRESS",
  database: "HotelDB",
  options: {
    encrypt: false,
    trustServerCertificate: true,
  },
};

let connectionPool;

export const getConnection = async () => {
  if (!connectionPool) {
    try {
      connectionPool = await sql.connect(dbSettings);
      console.log("Database connection established");
    } catch (error) {
      console.error("Database connection failed:", error);
      throw error;
    }
  }
  return connectionPool;
};
