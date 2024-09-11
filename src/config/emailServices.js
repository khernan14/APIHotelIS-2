// emailService.js
import nodemailer from "nodemailer";

// Configura Nodemailer
const transporter = nodemailer.createTransport({
  service: "gmail",
  auth: {
    user: "soportebve@gmail.com",
    pass: "zbpb jchx adew oppj",
  },
});

// Función más genérica para enviar correos
export const sendEmail = async (to, subject, htmlContent) => {
  const mailOptions = {
    from: "soportebve@gmail.com",
    to, // Email destinatario
    subject, // Asunto del correo
    html: htmlContent, // Cuerpo del correo
  };

  try {
    const info = await transporter.sendMail(mailOptions);
    console.log("Correo enviado:", info.response);
    return info.response;
  } catch (error) {
    console.error("Error al enviar el correo:", error);
    throw error;
  }
};
