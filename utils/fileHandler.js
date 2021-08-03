const fs = require('fs');
const {v4 : uuid} = require('uuid');
const extensionesPermitidas = ["png", "jpg", "jpeg"];

//Función para cargar imagenes.
const saveFile = ({mimetype, path}, allowE, destFolder = `./public/images`) => {
    try {
    const [type, extension] = mimetype.split("/");
    if(!allowE.includes(extension)) throw "Formato incorrecto";
    const uid = uuid();
    const fileName = `${uid}.${extension}`;
    const fileNameOut = `${destFolder}/${fileName}`;
    fs.createReadStream(path).pipe(fs.createWriteStream(fileNameOut));
    fs.unlink(path, (err) => console.error(err));
    return fileName;
    } catch (e) {
        fs.unlink(path, (err) => console.error(err));
        console.error(e);
    }
}

//Funcion que utiliza saveFile, donde le paso de parametro las extensiones que permito en :3.
const imgFile = (file) => saveFile(file, extensionesPermitidas);

module.exports = { imgFile };