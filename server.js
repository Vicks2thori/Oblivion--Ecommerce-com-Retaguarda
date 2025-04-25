import express from 'express'; //importar o modulo do espress
import publicRoutes from "./routes/public.js"; //importação das rotas publicas (E-commerce)

const app = express(); //instanciando

app.use('/', publicRoutes);

app.listen(4002); //definido porta base para a "aplicação e escutando" ela