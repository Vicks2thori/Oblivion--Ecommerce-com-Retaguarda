//Criando funções comuns para mostrar

const db = require('../../model/db/connection_db.js'); 

//Exibir conforme status
async function GetStatus(nameTable, status) {
    let statusTable = "status" + nameTable; //Minhas tabelas todas 
    const conn = await db.getConnection();
    try {
      await conn.query(`
        SELECT * FROM ${nameTable} WHERE ${statusTable} = ${status}`);
        console.log('Exibindo produtos por status ', statusProduct);
    } catch (err) {
        console.error(`Erro ao exibir ${nameTable}: `, err);
    } finally {
        conn.release();
    }
}

module.export = {GetStatus};