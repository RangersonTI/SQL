CREATE DATABASE Vendas;
USE Vendas;

CREATE TABLE Produtos(
Codigo INTEGER PRIMARY KEY AUTO_INCREMENT,
Descricao VARCHAR(60),
Preco FLOAT(10,2),
Quantidade INT,
Quantidade_minima INT,
Quantidade_maxima INT
);

CREATE TABLE Cadastro_Clientes(
ID_Cliente INT PRIMARY KEY AUTO_INCREMENT,
Nome VARCHAR(40),
CPF VARCHAR(14),
RG VARCHAR(15),
Endereco VARCHAR(60),
Telefone VARCHAR(11)
);

CREATE TABLE Cadastro_Vendedores(
ID_Vendedor INT PRIMARY KEY AUTO_INCREMENT,
Nome VARCHAR(40),
Endereco VARCHAR(60),
Telefone VARCHAR(11),
Celular VARCHAR(11),
CPF VARCHAR(14)
);

CREATE TABLE Tabela_Vendas(
ID_Vendas INT PRIMARY KEY AUTO_INCREMENT,
Total_vendas FLOAT(10,2),
DData DATE,
Hora TIME,
Cod_Vendedor INT,
Cod_Cliente INT,
FOREIGN KEY (Cod_Vendedor) REFERENCES Cadastro_Vendedores(ID_Vendedor),
FOREIGN KEY (Cod_Cliente) REFERENCES Cadastro_Clientes(ID_Cliente) 
);

INSERT INTO Cadastro_Vendedores(Nome,Endereco,Telefone,Celular,CPF)VALUES('Silva dos Teclados','Rua dos Tiranosáuros, 341','9940028922','99982263145','454.956.842-50');
INSERT INTO Cadastro_Vendedores(Nome,Endereco,Telefone,Celular,CPF)VALUES('Almilho Vieira','Avenida Dorgival Pinheiro, 633','9991523140','99991502249','955.487.562-30');

INSERT INTO Cadastro_Clientes(Nome,CPF,RG,Endereco,Telefone)VALUES('Kezio Pereiro','625.415.789-42','1254638','Avenida 7 de abril, 76','99983564127');
INSERT INTO Cadastro_Clientes(Nome,CPF,RG,Endereco,Telefone)VALUES('Eduardo Luca','452.987.196-32','1574256','Rua das Abroelas, 61','6394521578');
INSERT INTO Cadastro_Clientes(Nome,CPF,RG,Endereco,Telefone)VALUES('Lucas Silva Barbosa','265.415.778-93','5621497','Rua 5, Casa 8','63951247895');
INSERT INTO Cadastro_Clientes(Nome,CPF,RG,Endereco,Telefone)VALUES('André Vitor','945.215.785-43','5124879','Avenida 1 de Janeiro, 64','48991245638');
INSERT INTO Cadastro_Clientes(Nome,CPF,RG,Endereco,Telefone)VALUES('Eduarda Vitoria','652.149.854-94','1264785','Avenida 7 de setembro,','16985264781');

INSERT INTO Produtos(Descricao,Preco,Quantidade,Quantidade_minima,Quantidade_maxima)VALUES('Arroz Branco Panela 1KG',5.63,600,50,900);
INSERT INTO Produtos(Descricao,Preco,Quantidade,Quantidade_minima,Quantidade_maxima)VALUES('Feijão Vermelho Kicaldo 1KG',7.60,300,80,600);
INSERT INTO Produtos(Descricao,Preco,Quantidade,Quantidade_minima,Quantidade_maxima)VALUES('Aveia Flocos Kaquer 400G',4.30,60,50,300);
INSERT INTO Produtos(Descricao,Preco,Quantidade,Quantidade_minima,Quantidade_maxima)VALUES('Macarrão Instantanho Sandela 80G',0.99,500,90,1200);
INSERT INTO Produtos(Descricao,Preco,Quantidade,Quantidade_minima,Quantidade_maxima)VALUES('Farinha de Trigo Primor 1KG',3.96,105,50,500);
INSERT INTO Produtos(Descricao,Preco,Quantidade,Quantidade_minima,Quantidade_maxima)VALUES('Papel Higiênico Koala 12 rolos',6.59,130,60,350);
INSERT INTO Produtos(Descricao,Preco,Quantidade,Quantidade_minima,Quantidade_maxima)VALUES('Óleo Girassol Oregan 1L',11.60,400,100,900);
INSERT INTO Produtos(Descricao,Preco,Quantidade,Quantidade_minima,Quantidade_maxima)VALUES('Sal Bom de Mesa 1KG',2.20,120,50,310);
INSERT INTO Produtos(Descricao,Preco,Quantidade,Quantidade_minima,Quantidade_maxima)VALUES('Couve 30G',2.99,60,50,100);
INSERT INTO Produtos(Descricao,Preco,Quantidade,Quantidade_minima,Quantidade_maxima)VALUES('Pão de Forma Bauduco',5.99,130,50,250);

