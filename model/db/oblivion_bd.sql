-- Usuário genérico
CREATE TABLE User (
  idUser TINYINT AUTO_INCREMENT PRIMARY KEY,
  nameUser VARCHAR(100) NOT NULL,
  emailUser VARCHAR(100) NOT NULL UNIQUE,
  passUser VARCHAR(255) NOT NULL,
  typeUser BIT NOT NULL
);

-- Clientes com dados obrigatórios
CREATE TABLE Client (
  idUser TINYINT PRIMARY KEY,
  cpfClient CHAR(11) NOT NULL UNIQUE,
  cellClient CHAR(11) NOT NULL UNIQUE,
  FOREIGN KEY (idUser) REFERENCES User(idUser)
);

-- Admins com dados mais simples
CREATE TABLE Admin (
  idUser TINYINT PRIMARY KEY,
  FOREIGN KEY (idUser) REFERENCES User(idUser)
);

-- Categorias
CREATE TABLE Category (
  idCategory TINYINT AUTO_INCREMENT PRIMARY KEY,
  nameCategory VARCHAR(45) NOT NULL,
  statusCategory BIT NOT NULL DEFAULT 1
);

-- Estoque
CREATE TABLE Stock (
  idStock SMALLINT AUTO_INCREMENT PRIMARY KEY,
  quantityStock SMALLINT NOT NULL DEFAULT 0
);

-- Produtos
CREATE TABLE Product (
  idProduct SMALLINT AUTO_INCREMENT PRIMARY KEY,
  nameProduct VARCHAR(100) NOT NULL,
  precyProduct DECIMAL(10,2) NOT NULL,
  codProduct VARCHAR(45) NOT NULL,
  deliveryProduct BIT NOT NULL DEFAULT 0,
  statusProduct BIT NOT NULL DEFAULT 1,
  idCategory TINYINT NOT NULL,
  idStock SMALLINT NOT NULL,
  FOREIGN KEY (idCategory) REFERENCES Category(idCategory),
  FOREIGN KEY (idStock) REFERENCES Stock(idStock)
);

-- Formas de pagamento
CREATE TABLE Payment (
  idPayment TINYINT AUTO_INCREMENT PRIMARY KEY,
  namePayment VARCHAR(100) NOT NULL,
  imgPayment VARCHAR(50) NOT NULL,
  statusPayment BIT NOT NULL DEFAULT 1
  idConditionPayment TINYINT NOT NULL,
  FOREIGN KEY (idConditionPayment) REFERENCES Stock(idStock)
);

-- Condição de pagamento
CREATE TABLE ConditionPayment (
  idConditionPayment TINYINT AUTO_INCREMENT PRIMARY KEY,
  nameConditionPayment VARCHAR(100) NOT NULL,
  statusPayment BIT NOT NULL DEFAULT 1
);