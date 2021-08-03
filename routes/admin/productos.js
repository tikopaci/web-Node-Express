const express = require('express');
const router = express.Router();
const multer = require('multer');
const config = { dest: `./public/tmp`};
const upload = multer(config);
const service = require('../../services/productos');
const model = require('./../../models/productosModel');
const modelCategorias = require('./../../models/categoriasModel');

const getAll = async(req, res) => {
    const productos = await model.getAll();
    res.render('adminProductos', {productos});
}

//CRUD PRODUCTOS
const showCreate = async(req, res) => {
        const categorias = await modelCategorias.getAllCat();
        res.render('createProducto', {categorias})
}
const showUpdate = async(req, res) => {
    const {id} = req.params;
    const [producto] = await model.getSingle(id);
    const categorias = await modelCategorias.getAllCat()
    res.render('updateProducto', {producto, categorias});
}
const create = async(req, res) => {
    console.log(req.body, req.file);
    const idImg = await service.createProducto(req.body, req.file);
    res.redirect('/admin/productos');
}
const update = async(req, res) => {
    const idImg = await service.updateProducto(req.params.id, req.body, req.file);
    res.redirect('/admin/productos')
}
const del = async(req, res) => {
    const {id} = req.params;
    const msgEmpleados = await model.del(id);
    const msgImagen = await model.delImages(id);
    res.redirect('/admin/productos');
}

router.get('/', getAll);
router.get('/create', showCreate);
router.post('/create', upload.single("imagen"), create);
router.get('/update/:id', showUpdate);
router.post('/update/:id', upload.single("imagen"), update);
router.get('/delete/:id', del);
module.exports = router;