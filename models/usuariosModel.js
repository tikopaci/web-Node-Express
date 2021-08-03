const pool = require('./../utils/bd');

// Model one liner para crear usuario
const create = (obj) => 
    pool.query("INSERT INTO ?? SET ?", [process.env.T_USERS, obj]).then(response => response).catch(err => console.error(err));

// Model one liner para verificar mail de usuario
const verify = (uid) => 
    pool.query("UPDATE ?? SET habilitado = 1 WHERE confirmacionCorreo = ?", [process.env.T_USERS, uid]).then(response => response).catch(err => console.error(err));

// Model one liner para logearse
const auth = async(username, pass) => 
    pool.query("SELECT * FROM ?? WHERE username = ? AND pass = ? AND habilitado = 1 AND eliminado = 0", [process.env.T_USERS, username, pass]).then(response => response).catch(err => console.error(err))

//GET INFO PERFIL
const perfil = async(id_user) => {
    const query = "SELECT u.id, u.username, u.pass, u.mail FROM ?? AS u WHERE u.id = ? and u.habilitado = 1"
    const params = [process.env.T_USERS, id_user];
    return await pool.query(query, params);
}
//GET ALL Users
const getAll = async() => {
    const query = "SELECT * FROM ?? WHERE eliminado = 0";
    const params = [process.env.T_USERS];
    const rows = await pool.query(query, params)
    return rows;
}
//UPDATE USER
const update = async(id, obj) => {
    const query = "UPDATE ?? SET ? WHERE id = ?";
    const params = [process.env.T_USERS, obj, id];
    return await pool.query(query, params);
}
//SETEAR USUARIO EN HABIILITADO
const habilitar = async(id) => {
    const query = "UPDATE ?? SET habilitado = 1 WHERE id = ?";
    const params = [process.env.T_USERS, id];
    return await pool.query(query, params);
}
//HACER ADMIN A USUARIO
const admin = async(id) => {
    const query = "UPDATE ?? SET admin = 1 WHERE id = ?";
    const params = [process.env.T_USERS, id];
    return await pool.query(query, params);
}
const buscarUser = async(nombre) => {
    try{
        const query = "SELECT u.id, u.username, u.mail, u.habilitado, u.admin FROM ?? AS u WHERE u.username LIKE ? AND u.eliminado = 0";
        const params = [process.env.T_USERS, nombre];
        const rows = await pool.query(query, params);
        return rows;
    } catch (e) {
        console.error(e);
    } 
}
const del = async(id) => {
    const query = "UPDATE ?? SET eliminado = 1 WHERE id = ?"
    const params = [process.env.T_USERS, id]
    const rows = await pool.query(query, params);
    return rows;
}
const getSingle = async(id) => {
    try{
        const query = "SELECT u.id, u.username, u.mail, u.habilitado, u.admin FROM ?? AS u WHERE u.id = ?";
        const params = [process.env.T_USERS, id];
        const rows = await pool.query(query, params);
        return rows;
    } catch (e) {
        console.error(e);
    } 
}

module.exports = { create, verify, auth, perfil, update, getAll, habilitar, admin, buscarUser, del, getSingle };