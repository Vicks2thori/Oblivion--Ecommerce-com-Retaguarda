//Visualização de categoria de estoque

const {Get,GetStatus} = require("../../utils/Get")
const {PostTableSimple} = require("../../utils/Post")

//Variaveis temporárias
let statusStockCategory = 1;
let nameStockCategory = "Dano/Extravio";
const nameTable = "StockCategory"

//Funções
//POST
PostTableSimple(nameTable, nameStockCategory, statusStockCategory);

//GET
Get(nameTable)
GetStatus(nameTable, statusStockCategory);