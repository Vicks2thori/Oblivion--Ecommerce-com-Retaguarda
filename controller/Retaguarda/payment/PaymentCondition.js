//Modulo condição de pagamento

const {Get,GetStatus} = require("../../utils/Get")
const {PostTableSimple} = require("../../utils/Post")

//Variaveis temporárias
let statusConditionPayment = 1;
let nameConditionPayment = "Á vista";
const nameTable = "ConditionPayment"

//POST
PostTableSimple(nameTable, nameConditionPayment, statusConditionPayment)

//GET
Get(nameTable)
GetStatus(nameTable, statusConditionPayment);