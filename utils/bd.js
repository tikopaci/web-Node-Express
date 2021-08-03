const mysql = require('mysql');
const util = require('util');

//Me conecto a la base de datos. Mysql sirve para esto.
let pool = mysql.createPool({
    host : process.env.DB_HOST || 'localhost',
    user : process.env.DB_USER || 'root',
    password : process.env.DB_PASS || '',
    port: process.env.DB_PORT || 3306,
    database: process.env.DB_DATABASE, 
});
//el modulo Util me sirve para transfromar en promesa los request a la bd.
pool.query = util.promisify(pool.query);

module.exports = pool;