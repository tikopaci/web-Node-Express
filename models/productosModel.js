const pool = require('./../utils/bd');

//GET PRODUCTOS
const getAll = async() => {
    try{
        const query = "SELECT p.id, p.nombre, p.id_categoria, p.descripcion, p.precio, p.stock, pi.uid AS imagenProducto, c.nombre AS nombreCategoria FROM ?? AS p JOIN ?? AS c ON p.id_categoria = c.id JOIN ?? AS pi ON p.id = pi.id_producto WHERE p.eliminado = 0";
        const params = [process.env.T_PRODUCTOS, process.env.T_CATEGORIAS, process.env.T_PRODUCTOSIMG];
        const rows = await pool.query(query, params);
        return rows;    
    } catch (e) {
        console.error(e);
    }       
}
const getSingle = async(id) => {
    try{
        const query = "SELECT p.id, p.nombre, p.id_categoria, p.descripcion, p.precio, p.stock, pi.uid AS imagenProducto, c.nombre AS nombreCategoria FROM ?? AS p JOIN ?? AS c ON p.id_categoria = c.id JOIN ?? AS pi ON p.id = pi.id_producto WHERE p.id = ? AND p.eliminado = 0";
        const params = [process.env.T_PRODUCTOS, process.env.T_CATEGORIAS, process.env.T_PRODUCTOSIMG, id];
        const rows = await pool.query(query, params);
    return rows; 
    } catch (e) {
        console.error(e);
    }       
}
const getAllwCat = async(id) => {
    try{
        const query = "SELECT p.id, p.nombre, p.descripcion, p.precio, p.id_categoria, p.stock, pi.uid as imagenProducto FROM ?? AS p JOIN ?? AS pi ON p.id = pi.id_producto WHERE p.eliminado = 0 AND p.id_categoria = ?";
        const params = [process.env.T_PRODUCTOS, process.env.T_PRODUCTOSIMG, id];
        const rows = await pool.query(query, params);
        return rows;
    } catch (e) {
        console.error(e);
    }    
}

//CRUD PRODUCTOS
const create = async(obj) => {
    try{
        const query = "INSERT INTO ?? SET ?";
        const params = [process.env.T_PRODUCTOS, obj];
        return await pool.query(query, params);
    } catch (e) {
        console.error(e);
    }
}
const update = async(id, obj) => {
    try{
        const query = "UPDATE ?? SET ? WHERE id = ?"
        const params = [process.env.T_PRODUCTOS, obj, id];
        return await pool.query(query, params)
    } catch (e) {
        console.error(e);
    }
} 
const del = async(id) => {
    try{
        const query = "UPDATE ?? SET eliminado = 1 WHERE id = ?"
        const params = [process.env.T_PRODUCTOS, id];    
        return await pool.query(query, params)
    } catch (e) {
        console.error(e);
    } 
}
//CRUD IMAGENES PRODUCTOS
const createImages = async(obj) => {
    const query = "INSERT INTO ?? SET ?";
    const params = [process.env.T_PRODUCTOSIMG, obj];
    return await pool.query(query, params);
}
const updateImages = async(id, obj) => {
    try{
        const query = "UPDATE ?? SET ? WHERE id_producto = ?";
        const params = [process.env.T_PRODUCTOSIMG, obj, id];
        return await pool.query(query, params);
    } catch (e) {
        console.error(e);
    } 
}
const delImages = async(id) => {
    try{
        const query = "UPDATE ?? SET eliminado = 1 WHERE id = ?";
        const params = [process.env.T_PRODUCTOSIMG, id];
        return await pool.query(query, params);
    } catch (e) {
        console.error(e);
    } 
}
//BUSCADOR PRODUCTOS
const buscarProd = async(nombre) => {
    try{
        const query = "SELECT p.id, p.nombre, p.descripcion, p.precio, p.id_categoria, p.stock, pi.uid as imagenProducto, c.nombre AS nombreCategoria FROM ?? AS p JOIN ?? AS c ON p.id_categoria = c.id JOIN ?? AS pi ON p.id = pi.id_producto WHERE p.nombre LIKE ? AND p.eliminado = 0";
        const params = [process.env.T_PRODUCTOS, process.env.T_CATEGORIAS, process.env.T_PRODUCTOSIMG, nombre];
        const rows = await pool.query(query, params);
        return rows;
    } catch (e) {
        console.error(e);
    } 
}

module.exports = { getAll, getSingle, create, update, del, createImages, updateImages, delImages, buscarProd, getAllwCat };