//Visualização de pagamentos

const {GetStatus} = require("../../utils/Get")

//Exibir por status
let statusPayment = "1";
GetStatus("Payment", statusPayment);