INSERT INTO Tabela_Vendas(Total_vendas,DData,Hora,Cod_Vendedor,Cod_Cliente)VALUES(119.28,CURDATE(),CURTIME(),1,3);
INSERT INTO Tabela_Vendas(Total_vendas,DData,Hora,Cod_Vendedor,Cod_Cliente)VALUES(56.90,CURDATE(),CURTIME(),1,2);
INSERT INTO Tabela_Vendas(Total_vendas,DData,Hora,Cod_Vendedor,Cod_Cliente)VALUES(62.35,CURDATE(),CURTIME(),2,5);
INSERT INTO Tabela_Vendas(Total_vendas,DData,Hora,Cod_Vendedor,Cod_Cliente)VALUES(930.10,CURDATE(),CURTIME(),2,1);
INSERT INTO Tabela_Vendas(Total_vendas,DData,Hora,Cod_Vendedor,Cod_Cliente)VALUES(19.30,CURDATE(),CURTIME(),2,1);
INSERT INTO Tabela_Vendas(Total_vendas,DData,Hora,Cod_Vendedor,Cod_Cliente)VALUES(75.91,CURDATE(),CURTIME(),2,2);
INSERT INTO Tabela_Vendas(Total_vendas,DData,Hora,Cod_Vendedor,Cod_Cliente)VALUES(19.52,CURDATE(),CURTIME(),1,4);
INSERT INTO Tabela_Vendas(Total_vendas,DData,Hora,Cod_Vendedor,Cod_Cliente)VALUES(15.34,CURDATE(),CURTIME(),2,1);
INSERT INTO Tabela_Vendas(Total_vendas,DData,Hora,Cod_Vendedor,Cod_Cliente)VALUES(158.36,CURDATE(),CURTIME(),1,1);
INSERT INTO Tabela_Vendas(Total_vendas,DData,Hora,Cod_Vendedor,Cod_Cliente)VALUES(523.60,CURDATE(),CURTIME(),1,5);
INSERT INTO Tabela_Vendas(Total_vendas,DData,Hora,Cod_Vendedor,Cod_Cliente)VALUES(647.90,CURDATE(),CURTIME(),1,2);
INSERT INTO Tabela_Vendas(Total_vendas,DData,Hora,Cod_Vendedor,Cod_Cliente)VALUES(354.95,CURDATE(),CURTIME(),2,3);
INSERT INTO Tabela_Vendas(Total_vendas,DData,Hora,Cod_Vendedor,Cod_Cliente)VALUES(135.90,CURDATE(),CURTIME(),2,5);
INSERT INTO Tabela_Vendas(Total_vendas,DData,Hora,Cod_Vendedor,Cod_Cliente)VALUES(91.60,CURDATE(),CURTIME(),1,4);
INSERT INTO Tabela_Vendas(Total_vendas,DData,Hora,Cod_Vendedor,Cod_Cliente)VALUES(47.61,CURDATE(),CURTIME(),2,3);
INSERT INTO Tabela_Vendas(Total_vendas,DData,Hora,Cod_Vendedor,Cod_Cliente)VALUES(852.64,CURDATE(),CURTIME(),1,4);
INSERT INTO Tabela_Vendas(Total_vendas,DData,Hora,Cod_Vendedor,Cod_Cliente)VALUES(723.60,CURDATE(),CURTIME(),2,2);
INSERT INTO Tabela_Vendas(Total_vendas,DData,Hora,Cod_Vendedor,Cod_Cliente)VALUES(390.15,CURDATE(),CURTIME(),1,5);
INSERT INTO Tabela_Vendas(Total_vendas,DData,Hora,Cod_Vendedor,Cod_Cliente)VALUES(600.42,CURDATE(),CURTIME(),2,4);
INSERT INTO Tabela_Vendas(Total_vendas,DData,Hora,Cod_Vendedor,Cod_Cliente)VALUES(71.94,CURDATE(),CURTIME(),1,3);

SELECT * FROM Cadastro_Clientes;
SELECT * FROM Cadastro_Vendedores;
SELECT * FROM Produtos;
SELECT * FROM Tabela_Vendas;
