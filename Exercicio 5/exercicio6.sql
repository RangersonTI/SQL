CREATE DATABASE BBA_AEROPORTOS;
USE BBA_AEROPORTOS;

CREATE TABLE aeroportos (
  codaerop integer PRIMARY KEY,
  nome character varying(30),
  LOCAL character varying(30),
  pais character varying(30)
);
 
CREATE TABLE modelos (
        codmodelo integer PRIMARY KEY,
        construtor character varying(20),
        versao character varying(20),
        nummotores character varying(20)
);
 
CREATE TABLE avioes (
        codaviao integer PRIMARY KEY,
        nome character varying(30),
        codmodelo integer,
		foreign key (codmodelo) REFERENCES modelos (codmodelo)
);
  
CREATE TABLE voos (
        codvoo integer PRIMARY KEY,
        decodaerop integer,
		paracodaerop integer,
		transportadora character varying(10),
        duracao integer,
        codaviao integer,
		foreign key (decodaerop)  REFERENCES aeroportos (codaerop),
		foreign key (paracodaerop) REFERENCES aeroportos (codaerop),
		foreign key (codaviao)  REFERENCES avioes (codaviao)
);
 
INSERT INTO aeroportos  VALUES  (1,'Sa Carneiro','Porto','Portugal');
INSERT INTO aeroportos  VALUES  (3,'Portela','Lisboa','Portugal');
INSERT INTO aeroportos  VALUES  (5,'Faro','Faro','Portugal');
INSERT INTO aeroportos  VALUES  (2,'Madeira','Funchal','Portugal');
INSERT INTO aeroportos  VALUES  (4,'Ponta Delgada','S. Miguel','Portugal');
INSERT INTO aeroportos  VALUES  (9,'Orly','Paris','Franca');
INSERT INTO aeroportos  VALUES  (8,'Charles de Gaule','Paris','Franca');
INSERT INTO aeroportos  VALUES  (11,'Heathrow','Londres','Reino Unido');
INSERT INTO aeroportos  VALUES  (12,'Gatwick','Londres','Reino Unido');

INSERT INTO modelos  VALUES  (1,'Douglas','DC-10','3');
INSERT INTO modelos  VALUES  (2,'Boing','737','2');
INSERT INTO modelos  VALUES  (3,'Boing','747','4');
INSERT INTO modelos  VALUES  (4,'Airbus','A300','2');
INSERT INTO modelos  VALUES  (5,'Airbus','A340','4');

INSERT INTO avioes  VALUES  (1,'Scott Adams',1);
INSERT INTO avioes  VALUES  (2,'Milo Manara',1);
INSERT INTO avioes  VALUES  (4,'Henki Bilal',3);
INSERT INTO avioes  VALUES  (5,'Gary Larson',4);
INSERT INTO avioes  VALUES  (6,'Bill Waterson',4);
INSERT INTO avioes  VALUES  (7,'J R R Tolkien',3);
INSERT INTO avioes  VALUES  (8,'Franquin',3);
INSERT INTO avioes  VALUES  (9,'Douglas Adams',1);
INSERT INTO avioes  VALUES  (3,'Serpieri',5);

INSERT INTO voos VALUES  (1001,1,2,'TAP',2,1);
INSERT INTO voos VALUES  (1002,2,3,'TAP',1,2);
INSERT INTO voos VALUES  (1010,12,4,'BA',3,3);
INSERT INTO voos VALUES  (1008,3,12,'Portugalia',3,4);
INSERT INTO voos VALUES  (1007,5,1,'TAP',1,5);
INSERT INTO voos VALUES  (1009,1,3,'Portugalia',1,2);
INSERT INTO voos VALUES  (1005,9,2,'AirFrance',2,3);
INSERT INTO voos VALUES  (1003,2,12,'BA',2,5);
INSERT INTO voos VALUES  (1006,8,11,'BA',1,5);
INSERT INTO voos VALUES  (1004,4,3,'SATA',3,6);
INSERT INTO voos VALUES  (1111,1,3,'TAP',2,3);

-- select *from aeroportos; 
-- select *from modelos ;
 -- select *from avioes;
-- select *from voos;


-- 1.	Liste o local e o nome de todos os aeroportos de Portugal (local, nome).

SELECT a.nome,a.LOCAL FROM aeroportos a
WHERE a.pais = 'Portugal';

-- 2.	Liste os nomes de todos os aviões da versão DC-10 (nome).

SELECT v.nome FROM avioes v
INNER JOIN modelos m ON v.codmodelo = m.codmodelo
WHERE m.versao = 'DC-10';

-- 3.	Liste para cada avião, a quantidade de motores necessários (nome_avião, num_motores).

SELECT v.nome, m.nummotores FROM avioes v
INNER JOIN modelos m ON v.codmodelo = m.codmodelo;

 -- 4.	Quantos voos com a duração de 2 ou 3 horas há no sistema (contagem) ?

SELECT COUNT(duracao) AS 'Quantidade de voos de 2 e 3 horas de duracao' FROM voos
WHERE duracao = 2 or duracao = 3;
  
 -- 5.	Liste todos os modelos de avião da série A3xx , isto é, em que a versão começa pelo texto A3 (versão).

