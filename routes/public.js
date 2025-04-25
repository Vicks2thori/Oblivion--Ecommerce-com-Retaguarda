import express from 'express';

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

//pagina do ecommerce
router.get("/", (req, res) => {
    res.send("pagina do ecommerce do cliente")
})
router.post("/", (req, res) => {
    res.send("enviar pedido")
})
router.patch("/", (req, res) => {
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