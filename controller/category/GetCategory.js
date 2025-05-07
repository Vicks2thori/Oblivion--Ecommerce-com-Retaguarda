const db = require('./connection_db.js'); //importar conexão com bd

//função assincrona por esperar (await) conexão com banco de dados
async function registerCategory(nameCategory) {

  const conn = await db.getConnection(); //conn é uma conexão individual retirada do pool
  try {
    //Query de insert
    await conn.query(`
      INSERT INTO Category (nameCategory) VALUES (?)`, [nameCategory]);
    console.log('Categoria cadastrada com sucesso!'); //aqui vai ser enviada um pop up pra avisar
  } catch (err) {
    console.error('Erro ao cadastrar categoria:', err); //isso aqui nem era pra acontecer erherh mas vai ter pop up
  } finally {
    conn.release();
  }
}

module.exports = registerCategory;