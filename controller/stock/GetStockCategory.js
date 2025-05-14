//Visualização de categoria de estoque

const {GetStatus} = require("../utils/Get")

//Exibir por status
let statusStockCategory = "1";
GetStatus("StockCategory", statusStockCategory);