const db = require('./connection_db.js'); 

//Registrar produto
async function postProduct(nameProduct,priceProduct,codProduct,idCategory,idStock) {

  const conn = await db.getConnection();
  try {
    await conn.query(`
        INSERT INTO Product (nameProduct,priceProduct,codProduct,idCategory,idStock) VALUES (?,?,?,?,?)`, 
        [nameProduct,priceProduct,codProduct,idCategory,idStock]);
        console.log('Produto cadastrado com sucesso!');
    } catch (err) {
        console.error('Erro ao cadastrar produto:', err);
    } finally {
        conn.release();
  }
}

//Exibir produtos
async function getProduct(statusProduct) {

    const conn = await db.getConnection();
    try {
      await conn.query(`
        SELECT * FROM Product`, 
        [statusProduct]);
        console.log('Exibindo produtos por status ', statusProduct);
    } catch (err) {
        console.error('Erro ao exibir produto:', err);
    } finally {
        conn.release();
    }
}

//Exibir conforme status
async function displayProductStatus(statusProduct) {

    const conn = await db.getConnection();
    try {
      await conn.query(`
        SELECT * FROM Product WHERE (statusProduct) = ?`, 
        [statusProduct]);
        console.log('Exibindo produtos por status ', statusProduct);
    } catch (err) {
        console.error('Erro ao exibir produto:', err);
    } finally {
        conn.release();
    }
}

//Exibir conforme categoria
//Vou fazer em duas etapas primeiramente e depois agrupar com Join
async function displayProductCategory(idCategory) {

    const conn = await db.getConnection();
    try {

        //procurar as categorias conforme
        const [categories] = await conn.query(`
            SELECT idCategory FROM Category WHERE nameCategory LIKE ?`,
            [`%${namePart}%`]
          );


    } catch (err) {
        console.error('Erro ao exibir produto:', err);
    } finally {
        conn.release();
    }
}

module.exports = postProduct,getProduct,displayProductStatus;