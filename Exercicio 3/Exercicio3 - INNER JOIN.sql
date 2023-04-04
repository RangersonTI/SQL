CREATE DATABASE Exercicio_01;
USE Exercicio_01;

CREATE TABLE departamento (
  id integer PRIMARY KEY,-- id do departamento
  nome varchar (50) NOT NULL UNIQUE-- nome do departamento
  );

CREATE TABLE empregado (
  id integer PRIMARY KEY,-- id do empregado
  nome varchar (50) NOT NULL,-- nome do empregado
  salario DECIMAL (6,2),-- salário do empregado
  id_sup integer,
  foreign key (id_sup) references departamento (id) --  id do departamento onde este empregado trabalha

 );
 
CREATE TABLE projecto (
  id integer PRIMARY KEY,-- id do projecto
  nome varchar (50) NOT NULL UNIQUE, -- nome do projecto
 id_dep integer,
  foreign key (id_dep) REFERENCES departamento (id)-- id do departamento que controla o projecto
);
 
CREATE TABLE trabalha (
id_emp integer,
id_pro integer,
foreign key  (id_emp) REFERENCES empregado (id),-- id do empregado
 foreign key (id_pro) REFERENCES projecto (id),-- id do projecto
  horas integer NOT NULL,-- número de horas que o empregado trabalha no projecto por semana
  PRIMARY KEY (id_emp, id_pro)
);
-- Depertamento
INSERT INTO departamento VALUES (1, 'Logí­stica');
INSERT INTO departamento VALUES (2, 'Transportes');
INSERT INTO departamento VALUES (3, 'Limpeza');
INSERT INTO departamento VALUES (4, 'Recursos Humanos');
INSERT INTO departamento VALUES (5, 'Informática');
INSERT INTO departamento VALUES (6, 'Financeiro');
INSERT INTO departamento VALUES (7, 'Jurídico');
INSERT INTO departamento VALUES (8, 'Marketing');
INSERT INTO departamento VALUES (9, 'Compras');
INSERT INTO departamento VALUES (10, 'Vendas');
INSERT INTO departamento VALUES (11, 'Administrativo ');

 -- Empregado
INSERT INTO empregado VALUES (1, 'João'      , 1500, 1);
INSERT INTO empregado VALUES (2, 'Miguel'    , 1200, 1);
INSERT INTO empregado VALUES (3, 'João'      , 1300, 1);
INSERT INTO empregado VALUES (4, 'Teresa'    , 1500, 2);
INSERT INTO empregado VALUES (5, 'Carlos'    , 1100, 2);
INSERT INTO empregado VALUES (6, 'Maria'     , 1000, 2);
INSERT INTO empregado VALUES (7, 'Filipa'    ,  800, 2);
INSERT INTO empregado VALUES (8, 'André'     , 1700, 3);
INSERT INTO empregado VALUES (9, 'Tiago'     , 1200, 3);
INSERT INTO empregado VALUES (10, 'Vasco'    , 1300, 3);
INSERT INTO empregado VALUES (11, 'Sérgio'   , 1100, 3);
INSERT INTO empregado VALUES (12, 'Joaquim'  , 1900, 3);
INSERT INTO empregado VALUES (13, 'Diana'    , 1200, 4);
INSERT INTO empregado VALUES (14, 'Manuel'   , 1600, 4);
INSERT INTO empregado VALUES (15, 'Mariana'  , 1200, 5);
INSERT INTO empregado VALUES (16, 'Marco'    , 1400, 5);
INSERT INTO empregado VALUES (17, 'Hélder'   , 1100, 5);
INSERT INTO empregado VALUES (18, 'Francisco', 1000, 5);
INSERT INTO empregado VALUES (19, 'Fátima'   ,  500, 5);
INSERT INTO empregado VALUES (20, 'Joana'    ,  500, 5);
INSERT INTO empregado VALUES (21, 'Adeline'    ,  2000, 6);
INSERT INTO empregado VALUES (22, 'Aglailton'    ,  2800, 6);
INSERT INTO empregado VALUES (23, 'Alddo Gabriel'    ,  2100, 7);
INSERT INTO empregado VALUES (24, 'Aurea'    ,  3000, 7);
INSERT INTO empregado VALUES (25, 'Carlos Eduardo'    ,  500, 8);
INSERT INTO empregado VALUES (26, 'Darllan'    ,  4500, 5);
INSERT INTO empregado VALUES (27, 'Davi'    ,  5100, 5);
INSERT INTO empregado VALUES (28, 'Gabriel Lacerda'    ,  6100, 8);
INSERT INTO empregado VALUES (29, 'Guilherme'    ,  8000, 9);
INSERT INTO empregado VALUES (30, 'João Lucas'    ,  790, 10);
INSERT INTO empregado VALUES (31, 'Karoliny'    ,  1560, 11);
INSERT INTO empregado VALUES (32, 'Leidiane'    ,  6789, 10);
INSERT INTO empregado VALUES (33, 'Livia'    ,  9871, 10);
INSERT INTO empregado VALUES (34, 'Maria Luiza'    ,  3567, 11);
INSERT INTO empregado VALUES (35, 'Michel Plathiny'    ,  8992, 7);

 -- Projecto
