CREATE DATABASE PaperSoft;

USE PaperSoft;

CREATE TABLE Endereco (
    Id_Endereco INT AUTO_INCREMENT PRIMARY KEY, 
    Logradouro_Endereco VARCHAR(225) NOT NULL, 
    Numero_Endereco INT NOT NULL,                
    Bairro_Endereco VARCHAR(225) NOT NULL,      
    Cidade_Endereco VARCHAR(225) NOT NULL,      
    CEP_Endereco VARCHAR(10) NOT NULL           
);

CREATE TABLE Produto (
    Id_Produto INT AUTO_INCREMENT PRIMARY KEY, 
    Cod_Produto INT NOT NULL,                 
    Tipo_Produto VARCHAR(225) NOT NULL,        
    Nome_Produto VARCHAR(225) NOT NULL,        
    Marca_Produto VARCHAR(255) NOT NULL,       
    Estoque_Atual INT NOT NULL DEFAULT 0,      
    Valor_Produto DECIMAL(10,2) NOT NULL       
);

CREATE TABLE Cliente (
    Id_Cliente INT AUTO_INCREMENT PRIMARY KEY, 
    Cod_Cliente INT NOT NULL,                   
    Nome_Cliente VARCHAR(225) NOT NULL,        
    CPF_Cliente VARCHAR(14) NOT NULL,           
    Tel_Cliente VARCHAR(15) NOT NULL,          
    Email_Cliente VARCHAR(225) NOT NULL,        
    Id_Endereco INT,                           
    FOREIGN KEY (Id_Endereco) REFERENCES Endereco(Id_Endereco)  
);

CREATE TABLE NotaFiscal (
    Id_NotaFiscal INT AUTO_INCREMENT PRIMARY KEY,
    Cod_NotaFiscal INT NOT NULL,                  
    ValorPedido_NotaFiscal DECIMAL(10,2) NOT NULL, 
    DataPedido_NotaFiscal DATE NOT NULL,           
    DataEntrega_NotaFiscal DATE NOT NULL,          
    Id_Endereco INT,                              
    FOREIGN KEY (Id_Endereco) REFERENCES Endereco(Id_Endereco) 
);


CREATE TABLE Fornecedor (
    Id_Fornecedor INT AUTO_INCREMENT PRIMARY KEY, 
    Cod_Fornecedor INT NOT NULL,                 
    Nome_Fornecedor VARCHAR(225) NOT NULL,       
    CNPJ_Fornecedor VARCHAR(18) NOT NULL,         
    Id_Endereco INT,                              
    Id_Produto INT,                              
    Id_NotaFiscal INT,                            
    FOREIGN KEY (Id_Endereco) REFERENCES Endereco(Id_Endereco), 
    FOREIGN KEY (Id_Produto) REFERENCES Produto(Id_Produto),   
    FOREIGN KEY (Id_NotaFiscal) REFERENCES NotaFiscal(Id_NotaFiscal) 
);

CREATE TABLE Funcionario (
    Id_Funcionario INT AUTO_INCREMENT PRIMARY KEY, 
    Cod_Funcionario INT NOT NULL,                  
    Nome_Funcionario VARCHAR(225) NOT NULL,        
    CPF_Funcionario VARCHAR(14) NOT NULL,          
    Cargo_Funcionario VARCHAR(100) NOT NULL,       
    Salario_Funcionario DECIMAL(10,2) NOT NULL,    
    Tel_Funcionario VARCHAR(15) NOT NULL,          
    Email_Funcionario VARCHAR(225) NOT NULL        
);

CREATE TABLE Venda (
    Id_Venda INT AUTO_INCREMENT PRIMARY KEY,        
    Cod_Venda INT NOT NULL,                          
    Data_Venda DATE NOT NULL,                        
    ValorTotal_Venda DECIMAL(10,2) NOT NULL,        
    QntProduto_Venda INT NOT NULL,                  
    FormaPagamento_Venda VARCHAR(225) NOT NULL,    
    Id_Produto INT,                                 
    Id_Cliente INT,                                  
    Id_Funcionario INT,                              
    FOREIGN KEY (Id_Produto) REFERENCES Produto(Id_Produto),   
    FOREIGN KEY (Id_Cliente) REFERENCES Cliente(Id_Cliente),   
    FOREIGN KEY (Id_Funcionario) REFERENCES Funcionario(Id_Funcionario)  
);

INSERT INTO Produto (Cod_Produto, Tipo_Produto, Nome_Produto, Marca_Produto, Estoque_Atual, Valor_Produto) values
('1', 'Caneta', 'C. Esferográfica', 'Bic', '2000', '02.90'),
('2', 'Caneta', 'Kit 10 C. Esferográfica', 'Cis', '2000', '18.00'),
('3', 'Caneta', 'Kit 12 C. Hidrográfica', 'FaberCastell', '1100', '12.00'),
('4', 'Caneta', 'Kit 24 C. Hidrográfica', 'FaberCastell', '1100', '25.00'),
('5', 'Caneta', 'C. Gel', 'Bic', '800', '04.99'),
('6', 'Caneta', 'C. Marcadora', 'Stabilo', '900', '08.00'),
('7', 'Caneta', 'Kit 5 C. Marcadora', 'Stabilo', '900', '18.00'),
('8', 'Lapis', 'L. Preto', 'FaberCastell', '3000', '02.90'),
('9', 'Lapis', 'Kit 24 L. Colorido', 'FaberCastell', '2000', '30.00'),
('10', 'Lapis','Kit 48 L. Colorido', 'FaberCastell', '2000', '40.00'),
('11', 'Lapis', 'Lapiseira 0.7', 'FaberCastell', '1000', '07.00'),
('12', 'Borracha', 'Borracha Macia', 'FaberCastell', '2000', '03.00'),
('13', 'Apontador', 'Apontador com depósito', 'FaberCastell', '2000', '05.00'),
('14', 'Caderno', 'Caderno 1 Mat.', 'Spiral', '3000', '30.00'),
('15', 'Caderno', 'Caderno 10 Mat.', 'Spiral', '3000', '40.00'),
('16', 'Caderno', 'Caderno 15 Mat.', 'Spiral', '2000', '45.00'),
('17', 'Caderno', 'Caderno 20 Mat.', 'Spiral', '2000', '50.00'),
('18', 'Fichario', 'Fichario 1 Mat.', 'Spiral', '1000', '55.00'),
('19', 'Fichario', 'Fichario 10 Mat.', 'Spiral', '1000', '65.00'),
('20', 'Pasta', 'Pasta Simples', 'Spiral', '2000', '15.00');
