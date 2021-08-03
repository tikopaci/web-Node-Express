const express = require('express');
const router = express.Router();
const {getAllCat} = require('./../models/categoriasModel');

const showCat = async(req, res) => {
    const categorias = await getAllCat();
    console.log(categorias); 
    res.render('categorias', {categorias});
}

router.get('/', showCat);
module.exports = router;