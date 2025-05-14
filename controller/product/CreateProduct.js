const db = require('./connection_db.js'); 

//Validar os atributos dos produtos
async function valideProduct(nameProduct,priceProduct,codProduct,idCategory,idStock) {

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

module.exports = postProduct;