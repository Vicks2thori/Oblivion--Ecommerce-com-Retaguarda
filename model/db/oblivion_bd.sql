-- Usuário genérico
CREATE TABLE Users (
  idUser TINYINT AUTO_INCREMENT PRIMARY KEY,
  names VARCHAR(80) NOT NULL,
  emails VARCHAR(45) NOT NULL UNIQUE,
  passwords VARCHAR(80) NOT NULL,
  types BIT NOT NULL --aqui eu me perdi na hora de relacionar (0 seria cliente e 1 adm)
);

-- Clientes com dados obrigatórios
CREATE TABLE Clients (
  idClients TINYINT AUTO_INCREMENT PRIMARY KEY,
  idUsers TINYINT,
  cpfs CHAR(11) NOT NULL UNIQUE,
  cells CHAR(11) NOT NULL UNIQUE,
  FOREIGN KEY (idUser) REFERENCES User(idUser)
);

-- Admins com dados mais simples
CREATE TABLE Admins (
  idAdmins TINYINT AUTO_INCREMENT PRIMARY KEY,
  idUsers TINYINT,
  FOREIGN KEY (idUser) REFERENCES User(idUser)
);

-- Categorias
CREATE TABLE Category (
  idCategory TINYINT AUTO_INCREMENT PRIMARY KEY,
  nameCategory VARCHAR(45) NOT NULL,
  statusCategory BIT NOT NULL DEFAULT 1
);

-- Produtos
CREATE TABLE Product (
  idProduct SMALLINT AUTO_INCREMENT PRIMARY KEY,
  nameProduct VARCHAR(100) NOT NULL,
  -- imageProduct como por Deus armazena imagem wefuigearh
  precyProduct DECIMAL(8,2) NOT NULL,
  codProduct BIGINT NOT NULL,
  statusProduct BIT NOT NULL DEFAULT 1,
  idCategory TINYINT NOT NULL,
  idStock SMALLINT NOT NULL,
  FOREIGN KEY (idCategory) REFERENCES Category(idCategory),
  FOREIGN KEY (idStock) REFERENCES Stock(idStock)
);

-- Formas de pagamento
CREATE TABLE Payment (
  idPayment TINYINT AUTO_INCREMENT PRIMARY KEY,
  namePayment VARCHAR(50) NOT NULL,
  -- imgPayment mesmo bo do produto, vi sobre armazenar o caminho dela mas ainda não sei como vou apresentar
  -- e teriam imagens "padrões"
  statusPayment BIT NOT NULL DEFAULT 1
  idPaymentCondition TINYINT NOT NULL,
  FOREIGN KEY (idPaymentCondition) REFERENCES PaymentCondition(idPaymentCondition)
);

-- Condição de pagamento
CREATE TABLE PaymentCondition (
  idPaymentCondition TINYINT AUTO_INCREMENT PRIMARY KEY,
  namePaymentCondition VARCHAR(50) NOT NULL,
  statusPaymentCondition BIT NOT NULL DEFAULT 1
);

-- Estoque
CREATE TABLE Stock (
  idStock SMALLINT AUTO_INCREMENT PRIMARY KEY,
  quantityStock SMALLINT NOT NULL DEFAULT 0
);

CREATE TABLE StockCategory (
  idStockCategory SMALLINT AUTO_INCREMENT PRIMARY KEY,
  nameStockCategory VARCHAR(50) NOT NULL,
  statusStockCategory BIT NOT NULL DEFAULT 1
);

CREATE TABLE StockMoviment (
  idStockMoviment SMALLINT AUTO_INCREMENT PRIMARY KEY,
  nameStockMoviment VARCHAR(50) NOT NULL,
  dateStockMoviment DATE NOT NULL,
  idStockCategory TINYINT NOT NULL,
  -- typeStockMoviment seria relacionar a saida, entrada e definição de estoque (faria sentido armazenar em outra tabela?)
  idAdmin TINYINT NOT NULL,
  idProduct SMALLINT NOT NULL, --fica a duvida de como alterar
  FOREIGN KEY (idStockCategory) REFERENCES StockCategory(idStockCategory)
  FOREIGN KEY (idAdmin) REFERENCES Admin(idAdmin)
  FOREIGN KEY (idProduct) REFERENCES Product(idProduct)
);

CREATE TABLE Orders (
  idOrders SMALLINT AUTO_INCREMENT PRIMARY KEY,
  dateOrders DATE NOT NULL,
  codOrders CHAR(5) NOT NULL UNIQUE,
  idClients TINYINT NOT NULL,
  idProduct SMALLINT NOT NULL, --fica a duvida de como adcionar
  idPayment TINYINT NOT NULL, --no caso a condição ja vem associada com o pagamento?
  totalityOrders SMALLINT NOT NULL, --Seria o valor total dos itens (ujwdxd eu ainda não entendi muito bem)
  statusOrders BIT NOT NULL, --não da pra colocar default
  FOREIGN KEY (idClients) REFERENCES Clients(idClients),
  FOREIGN KEY (idProduct) REFERENCES Product(idProduct),
  FOREIGN KEY (idPayment) REFERENCES Payment(idPayment)
);

CREATE TABLE Enterprise ( --Não sei exatamente como chamar pq a ideia é ter um bd para cada empresa mas seria sobre o site esse
  idEnterprise TINYINT AUTO_INCREMENT PRIMARY KEY,
  nameEnterprise VARCHAR(50) NOT NULL,
  primary_colorEnterprise CHAR(6) NOT NULL DEFAULT "000000",
  second_colorEnterprise CHAR(6) NOT NULL DEFAULT "123456", --numeroa aleatórios pois ainda não decidimos o hexa "padrão"
  text_colorEnterprise CHAR(6) NOT NULL DEFAULT "FFFFFF",
  cellEnterprise CHAR(11) NOT NULL,
  -- logoEnterprise novamentea preciso decidir como armazenar imagens
  instagramEnterprise VARCHAR(50) NULL, --seria apenas o nome? preciso decidir
  facebookEnterprise VARCHAR(50) NULL,
  emailEnterprise VARCHAR(50) NULL
);