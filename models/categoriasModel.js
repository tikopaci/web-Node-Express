const pool = require('./../utils/bd');

// GET CATEGORIAS
const getCat = async(id) => {
    const query = "SELECT p.id, p.nombre, p.descripcion, p.precio, p.stock, c.id, c.nombre AS nombreCategoria FROM ?? AS p JOIN ?? AS c ON p.id_categoria = c.id WHERE c.id = ? AND p.eliminado = 0";
    const params = [process.env.T_PRODUCTOS, process.env.T_CATEGORIAS, id];
    const rows = await pool.query(query, params);
    return rows;    
}
const getAllCat = async() => {
    const query = "SELECT c.id, c.nombre, c.descripcion FROM ?? AS c WHERE c.eliminado = 0"
    const params = [process.env.T_CATEGORIAS];
    const rows = await pool.query(query, params);
    return rows; 
}

module.exports = { getCat, getAllCat }