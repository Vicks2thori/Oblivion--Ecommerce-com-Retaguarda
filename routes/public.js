import express from 'express';
const db = require('../model/db/conectiondb/conection_db'); 

const router = express.Router() //instanciando

/*
C - CREATE
R - READ
U - UPDATE
D - DELETE

post - adciona no bd
get - solicitação ao banco de dados
put - modifica a tabela inteira
patch - modifica de forma parcial
delete - deleta alguma informação
*/

//Puxar o nome da empresa para rota ecommerce
async function Enterprise() {

    const conn = await db.getConnection();
    try {
      const Enterprise = await conn.query(`
        SELECT nameEnterprise FROM Enterprise`);
        console.log('Exibindo nome da empresa na rota');
    } catch (err) {
        console.error(`Erro ao exibir nome da empresa na rota: `, err);
    } finally {
        conn.release();
    }

    return Enterprise;
}

Enterprise();

//pagina do ecommerce
router.get(`/Oblivion.app/${Enterprise}`, (req, res) => {
    res.send("pagina do ecommerce do cliente")
})
router.post(`/Oblivion.app/${Enterprise}`, (req, res) => {
    res.send("enviar pedido")
})
router.patch(`/Oblivion.app/${Enterprise}`
    , (req, res) => {
    res.send("Mudar opções de cadastros")
})

//pagina de login
router.get("/login", (req, res) => {
    res.send("A pagina de login filha")
})
router.post("/login", (req, res) => {
    res.send("Postou!!! login")

    const typeUser = client;

    if (typeUser == client) {
        res.redirect("/")
    }
    else if (typeUserr == admin) {
        res.redirect("/retaguarda/ordermanegement")
    }


})

//pagina de cadastro
router.get("/register", (req, res) => {
    res.send("A pagina de regsitro filha")
    const register = false;

    if (register == true) {
        res.redirect("/login")
    }
})

router.post("/register", (req, res) => {
    res.send("Postou!!! cadastro")
})

export default router;