SELECT v.nome AS 'Nome do avião', m.versao AS 'Modelo do avião' FROM avioes v
INNER JOIN modelos m ON v.codmodelo = m.codmodelo
WHERE m.versao LIKE '%A3%';

-- 	6.	Liste os códigos de todos os voos ordenados por duração, voos mais compridos primeiro; para o caso de voos de igual duração, ordene crescentemente pelo código do vôo (codvoo, duração).
SELECT v.codvoo, v.duracao FROM voos v
ORDER BY v.duracao DESC;

-- 7.	Tendo em conta que não existe nenhum voo direto do aeroporto de código 1 (Porto) para o aeroporto de código 12 (Londres), liste todos as escalas possíveis 
-- (cód_voo1,cód_voo2, código_aeroporto_da_escala). Sugestão: Utilize os códigos dos aeroportos (1 e 12) na pesquisa.

SELECT v0.codvoo AS 'Codigo de voo 1',v1.codvoo AS 'Codigo de voo 2',v0.paracodaerop AS 'Coidgo de aeroporto de escala'
FROM voos v0
INNER JOIN voos v1 ON v0.paracodaerop = v1.decodaerop
WHERE v0.decodaerop = 1 AND v1.paracodaerop = 12;

-- 8.	Quantos aeroportos há por país ordene a resposta por ordem decrescente (país, contagem)?

SELECT a.pais, COUNT(a.pais) AS 'Numero de aeroportos' FROM aeroportos a
GROUP BY a.pais;

 -- 9.	Liste ordenadamente todos os voos, respectivo local de origem e local de destino, ordenando pelo código de voo crescente (codvoo, de_local, para_local). Apresente as colunas como Código do Voo , Origem e Destino.

SELECT v.codvoo AS 'Código do Voo',v.decodaerop AS 'Origem',v.paracodaerop AS 'Destino' FROM voos v
ORDER BY v.codvoo;

-- 10.	Liste os códigos dos voos de Porto para Lisboa (codvoo) ? Atenção: A pesquisa não se pode basear nos atuais códigos de aeroportos, ie. deve funcionar mesmo se os códigos de aeroportos mudarem.

SET @Inicio = 'Porto';
SET @Final = 'Lisboa';

SELECT v.codvoo AS 'Código de voo' FROM voos v
WHERE v.decodaerop = (SELECT codaerop FROM aeroportos WHERE LOCAL=@Inicio) 
&& v.paracodaerop = (SELECT codaerop FROM aeroportos WHERE LOCAL=@Final);

-- 11.	Conte o número de aeroportos por país (país, contagem); mostre apenas os países com mais de 2 aeroportos.

SELECT a.pais AS 'Pais', COUNT(*) AS 'Contagem' FROM aeroportos a
GROUP BY a.pais
HAVING COUNT(*)  > 2;

 -- 12.	Qual o país, ou países, com mais aeroportos e com quantos aeroportos ? (país, contagem)

SELECT pais AS 'País', COUNT(pais) AS 'País(ises) com mais aeroporto' FROM aeroportos
GROUP BY pais
HAVING MAX(COUNT(pais));

 -- 13.	Liste para cada voo, qual o nome do aeroporto de partida e de chegada (cod_voo, nome_aerop_part, nome_aerop_cheg); ordene a resposta alfabeticamente pelo nome do aeroporto de partida e depois pelo nome do aeroporto de chegada.

SELECT v.codvoo, a0.nome, a1.nome FROM voos v
INNER JOIN aeroportos a0 ON v.decodaerop = a0.codaerop
INNER JOIN aeroportos a1 ON v.paracodaerop = a1.codaerop
ORDER BY v.codvoo;
-- ORDER BY a0.nome;
-- ORDER BY a1.nome;

-- 14.	Liste para cada modelo, quantos aviões realmente existem. Ordene a listagem tal forma que os modelos mais frequentes apareçam em último lugar (construtor, versão, contagem). Omita da listagem aviões com contagem nula.

SELECT m.construtor, m.versao, COUNT(a.codmodelo) AS 'Contagem' FROM modelos m
INNER JOIN avioes a ON m.codmodelo = a.codmodelo
GROUP BY m.construtor,m.versao
HAVING COUNT(a.codmodelo) > 0
ORDER BY 'Contagem' ASC, m.construtor ASC, m.versao ASC;

-- 15.	Liste para cada modelo, quantos aviões realmente existem. Ordene a listagem tal forma que os modelos mais frequentes apareçam em último lugar (construtor, versão, contagem). Inclua na listagem aviões com contagem nula.

SELECT m.construtor, m.versao, COUNT(a.codmodelo) AS 'Contagem' FROM modelos m
INNER JOIN avioes a ON m.codmodelo = a.codmodelo
GROUP BY m.construtor,m.versao
HAVING COUNT(a.codmodelo) >= 0
ORDER BY 'Contagem' ASC, m.construtor ASC, m.versao ASC;

select *from avioes;
select *from modelos;
select *from voos;
select *from aeroportos;