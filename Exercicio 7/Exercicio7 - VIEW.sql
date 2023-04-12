create database Biblioteca;
 use Biblioteca;

create table assuntos 
(
codigoassuntos int auto_increment primary key,
nome varchar (45)
);

create table livros
(
codigolivros int auto_increment primary key,
titulo varchar (60),
autor varchar (60),
datalancamento date,
copias int,
codigoassuntos int,
foreign key (codigoassuntos) references assuntos (codigoassuntos)
);

create table alunos
(
codigoalunos int auto_increment primary key,
nome varchar (40),
email varchar (50),
fone varchar (80)
);

create table emprestimos
(
codigoemprestimos int auto_increment primary key,
dataemprestimo date,
dataprevia date,
datadevolucao date, 
multa decimal(10.2),
codigoalunos int,
codigolivros int,
foreign key (codigoalunos) references alunos (codigoalunos),
foreign key (codigolivros) references livros (codigolivros)
);

-- Tabela de alunos



insert into alunos values (1,'Andreina Martins Araujo Costa','Andreina@gmail.com','92089191');
insert into alunos values (2,'Augusto Batista de Jesus','Augusto@gmail.com','92436577');
insert into alunos values (3,'Bruna Emanuely Sousa Ribeiro','Bruna@gmail.com','92087734');
insert into alunos values (4,'Bruno Vieira Lima Pinheiro','Bruno@gmail.com','92436574');
insert into alunos values (5,'Dennyson Rodrigues Silva','Dennyson@gmail','92436574');
insert into alunos values (6,'Edivaldo Junior Coelho Silva','Edivaldo@gmail.com','87344555');
insert into alunos values (7,'Ewerthon Matheus Muniz Da Silva','Ewerthon@gmail.com','9823444');
insert into alunos values (8,'Frederico Barreto Frazão','Frederico@gmail.com','56775333');
insert into alunos values (9,'Gabryela Borges Morais','Gabryela@gmail.com','56666444');
insert into alunos values (10,'Guibson Arcebispo Lima Oliveira','Guibson@gmail.com','2233333');
insert into alunos values (11,'Gustavo Cunha Da Silva','Gustavo@gmail.com','456667774');
insert into alunos values (12,'Hithallo Lima Trindade','Hithallo@gmail.com','937474444');
insert into alunos values (13,'Jadson Antonio Santos Medeiros','Jadson@gmail.com','84122125');
insert into alunos values (15,'Jeovana Bandeira De Miranda','Jeovana@gmail.com ','92437497');
insert into alunos values (16,'Airton Eckert Flho','Airton@gmail.com','918233209');


-- tabela de assuntos 


insert into assuntos values (1,'Policial');
insert into assuntos values (2,'livros didáticos');
insert into assuntos values (3,'auto-ajuda');
insert into assuntos values (4,'Romance');
insert into assuntos values (5,'Aventura');
insert into assuntos values (6,'Filosofia ');
insert into assuntos values (7,'Poesia');
insert into assuntos values (8,'Biografias ');
insert into assuntos values (9,'suspense ');
insert into assuntos values (10,'Informática');

-- tabela de livros 

insert into livros values (1,'Redes de Computador','Pedro Silva','2012-05-22',14,10);
insert into livros values (2,'Banco de dados','Carlos Eduardo','2011-09-23',20,10);
insert into livros values (3,'Guerra e Paz','Liev Tolstói,','2015-07-10',11,2);
insert into livros values (4,'A Montanha Mágica','Thomas Mann','2014-08-08',8,1);
insert into livros values (5,'Ulisses','James Joyce','2013-09-07',30,5);
insert into livros values (6,'Cem Anos de Solidão','Gabriel García Márquez','2013-11-05',14,7);
insert into livros values (7,'A Divina Comédia','Dante Alighieri','2010-02-02',22,4);
insert into livros values (8,'Em Busca do Tempo Perdido','Marcel Proust','2016-08-04',28,8);
insert into livros values (9,'O Som e a Fúria','William Faulkner,','2016-03-15',27,2);

 -- tabela emprestimos;
insert into emprestimos values (1,'2016-08-08','2016-08-17','2016-08-21',3,2,2);
insert into emprestimos values (2,'2016-07-10','2016-08-01','2016-08-10',5,3,1);
insert into emprestimos values (3,'2012-08-22','2012-09-02','2012-09-09',7,4,3);
insert into emprestimos values (4,'2011-05-10','2011-05-08','2011-05-12',5,5,4);
insert into emprestimos values (5,'2012-04-29','2012-05-03','2012-05-10',8,6,5);
insert into emprestimos values (6,'2015-03-03','2015-04-10','2015-04-11',10,7,6);
insert into emprestimos values (7,'2013-02-05','2013-02-15','2013-02-20',11,8,7);
insert into emprestimos values (8,'2012-01-06','2012-01-16','2012-01-20',2,1,9);

-- Faça as seguintes views SQL:

-- 1. Crie uma views a qual lista o título, autor e data de lançamento dos livros em ordem de título.
	
    CREATE VIEW Dados_de_Livros AS	
        SELECT l.titulo, l.autor ,l.datalancamento FROM livros l
		ORDER BY titulo;
        SELECT * FROM Dados_de_Livros;

-- 2. Crie uma views a qual lista os livros lançados em 2011 ou 2012.
	
    CREATE VIEW Livros_lancados_entre_2011_2012 AS
		SELECT l.titulo FROM livros l
		WHERE YEAR(datalancamento) BETWEEN 2011 AND 2012;
        SELECT * FROM Livros_lancados_entre_2011_2012;

-- 3. Crie uma views a qual lista os livros que o título contenha a palavra "Redes".
	
    CREATE VIEW Livros_com_palavra_redes AS
		SELECT titulo FROM livros
		WHERE titulo LIKE '%Redes%';
		SELECT * FROM Livros_com_palavra_redes;

-- 4. Crie uma views a qual lista o título, nome do assunto e nº cópias dos livros.
	
    CREATE VIEW Livros_Assuntos AS
		SELECT l.titulo,a.nome AS Assunto,l.copias FROM livros l
		INNER JOIN assuntos a ON l.codigoassuntos = a.codigoassuntos;
        SELECT * FROM Livros_Assuntos;

-- 5 Crie uma views a qual lista o título e autor dos livros que o nome do assunto seja " Banco de dados".
	
    CREATE VIEW Livros_com_assunto_de_Informatica AS
		SELECT l.titulo,l.autor FROM livros l
        INNER JOIN assuntos a ON l.codigoassuntos = a.codigoassuntos
        WHERE a.nome LIKE 'Informática';
		SELECT * FROM Livros_com_assunto_de_Informatica;

-- 6. Crie uma views a qual lista o nome do assunto e nº de livros, agrupados por nome do assunto.
	
    CREATE VIEW Contagem_de_copias_por_cada_assunto AS
		SELECT a.nome,SUM(l.copias) FROM assuntos a
		INNER JOIN livros l ON a.codigoassuntos = l.codigoassuntos
		GROUP BY a.nome;
		SELECT * FROM Contagem_de_copias_por_cada_assunto;
        
-- 7. Crie uma views a qual somar os valores das multas dos empréstimos dos livros retirados em 2013.
	
    CREATE VIEW Valores_de_multas AS	
        SELECT SUM(multa) AS 'Numero de Multas' FROM emprestimos
		WHERE YEAR(dataemprestimo) = 2013;
        SELECT * FROM Valores_de_multas;

select * from alunos;
select * from emprestimos;
select * from assuntos;
select * from livros;