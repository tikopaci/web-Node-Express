const express = require('express');
const router = express.Router();
const model = require('./../../models/usuariosModel');
const service = require('../../services/usuarios');

const getAll = async(req, res) => {
    const usuarios = await model.getAll();
    res.render('adminUsuarios', {usuarios});
}
const buscador = async(req, res) => {
    let {busq} = req.body;
    busq = '%' + busq + '%';
    const [usuario] = await model.buscarUser(busq);
    console.log(usuario);
    if (!usuario) {
        res.render('adminUsuarios', {message : "No se encontró ningun usuario con ese nombre"})
    }
    res.render('adminUsuarios', {usuario});
}
const showUpdate = async(req, res) => {
    const {id} = req.params;
    const [usuario] = await model.getSingle(id);
    console.log(usuario);
    res.render('updateUsuario', {usuario});
}
const userAdmin = async(req, res) => {
    const {id} = req.params;
    const usuario = await model.admin(id);
    res.render('adminUsuarios', {usuario});
}
const habilitar = async(req, res) => {
    const {id} = req.params;
    const usuario = await model.habilitar(id);
    res.render('adminUsuarios', {usuario});
}
const del = async(req, res) => {
    const {id} = req.params;
    const usuario = await model.del(id);
    res.render('adminUsuarios');
}
const update = async(req, res) => {
    const user = req.body;
    let duplicado = false;
    const finalUser = { 
        username : user.username,
        mail : user.mail,
    };
    const usuariosExistentes = await model.getAll();
    usuariosExistentes.forEach(usuario => {
        if (usuario.username == finalUser.username || usuario.mail == finalUser.mail) duplicado = true;
    })
    if (!duplicado) {
    const usuario = await service.updateUsuario(req.params.id, req.body);
    res.render('adminUsuarios', {usuario});
    }
    else {
        res.render('adminUsuarios', {message : "El nombre de usuario y/o mail ingresados ya existen"})
    }
}

router.get('/', getAll);
router.get('/adm/:id', userAdmin);
router.get('/update/:id', showUpdate);
router.get('/del/:id', del);
router.get('/auth/:id', habilitar);
router.post('/update/:id', update);
router.post('/', buscador);
module.exports = router;
