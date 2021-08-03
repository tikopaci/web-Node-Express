const express = require('express');
const router = express.Router();
const sha1 = require('sha1');
const {auth} = require('./../models/usuariosModel');
const {validateLogin} = require('./../middlewares/usuariosMw');

const showLogin = (req, res) => res.render('login', {message: ''});

const login = async(req, res) => {
    let {username, pass} = req.body;
    pass = sha1(pass);
    const logged = await auth(username, pass);
    console.log(logged);
    if (logged.length === 0) {
        res.render('login', {message: 'Usuario o contraseña incorrectos'});
    }
    else {
        const [{id, admin}] = logged;
        req.session.user = id;
        req.session.admin = admin;
        if (admin == 1) {
            res.redirect('/admin');
        }
        else {
            res.redirect('/index')
        }
    }
}

router.get('/', showLogin);
router.post('/', validateLogin, login);
module.exports = router;