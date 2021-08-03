const nodemailer = require('nodemailer');

// Creo el transporter para enviar el mail
const send = async({mail, asunto = "Gracias por registrarse", cuerpo}) => { 
    try {
    const transporter = nodemailer.createTransport({
        service: process.env.MAIL_SERVICE,
        auth: {
            user: process.env.MAIL_USER, 
            pass: process.env.MAIL_PASS, 
      }
    });
    const info = {
      to: mail,
      subject: asunto,
      html: cuerpo,
    }
    const {messageId} = await transporter.sendMail(info);
    return messageId;
    } catch (err) {
        console.error(err);
    }
}

module.exports = { send };