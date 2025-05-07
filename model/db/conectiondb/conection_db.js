//Criar conexão com o Banco de dados

const mysql = require('mysql2/promise'); // usa o modo async

const pool = mysql.createPool({
  host: 'localhost',      // onde está o banco (localhost = sua máquina)
  user: 'root',           // usuário padrão do MySQL no XAMPP
  password: '',           // senha (em branco por padrão no XAMPP)
  database: 'db_oblivion',  // o nome do seu banco de dados
  waitForConnections: true,
  //connectionLimit: 10,    // número máximo de conexões abertas ao mesmo tempo
  //queueLimit: 0           // número máximo de conexões na fila (0 = ilimitado)
});

module.exports = pool;