CREATE DATABASE Concessionaria;
# DROP DATABASE Concessionaria;
USE Concessionaria;

CREATE TABLE Veiculo(
ID_Veiculo INT PRIMARY KEY AUTO_INCREMENT,
Marca VARCHAR(50),
Modelo VARCHAR(50),
Descricao VARCHAR(50),
Cor VARCHAR (40),
Placa VARCHAR(30)
);

CREATE TABLE Cliente(
ID_Cliente INT PRIMARY KEY AUTO_INCREMENT,
Nome VARCHAR(50),
Endereco VARCHAR(50),
CPF VARCHAR(14)
);

CREATE TABLE Contrato(
ID_Contrato INT PRIMARY KEY AUTO_INCREMENT,
Ddata DATE,
Preco_diario DECIMAL(10,2),
Cod_Veiculo INT,
Cod_Cliente INT,
Valor_seguro DECIMAL(10,2),
FOREIGN KEY (Cod_Veiculo) REFERENCES Veiculo(ID_Veiculo),
FOREIGN KEY (Cod_Cliente) REFERENCES Cliente(ID_Cliente)
);

CREATE TABLE Manutencao(
ID_Manutecao INT PRIMARY KEY AUTO_INCREMENT,
Descricao VARCHAR(60),
Cod_Veiculo INT,
Valor DECIMAL(10,2),
FOREIGN KEY (Cod_Veiculo) REFERENCES Veiculo(ID_Veiculo)
);

INSERT INTO Cliente(Nome,Endereco,CPF)VALUES('Rita Lima','Rua das Palmeiras, 67','254.126.547-89'),
											('Fernando Sousa','Rua João Lisboa, 938','458.694.214-10'),
                                            ('Gabriella Farias','Avenida João de Sousa, S/N','526.312.745-82'),
                                            ('Talita Gonçalves','','154.625.386-74'),
                                            ('Valdemar Gyster','Rua Profesor Amalrilho Costa, 678',''),
                                            ('Paulo Vieira','Avenida Costa Neto','129.381.154-11');

UPDATE Cliente SET Endereco = NULL WHERE ID_Cliente=4;
UPDATE Cliente SET CPF = NULL WHERE ID_Cliente=2;
UPDATE Cliente SET CPF = NULL WHERE ID_Cliente=5;
UPDATE Cliente SET Nome = 'Alexandre Vieira' WHERE ID_Cliente = 6;

INSERT INTO Veiculo(Marca,Modelo,Descricao,Cor,Placa)VALUES('Mitsubishi','Mit78','Caminhonete de 4 portas, 1,700kg','Cinza','GHQ4873'),
														   ('Fiat','Toro','Caminhonete de 4 portas, 1,600kg','Azul','FGR4744'),
                                                           ('Fiat','Stratada 1.6','Caminhonete, 1.500kg','Vermelho',NULL),
														   ('Volkswagen','Polo','Carro familia, 4 portas, 1.000kg','Prata','RTS3875'),
                                                           ('Volkswagen','Jetta','Carro familia, 1.000kg','Branco','WRD4888'),
                                                           ('Chevrolet','Onix','Carro 2 portas, compacto, 950kg','Azul','ED5T963'),
                                                           ('Volkswagen','Gol','Carro familia, 4 portas,900kg','Amarelo','TTK7873'),
                                                           ('Chevrolet','Cruze Plus','Carro compacto, 4 portas, 960kg','Azul','QLD8517'),
                                                           ('Honda','Forza 350',NULL,'Marrom','RG5T614'),
                                                           ('Honda','Bros 160',NULL,'Vermelha','RGB3164');


# UPDATE Veiculo SET Placa = NULL WHERE ID_Veiculo = 3;

