const express = require('express');
const router = express.Router();
const {getAll, getSingle, buscarProd, getAllwCat} = require('./../models/productosModel');
const modelCarrito = require('./../models/carritoModel');
const {getCat} = require('./../models/categoriasModel');
const {verifyUser} = require('./../middlewares/auth');

const singleCat = async(req, res) => {
    const {id} = req.params; 
    const [productos] = await getCat(id); 
    res.render('productos', {productos}) 
}
const all = async(req, res) => {
    const productos = await getAll();
    res.render('productos', {productos});
}
const allCat = async(req, res) => {
    const {id} = req.params;
    console.log(id);
    const productos = await getAllwCat(id);
    res.render('productos', {productos})
}
const single = async(req, res) => {
    const {id} = req.params; 
    const [producto] = await getSingle(id); 
    res.render('producto', {producto}) 
}
const buscador = async(req, res) => {
    let {busq} = req.body;
    busq = '%' + busq + '%';
    const productos = await buscarProd(busq);
    console.log(productos);
    if (!productos) {
        res.render('productos', {message : "No se encontró ningun producto con ese nombre"})
    }
    res.render('productos', {productos});
}
const insertCarrito = async (req, res) => {
    const {id : id_producto} = req.params;
    const id_usuario = req.session.user;
    const obj = {
        id_producto,
        id_usuario
    };
    const {insertId} = await modelCarrito.insertCarrito(obj);
    console.log(insertId);
    res.redirect('/carrito');
}

router.get('/', all);
router.get('/:id', allCat);
router.get('/:id', singleCat)
router.get('/single/:id', single);
router.post('/', buscador);
router.get('/buy/:id', verifyUser, insertCarrito);
module.exports = router;