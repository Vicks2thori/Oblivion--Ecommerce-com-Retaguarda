CREATE TABLE type_user (
  id INT AUTO_INCREMENT PRIMARY KEY,
  type_name VARCHAR(10) NOT NULL
);

-- Inserir papéis padrão
INSERT INTO roles (type_name) VALUES ('admin'), ('client');

-- Tabela de usuários
CREATE TABLE users (
  id INT AUTO_INCREMENT PRIMARY KEY,
  email VARCHAR(255) NOT NULL UNIQUE,
  name VARCHAR(255) NOT NULL,
  password VARCHAR(255) NOT NULL,
  role_id INT,
  cpf VARCHAR(15), -- Nullable, somente para clientes
  phone VARCHAR(20), -- Nullable, somente para clientes
  FOREIGN KEY (role_id) REFERENCES roles(id)
);