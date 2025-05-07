import express from 'express'; //importar o modulo do espress
import morgan from "morgan";

import publicRoutes from "./routes/public.js"; //importação das rotas publicas (E-commerce)

const app = express(); //instanciando

app.use('/', publicRoutes);
app.use(morgan(':method :url :status :res[content-length] - :response-time ms'));

app.listen(4002, () => {
    console.log(`Server is listen on: http://localhost:${4002}`);
}); //definido porta base para a "aplicação e escutando" ela