INSERT INTO projecto VALUES (1, 'XPTO', 1);
INSERT INTO projecto VALUES (2, 'YPTO', 2);
INSERT INTO projecto VALUES (3, 'ZPTO', 5);
INSERT INTO projecto VALUES (4, 'VVZZ', 10);
INSERT INTO projecto VALUES (5, 'SSPP', 8);
INSERT INTO projecto VALUES (6, 'LLMM', 7);
INSERT INTO projecto VALUES (7, 'PSDE', 7);
INSERT INTO projecto VALUES (8, 'SVFR', 9);
INSERT INTO projecto VALUES (9, 'WXZA', 5);

 -- Trabalha
INSERT INTO trabalha VALUES (1,  1, 4);
INSERT INTO trabalha VALUES (2,  1, 3);
INSERT INTO trabalha VALUES (5,  1, 4);
INSERT INTO trabalha VALUES (7,  1, 2);
INSERT INTO trabalha VALUES (10, 1, 1);
INSERT INTO trabalha VALUES (11, 1, 7);
INSERT INTO trabalha VALUES (13, 1, 3);
INSERT INTO trabalha VALUES (14, 1, 3);
INSERT INTO trabalha VALUES (20, 1, 6);
INSERT INTO trabalha VALUES (1,  2, 8);
INSERT INTO trabalha VALUES (2,  2, 7);
INSERT INTO trabalha VALUES (3,  2, 7);
INSERT INTO trabalha VALUES (4,  2, 2);
INSERT INTO trabalha VALUES (6,  2, 3);
INSERT INTO trabalha VALUES (11, 2, 2);
INSERT INTO trabalha VALUES (12, 2, 1);
INSERT INTO trabalha VALUES (14, 2, 3);
INSERT INTO trabalha VALUES (15, 2, 5);
INSERT INTO trabalha VALUES (17, 2, 4);
INSERT INTO trabalha VALUES (5,  3, 6);
INSERT INTO trabalha VALUES (12, 3, 3);
INSERT INTO trabalha VALUES (17, 3, 1);
INSERT INTO trabalha VALUES (18, 3, 2);
INSERT INTO trabalha VALUES (21, 4, 2);
INSERT INTO trabalha VALUES (22, 4, 2);
INSERT INTO trabalha VALUES (23, 5, 5);
INSERT INTO trabalha VALUES (25, 5, 6);
INSERT INTO trabalha VALUES (27, 6, 8);
INSERT INTO trabalha VALUES (28, 8, 11);
INSERT INTO trabalha VALUES (30, 8, 10);
 
select *from departamento;
select *from empregado;
select *from  projecto;
select *from  trabalha;

							-- Questões

-- 1)	Liste os empregados e os departamentos a que cada um pertence. (nome empregado, nome departamento

SELECT empregado.nome, departamento.nome FROM empregado INNER JOIN departamento
ON empregado.id = departamento.id;

-- 2)	Quais os projetos controlados pelo departamento de Informática. (nome projeto)

SELECT p.nome FROM departamento d 
INNER JOIN projecto p ON d.id = p.id_dep
WHERE d.nome = 'Informática';

-- 3)	Que empregados trabalham no projeto XPTO e quantas horas trabalha cada um nesse projeto (nome empregado, horas)

SELECT e.nome,t.horas FROM empregado e
INNER JOIN trabalha t ON e.id = t.id_emp
WHERE t.id_pro = 1;

-- 4)	Que empregados trabalham no projeto XPTO e quantas horas trabalha cada um nesse projeto (nome empregado, horas). Ordene a resposta pelo número de horas descendentemente.
SELECT e.nome AS 'Nome do empregado',t.horas AS 'Horas trabalhadas' FROM empregado e
INNER JOIN trabalha t ON e.id = t.id_emp
WHERE t.id_pro = 1
ORDER BY t.horas DESC;

-- 5)	Quantos empregados trabalham em cada projeto? (nome projeto, número de empregados)

SELECT p.nome, COUNT(id_emp) FROM projecto p
INNER JOIN trabalha t ON p.id = t.id_pro
GROUP BY p.nome;

-- 6)	Quantas horas são gastas semanalmente em cada projeto? (nome projeto, horas)

SELECT p.nome AS 'Nome do projeto',SUM(t.horas)*5 AS 'Horas semanais' FROM projecto p
INNER JOIN trabalha t ON p.id = t.id_pro
GROUP BY p.nome;

-- 7)	Quantas horas cada empregado gasta em projetos? (nome empregado, horas)
	
SELECT e.nome AS 'Nome do empregado',SUM(t.horas) AS 'Horas trabalhadas' FROM empregado e
INNER JOIN trabalha t ON  e.id = t.id_pro
GROUP BY e.nome;

-- 8)	Qual o salário máximo em cada departamento? (nome departamento, salário máximo)

SELECT d.nome AS 'Nome do departamento',MAX(e.salario) AS 'Maior salário' FROM departamento d
INNER JOIN empregado e ON d.id = e.id_sup
GROUP BY d.nome;

-- 9)	Qual a diferença entre o salário mais alto e o mais baixo da empresa? (diferença)
	
SELECT MAX(e.salario)-MIN(e.salario) AS 'Maior salário' FROM departamento d
INNER JOIN empregado e ON d.id = e.id_sup
GROUP BY d.nome;
    
-- 10)	Quais os departamentos em que o salário médio é superior a 1300 euros? (nome departamento)

SELECT d.nome,AVG(e.salario) AS 'Média dos salários' FROM departamento d
INNER JOIN empregado e ON d.id = e.id_sup
WHERE e.salario >1300
GROUP BY d.nome;

select *from departamento;
select *from  trabalha;
select *from empregado;
select *from  projecto;
