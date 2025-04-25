import express from "express";


//função que checa se o usuáro está logado
const checkAuth = function (req, res, next) {

    req.authStatus = true;

    if (req.authStatus) {
        res.send("Está logado");
        next();
    } else{
        res.send("Não está logado!");
    }
}