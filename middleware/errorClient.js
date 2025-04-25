//Respostas de erro do cliente

import app from "../server";

//Falta de autenticação 
app.use((err, req, res, next) => {
    console.error(err.stack);

    res.status(401).send("Unauthenticated");
});

/*Forbidden
Pode ocorrer do servidor enviar para ocultar um recurso de um cliente não autorizado*/
app.use((err, req, res, next) => {
    console.error(err.stack);

    res.status(404).send("Not Found");
});

//Piadinha
app.use((err, req, res, next) => {
    console.error(err.stack);

    res.status(418).send("O servidor recusa a tentativa de coar café num bule de chá.");
});

//Piadinha
app.use((err, req, res, next) => {
    console.error(err.stack);

    res.status(419).send("Css está bebado, por favor envie café");
});

//Limiação de frequencia
app.use((err, req, res, next) => {
    console.error(err.stack);

    res.status(429).send("Enviou muitas solicitações");
});