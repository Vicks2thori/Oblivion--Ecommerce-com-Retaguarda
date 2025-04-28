-- Usuário genérico
CREATE TABLE Users (
  idUser TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  names VARCHAR(80) NOT NULL,
  emails VARCHAR(45) NOT NULL UNIQUE,
  passwords VARCHAR(255) NOT NULL, --Senha criptografada (255 caracteres para suportar hashes seguros)
  types ENUM('client', 'admin') NOT NULL,
);

-- Clientes com dados obrigatórios
CREATE TABLE Clients (
  idClients TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  idUsers TINYINT UNSIGNED,
  cpfs CHAR(11) NOT NULL UNIQUE,
  cells CHAR(11) NOT NULL UNIQUE,
  FOREIGN KEY (idUsers) REFERENCES Users(idUsers)
);

-- Admins com dados mais simples
CREATE TABLE Admins (
  idAdmins TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  idUsers TINYINT UNSIGNED,
  FOREIGN KEY (idUsers) REFERENCES Users(idUsers)
);

-- Categorias
CREATE TABLE Category (
  idCategory TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  nameCategory VARCHAR(45) NOT NULL,
  statusCategory BIT NOT NULL DEFAULT 1
);

-- Produtos
CREATE TABLE Product (
  idProduct SMALLINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  nameProduct VARCHAR(100) NOT NULL,
  -- imageProduct como por Deus armazena imagem wefuigearh
  precyProduct DECIMAL(8,2) NOT NULL,
  codProduct BIGINT NOT NULL,
  statusProduct BIT NOT NULL DEFAULT 1,
  idCategory TINYINT UNSIGNED NOT NULL,
  idStock SMALLINT UNSIGNED NOT NULL,
  FOREIGN KEY (idCategory) REFERENCES Category(idCategory),
  FOREIGN KEY (idStock) REFERENCES Stock(idStock)
);

-- Formas de pagamento
CREATE TABLE Payment (
  idPayment TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  namePayment VARCHAR(50) NOT NULL,
  -- imgPayment mesmo bo do produto, vi sobre armazenar o caminho dela mas ainda não sei como vou apresentar
  -- e teriam imagens "padrões"
  statusPayment BIT NOT NULL DEFAULT 1
  idPaymentCondition TINYINT UNSIGNED NOT NULL,
  FOREIGN KEY (idPaymentCondition) REFERENCES PaymentCondition(idPaymentCondition)
);

-- Condição de pagamento
CREATE TABLE PaymentCondition (
  idPaymentCondition TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  namePaymentCondition VARCHAR(50) NOT NULL,
  statusPaymentCondition BIT NOT NULL DEFAULT 1
);

-- Estoque
CREATE TABLE Stock (
  idStock SMALLINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  quantityStock SMALLINT NOT NULL DEFAULT 0
);

CREATE TABLE StockCategory (
  idStockCategory SMALLINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  nameStockCategory VARCHAR(50) NOT NULL,
  statusStockCategory BIT NOT NULL DEFAULT 1
);

CREATE TABLE StockMoviment (
  idStockMoviment SMALLINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  nameStockMoviment VARCHAR(50) NOT NULL,
  dateStockMoviment DATE NOT NULL,
  idStockCategory TINYINT UNSIGNED NOT NULL,
  typeStockMoviment ENUM('exit', 'entry', 'definition') NOT NULL,
  idAdmin TINYINT NOT NULL, 
  idProduct SMALLINT UNSIGNED NOT NULL, --fica a duvida de como alterar
  FOREIGN KEY (idStockCategory) REFERENCES StockCategory(idStockCategory)
  FOREIGN KEY (idAdmins) REFERENCES Admins(idAdmins)
  FOREIGN KEY (idProduct) REFERENCES Product(idProduct)
);

CREATE TABLE Orders (
  idOrders SMALLINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  dateOrders DATE NOT NULL,
  codOrders CHAR(5) NOT NULL UNIQUE,
  idClients TINYINT UNSIGNED NOT NULL,
  idProduct SMALLINT UNSIGNED NOT NULL, --fica a duvida de como adcionar
  idPayment TINYINT UNSIGNED NOT NULL, --no caso a condição ja vem associada com o pagamento?
  totalityOrders SMALLINT UNSIGNED NOT NULL, --Seria o valor total dos itens (ujwdxd eu ainda não entendi muito bem)
  statusOrders ENUM('pending', 'cancel', 'aproved') NOT NULL,
  FOREIGN KEY (idClients) REFERENCES Clients(idClients),
  FOREIGN KEY (idProduct) REFERENCES Product(idProduct),
  FOREIGN KEY (idPayment) REFERENCES Payment(idPayment)
);

CREATE TABLE Enterprise ( --Não sei exatamente como chamar pq a ideia é ter um bd para cada empresa mas seria sobre o site esse
  idEnterprise TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
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