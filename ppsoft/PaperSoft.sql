create database papersoft;
use papersoft;

CREATE TABLE clientes (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    cpf VARCHAR(14) UNIQUE NOT NULL,
    telefone VARCHAR(20),
    email VARCHAR(100)
);

CREATE TABLE categorias (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(50) NOT NULL
);

CREATE TABLE fornecedores (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    cnpj VARCHAR(18) NOT NULL,
    telefone VARCHAR(20),
    email VARCHAR(100),
    endereco TEXT
);

CREATE TABLE produtos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    descricao TEXT,
    preco DECIMAL(10,2) NOT NULL,
    estoque INT NOT NULL,
    id_categoria INT,
    id_fornecedor INT,
    FOREIGN KEY (id_categoria) REFERENCES categorias(id),
    FOREIGN KEY (id_fornecedor) REFERENCES fornecedores(id)
);

CREATE TABLE funcionarios (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    cpf VARCHAR(14) UNIQUE NOT NULL,
    cargo VARCHAR(50),
    salario DECIMAL(10,2),
    data_admissao DATE,
    endereco TEXT,
    login VARCHAR(50) UNIQUE NOT NULL,
    senha VARCHAR(255) NOT NULL
);

CREATE TABLE vendas (
    id INT AUTO_INCREMENT PRIMARY KEY,
    id_cliente INT,
    id_funcionario INT,
    data_venda DATETIME DEFAULT CURRENT_TIMESTAMP,
    total DECIMAL(10,2),
    FOREIGN KEY (id_cliente) REFERENCES clientes(id),
    FOREIGN KEY (id_funcionario) REFERENCES funcionarios(id)
);

CREATE TABLE itens_venda (
    id INT AUTO_INCREMENT PRIMARY KEY,
    id_venda INT,
    id_produto INT,
    quantidade INT NOT NULL,
    preco_unitario DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (id_venda) REFERENCES vendas(id),
    FOREIGN KEY (id_produto) REFERENCES produtos(id)
);

insert into cliente (nome, telefone, email) values
('João da Silva', '532.847.726-83', '1199999-8888', 'joao@gmail.com'), 
('Maria Oliveira','642.638.912-75', '1188888-9999', 'maria@gmail.com');

insert into categoria (nome) values
('Papelaria'),('Informática');

insert into fornecedor (nome, telefone, email, endereco) values
('Distribuidora PapelMais', '98.765.432/0001-55', 'administracao@papelmais.com', 'Rua Estefano, 746 - São Paulo'),
('InfoTech Periféricos', '12.345.678/0001-90', 'contato@infotech.com', 'Av. Josué Magnano, 732 - São Paulo');

insert into produto (nome, descrição, preço, estoque, id_categoria, id_fornecedor) values
('Caderno universitário', 'Capa dura, 200 folhas', 15.90, 100, 1, 1),
('Mouse Óptico USB', 'Mouse com fio, 1000 DPI', 25.50, 50, 2, 2);

insert into funcionario (nome, cpf, cargo, salario, data_admissao, endereco, login, senha) values
('Carlos Souza', '123.456.789-00', 'Recursos Humanos', 2600.00, '2023-03-06', 'Rua Klod, 23 - São Bernardo', 'Carlos00', 'senha123'),
('Fernanda Lima', '931.658.302-52', 'Caixa/Atendente', 1800.00, '22-12-09', 'Avenida Santos Cabresco, 28 - Santo André11', 'senhal1');

insert into venda (id_cliente, id_funcionario, total) values
(1, 1, 31.80), (2, 2, 25.50);


insert into itens_venda(id_venda, id_produto, quantidade, preco_unitario) values
(1, 1, 2, 15.90), (2, 1, 25.50);
