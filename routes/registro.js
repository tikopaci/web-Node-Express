const express = require('express');
const router = express.Router();
const sha1 = require('sha1');
const model = require('./../models/usuariosModel');
const {v4 : uuid} = require('uuid');
const {send} = require('./../services/mail');
const {validateRegistro} = require('./../middlewares/usuariosMw');

const showCreate = (req, res) => {
    res.render('registro');
}

//Crea el usuario.
const create = async(req, res) => {
    const user = req.body; 
    let duplicado = false;
    const uid = uuid(); 
    const finalUser = { 
        username : user.username,
        pass : sha1(user.pass),
        mail : user.mail,
        confirmacionCorreo : uid,
    }
    const usuariosExistentes = await model.getAll();
    usuariosExistentes.forEach(usuario => {
        if (usuario.username == finalUser.username || usuario.mail == finalUser.mail) duplicado = true;
    })
    if (!duplicado) {
        const added = await model.create(finalUser); // Lo agrego a la base de datos con mi model
        console.log(added);
        send({ // Nodemailer envía el mail con el link para validar usuario.
            mail: finalUser.mail,
            cuerpo:  
            `<h2>${finalUser.username}, gracias por registrarse en Twisted Kitsune</h2>
            <h3>Para activar su cuenta, por favor haz click <a href=${process.env.URL_SERVER}:${process.env.PORT}/registro/verify/${uid}>AQUI</a></h3>`
        });
        res.render('login', {message : "Revisa tu casilla de correo para confirmar tu registro!"});
    }
    else {
        res.render('registro', {message : "El nombre de usuario y/o mail ingresados ya existen"})
    }
}

// Verifica el usuario. La función se dispara cuando se entra a la pagina/verify/uid, es decir, cuando clickea en el link enviado por mail para activar su cuenta.
const verify = async(req, res) => {
    const {uid} = req.params; // destructuro. Le doy el valor uid a req.params.uid. Params recoge info de la URL, por eso lo puedo recoger de ahi
    console.log(uid);
    const messageId = await model.verify(uid) // Se dispara el model que cambia el habilitado a 1. Necesito pasarle el uid para chequear que sea igual al de la base de datos.
    res.render('login', {message : "Gracias por verificar tu usuario!"}) //redirecciono a index de usuario logeado
}

router.get('/', showCreate);
router.post('/', validateRegistro, create);
router.get('/verify/:uid', verify);
module.exports = router;