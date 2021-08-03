const {create, createImages, update, updateImages } = require('./../models/productosModel');
const {imgFile} = require('./../utils/fileHandler');

const createProducto = async(body, file) => {
    try {
        const {insertId : id_producto} = await create(body, file);
        const uid = imgFile(file);
        const obj = {id_producto, uid};
        const {insertId : idImg} = await createImages(obj);
        return idImg
    }
    catch (e) {
        console.error(e);
    }
}
const updateProducto = async(id, body, file) => {
    try {
        const id_producto = await update(id, body, file);
        if(file){
            const uid = imgFile(file);
            const obj = {uid};
            const idImg = await updateImages(id, obj);
            console.log(obj);
            console.log(uid);
            return idImg;
        }
        else {
            return id_producto;
        }
    }
    catch (e) {
        console.error(e);
    }
}

module.exports = { createProducto, updateProducto };