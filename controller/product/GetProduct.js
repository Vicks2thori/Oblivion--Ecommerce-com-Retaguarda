//Visualização de produtos

const {GetStatus} = require("../utils/Get")

//Exibir por status
let statusProduct = "1";
GetStatus("Product", statusProduct);