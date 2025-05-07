//Visualização de condição de pagamento

const {GetStatus} = require("../utils/Get")

//Exibir por status
let statusConditionPayment = "1";
GetStatus("ConditionPayment", statusConditionPayment);