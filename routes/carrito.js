const express = require('express');
const router = express.Router();
const model = require('./../models/carritoModel');
const {verifyUser} = require('./../middlewares/auth');

const getCarrito = async(req, res) => {
    let precioFinal = 0;
    const carrito = await model.getAll(req.session.user);
    console.log(carrito);
    carrito.forEach(item => {
        precioFinal += item.precio;
    });
    res.render('carrito', {carrito, precioFinal});
}
const compra = async(req, res) => {
    const msgElim = await model.deleteCarrito(req.session.user);
    res.redirect('/productos');
}
const delProducto = async(req, res) => {
    const {id : id_producto} = req.params;
    const msgElim = await model.deleteProducto(id_producto);
    res.redirect('/carrito');
}

router.get('/delProducto/:id', delProducto);
router.get('/compra', compra);
router.get('/', verifyUser, getCarrito);
module.exports = router;