INSERT INTO Contrato(Ddata,Preco_diario,Cod_Veiculo,Cod_Cliente,Valor_seguro)VALUES(CURDATE(),180.00,3,2,100.00),
																				   (CURDATE(),120.00,7,1,90.00),
                                                                                   (CURDATE(),80.00,9,1,100.00),
                                                                                   (CURDATE(),130.00,8,5,100.00),
                                                                                   (CURDATE(),220.00,1,3,120.00),
                                                                                   (CURDATE(),120.00,10,4,90.00),
                                                                                   (CURDATE(),120.00,5,5,100.00),
                                                                                   (CURDATE(),200.00,2,6,150.00),
																				   (CURDATE(),110.00,4,2,95.00),
																				   (CURDATE(),115.30,6,6,92.30);
                                                                                   
INSERT INTO Manutencao(Descricao,Cod_Veiculo,Valor)VALUES('Troca de óleo',4,100.00),
														 ('Troca de óleo e pecas internas danificadas',1,280.00),
                                                         ('Manutenção no carburador',7,300.00),
                                                         ('Troca da bateria e revisão geral',10,290.00),
                                                         ('Manutençao no freio',6,170.00),
                                                         ('Revisão geral',3,230.00),
                                                         ('Manutençao no freio',2,250.00),
                                                         ('Ajuste de embreagem',9,130.00),
                                                         ('Limpeza do motor',5,500.00);
                                                         
# UPDATE Manutencao SET Descricao = 'Manutenção no carburador',Valor = 300.00 WHERE ID_Manutecao = 3;

SELECT * FROM Cliente;
SELECT * FROM Contrato;
SELECT * FROM Veiculo;
SELECT * FROM Manutencao;

# IS NULL
SELECT ID_Cliente,Nome FROM Cliente WHERE CPF IS NULL; 
SELECT ID_Veiculo,Marca,Modelo,Cor,Placa FROM Veiculo WHERE Placa IS NULL;

# LIKE
SELECT ID_Cliente,Nome FROM Cliente WHERE Nome LIKE'%A';
SELECT ID_Cliente,Nome FROM Cliente WHERE Nome LIKE'V%';
SELECT * FROM Veiculo WHERE Placa LIKE'R%';
SELECT * FROM Veiculo WHERE Placa LIKE'%G%';

#IN
SELECT * FROM Manutencao WHERE ID_Manutecao IN(2,5,6,11,13);
SELECT * FROM Contrato WHERE ID_Contrato IN(1,6,3,5,7); 
SELECT ID_Cliente,Nome FROM Cliente WHERE ID_Cliente IN(1,4,5);

# BETWEEN
SELECT * FROM Manutencao WHERE Valor BETWEEN 200 AND 300;
SELECT * FROM Cliente WHERE Nome BETWEEN 'A' AND 'L';
SELECT ID_Contrato,Cod_Veiculo,Cod_Cliente FROM Contrato WHERE ID_Contrato BETWEEN 2 AND 6;

#AVG
SELECT AVG(Valor) AS 'Media de valores' FROM Manutencao;
SELECT AVG(Valor_seguro) AS 'Media de valores sob `Seguro`' FROM Contrato;

# COUNT
SELECT COUNT(ID_Cliente) AS 'Quantidade de usuários'FROM Cliente;
SELECT COUNT(Marca) AS 'Quantidade de carros de certa marca' FROM Veiculo WHERE Marca = 'Volkswagen';
SELECT COUNT(Cod_Cliente) AS 'Numero de cotratos por cliente' FROM Contrato WHERE Cod_Cliente = 3;

# MAX
SELECT MAX(Valor) AS 'Valor maior em `Manutenção` de veiculos' FROM Manutencao;
SELECT MAX(Preco_diario) AS 'Maior valor `diário` de um carro' FROM Contrato;

#MIN
SELECT MIN(Nome) AS 'Nome com `menor` letra' FROM Cliente;
SELECT MIN(Valor_seguro) AS 'Menor valor do seguro'  FROM Contrato;

#SUM
SELECT SUM(Valor) AS 'Total arrecadado em manutenções de veículo' FROM Manutencao;
SELECT SUM(Preco_diario) AS 'Valor total de emprestimos diario de veículos' FROM Contrato;
