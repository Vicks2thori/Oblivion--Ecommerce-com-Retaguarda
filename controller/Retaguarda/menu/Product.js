//Visualização de produtos

const {Get,GetStatus} = require("../../utils/Get")

//Exibir por status
let statusProduct = 1;
const nameTable = "Product";

//GET
Get(nameTable)
GetStatus(nameTable, statusProduct);