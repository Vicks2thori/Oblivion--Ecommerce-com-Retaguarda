//Respostas de erro do Servidor

import app from "../server";

//Encontrou uma situação que não sabe lidar
app.use((err, req, res, next) => {
    console.error(err.stack);

    res.status(500).send("Internal Server Error");
});

//O servidor não pode manipular a requisição (Manutenção ou sobrecarga) 
app.use((err, req, res, next) => {
    console.error(err.stack);

    res.status(503).send("Retry After");
});