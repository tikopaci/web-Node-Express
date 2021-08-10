const express = require('express');
const router = express.Router();
const sha1 = require('sha1');
const {auth} = require('./../models/usuariosModel');
const {validateLogin} = require('./../middlewares/usuariosMw');

const showLogin = (req, res) => res.render('login', {message: ''});

const login = async(req, res) => {
    let {username, pass} = req.body;
    pass = sha1(pass);
    const [logged] = await auth(username, pass);
    console.log(logged);
    if (!logged) {
        res.render('login', {message: 'Usuario o contraseña incorrectos'});
    }
    else if (logged.habilitado === 0) {
        res.render( 'login', {message: "Primero tienes que habilitar tu cuenta, revisa tu mail!"})
    }
    else {
        const {id, admin} = logged;
        req.session.user = id;
        req.session.admin = admin;

        admin == 1 ? res.redirect('/admin') : res.redirect('/');
    }
}

router.get('/', showLogin);
router.post('/', validateLogin, login);
module.exports = router;