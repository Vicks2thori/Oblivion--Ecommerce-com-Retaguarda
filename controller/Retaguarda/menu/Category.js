//Modulo de Categoria

const {Get,GetStatus} = require("../../utils/Get")
const {PostTableSimple} = require("../../utils/Post")

//Variaveis temporárias
let statusCategory = 1;
let nameCategory = "Joias";
const nameTable = "Category"

//Funções
//POST
PostTableSimple(nameTable, nameCategory, statusCategory);

//GET
Get(nameTable)
GetStatus(nameTable, statusCategory);