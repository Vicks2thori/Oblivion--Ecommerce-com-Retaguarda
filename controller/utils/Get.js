//Criando funções comuns para mostrar

const db = require('../../model/db/connection_db.js');

//GET
async function Get(nameTable) {
    const conn = await db.getConnection();
    try {
      await conn.query(`
        SELECT * FROM ${nameTable}`);
        console.log('Exibindo itens de ', nameTable);
    } catch (err) {
        console.error(`Erro ao exibir ${nameTable}: `, err);
    } finally {
        conn.release();
    }
}

//Exibir conforme status
async function GetStatus(nameTable, status) {
    let statusColumn = "status" + nameTable; //Minhas tabelas todas 
    const conn = await db.getConnection();
    try {
      await conn.query(`
        SELECT * FROM ${nameTable} WHERE ${statusColumn} = ?`,
        [status]);
        console.log('Exibindo itens por status ', status);
    } catch (err) {
        console.error(`Erro ao exibir ${nameTable} por status ${status}: `, err);
    } finally {
        conn.release();
    }
}

module.export = {GetStatus, Get};