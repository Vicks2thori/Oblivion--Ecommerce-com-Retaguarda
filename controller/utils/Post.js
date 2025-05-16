const db = require('../../model/db/connection_db.js');

// Adicionar apenas nome e Status
async function PostTableSimple(nameTable, name, status) {
    const nameColumn = "name" + nameTable;     // ex: nameCategoria
    const statusColumn = "status" + nameTable; // ex: statusCategoria

    const conn = await db.getConnection();
    try {
        await conn.query(`
            INSERT INTO ${nameTable} (${nameColumn}, ${statusColumn})
            VALUES (?, ?)`, 
            [name, status]);
        console.log('Inserido com sucesso em', nameTable);
    } catch (err) {
        console.error(`Erro ao inserir em ${nameTable}:`, err);
    } finally {
        conn.release();
    }
}

module.exports = { PostTableSimple };
