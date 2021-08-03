const { update } = require('./../models/usuariosModel');

const updateUsuario = async(id, body) => {
    try {
        const id_usuario = await update(id, body);
        return id_usuario;
    }
    catch (e) {
        console.error(e);
    }
}

module.exports = { updateUsuario };