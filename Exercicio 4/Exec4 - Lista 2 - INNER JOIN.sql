CREATE DATABASE Exercicio_05;
USE Exercicio_05;

CREATE TABLE professor(
prof_numero INT NOT NULL,
prof_nome VARCHAR(30),
prof_rua VARCHAR(30),
prof_cidade VARCHAR(30),
PRIMARY KEY(prof_numero)
);

CREATE TABLE aluno(
aluno_numero INT NOT NULL,
aluno_nome VARCHAR(30),
aluno_rua VARCHAR(30),
aluno_cidade VARCHAR(30),
PRIMARY KEY (aluno_numero)
);

CREATE TABLE disciplina(
disc_codigo INT NOT NULL,
disc_nome VARCHAR(30),
curso_nome VARCHAR(30),
qtd_aulas integer,
PRIMARY KEY (disc_codigo)
);

CREATE TABLE matricula(
aluno_numero INT NOT NULL,
disc_codigo INT NOT NULL,
ano VARCHAR(4) NOT NULL,
PRIMARY KEY (aluno_numero, disc_codigo, ano),
FOREIGN KEY (aluno_numero) REFERENCES aluno (aluno_numero),
FOREIGN KEY (disc_codigo) REFERENCES disciplina (disc_codigo)
);

CREATE TABLE professor_disciplina(
disc_codigo integer NOT NULL,
prof_numero integer NOT NULL,
ano VARCHAR(4),
PRIMARY KEY (disc_codigo, prof_numero, ano),
FOREIGN KEY (disc_codigo) REFERENCES disciplina (disc_codigo),
FOREIGN KEY (prof_numero) REFERENCES professor (prof_numero)
);

/*Passo 02 – Insira para cada tabela os registros*/

INSERT INTO aluno VALUES (1, ' Tiago Mateus Junior', '210', 'Palmas');
INSERT INTO aluno VALUES (2, 'Luciana Gomes', '202', 'Palmas');
INSERT INTO aluno VALUES (3, 'João Mateus', '2300', 'Gurupi');
INSERT INTO aluno VALUES (4, 'José Silva', '1024', 'Paraíso');
INSERT INTO aluno VALUES (5, 'Juraci', '106', 'Miranorte');
INSERT INTO aluno VALUES (6, 'Paulo', '101', 'Goianorte');
INSERT INTO aluno VALUES (7, 'Adriana Calcanhoto', 'rua Alvorada', 'Paraíso');
INSERT INTO aluno VALUES (8, 'Rosane', 'rua das flores', 'Guaraí');
INSERT INTO aluno VALUES (9, 'Mara', 'rua das águas', 'Porto Nacional');
INSERT INTO aluno VALUES (10, 'Julia', 'rua de madeira', 'Paraíso');
INSERT INTO aluno VALUES (11, 'Julia', 'rua de madeira', 'Palmas');

INSERT INTO professor VALUES (1, 'João José', '103', 'Palmas');
INSERT INTO professor VALUES (2, 'Maria José', '201', 'Palmas');
INSERT INTO professor VALUES (3, 'Bruno', '305', 'Paraiso');
INSERT INTO professor VALUES (4, 'José Ricardo', '1106', 'Porto Nacional');
INSERT INTO professor VALUES (5, 'Manuela', '120', 'Araguaína');
INSERT INTO professor VALUES (6, 'Bruno', '1003', 'Porto Nacional');
INSERT INTO professor VALUES (7, 'Luciana', ' 100', 'Miracema');
INSERT INTO professor VALUES (8, 'Paulo', ' 150', 'Palmas');
INSERT INTO professor VALUES (9, 'Lual', '1006', 'Paraíso');
INSERT INTO professor VALUES (10, 'Antonio Marcos', '170', 'Araguaína');


INSERT INTO disciplina (disc_codigo, disc_nome, curso_nome, qtd_aulas) VALUES (1, ' Química', 'Ensino Médio', 4);
INSERT INTO disciplina (disc_codigo, disc_nome, curso_nome, qtd_aulas) VALUES (2, ' Biologia', 'Ensino Médio', 4);
INSERT INTO disciplina (disc_codigo, disc_nome, curso_nome, qtd_aulas) VALUES (3, 'História', 'Ensino Médio', 2);
INSERT INTO disciplina (disc_codigo, disc_nome, curso_nome, qtd_aulas) VALUES (4, ' Religião', 'Ensino Médio', 2);
INSERT INTO disciplina (disc_codigo, disc_nome, curso_nome, qtd_aulas) VALUES (5, ' Português', 'Ensino Pós Médio', 4);
INSERT INTO disciplina (disc_codigo, disc_nome, curso_nome, qtd_aulas) VALUES (6, 'Física', 'Ensino Pós Médio', 6);
INSERT INTO disciplina (disc_codigo, disc_nome, curso_nome, qtd_aulas) VALUES (7, 'Matemática', 'Ensino Pós Médio', 4);
INSERT INTO disciplina (disc_codigo, disc_nome, curso_nome, qtd_aulas) VALUES (8, 'Geografia ', 'Ensino Pós Médio', 2);
INSERT INTO disciplina (disc_codigo, disc_nome, curso_nome, qtd_aulas) VALUES (9, 'Informática Aplicada', 'CST Sistemas para Internet', 4);
INSERT INTO disciplina (disc_codigo, disc_nome, curso_nome, qtd_aulas) VALUES (10, 'Banco de dados', 'CST Sistemas para Internet', 4);
INSERT INTO disciplina (disc_codigo, disc_nome, curso_nome, qtd_aulas) VALUES (11, 'Programação de Banco de dados', 'Computação', 4);


INSERT INTO matricula (aluno_numero, disc_codigo, ano) VALUES (1, 10, '2018');
INSERT INTO matricula (aluno_numero, disc_codigo, ano) VALUES (1, 4, '2018');
INSERT INTO matricula (aluno_numero, disc_codigo, ano) VALUES (1, 6, '2018');
INSERT INTO matricula (aluno_numero, disc_codigo, ano) VALUES (5, 3, '2018');
INSERT INTO matricula (aluno_numero, disc_codigo, ano) VALUES (6, 1, '2018');
INSERT INTO matricula (aluno_numero, disc_codigo, ano) VALUES (2, 6, '2018');
INSERT INTO matricula (aluno_numero, disc_codigo, ano) VALUES (7, 9, '2018');
INSERT INTO matricula (aluno_numero, disc_codigo, ano) VALUES (8, 10, '2018');
INSERT INTO matricula (aluno_numero, disc_codigo, ano) VALUES (9, 1, '2018');
INSERT INTO matricula (aluno_numero, disc_codigo, ano) VALUES (2, 2, '2018');
INSERT INTO matricula (aluno_numero, disc_codigo, ano) VALUES (11, 11, '2018');

INSERT INTO professor_disciplina (disc_codigo, prof_numero, ano) VALUES (1, 10, '2018');
INSERT INTO professor_disciplina (disc_codigo, prof_numero, ano) VALUES (2, 5, '2018');
INSERT INTO professor_disciplina (disc_codigo, prof_numero, ano) VALUES (3, 7, '2018');
INSERT INTO professor_disciplina (disc_codigo, prof_numero, ano) VALUES (4, 4, '2018');
INSERT INTO professor_disciplina (disc_codigo, prof_numero, ano) VALUES (5, 9, '2018');
INSERT INTO professor_disciplina (disc_codigo, prof_numero, ano) VALUES (6, 2, '2018');
INSERT INTO professor_disciplina (disc_codigo, prof_numero, ano) VALUES (7, 3, '2018');
INSERT INTO professor_disciplina (disc_codigo, prof_numero, ano) VALUES (8, 9, '2018');
INSERT INTO professor_disciplina (disc_codigo, prof_numero, ano) VALUES (9, 6, '2018');
INSERT INTO professor_disciplina (disc_codigo, prof_numero, ano) VALUES (10, 3, '2018');
INSERT INTO professor_disciplina (disc_codigo, prof_numero, ano) VALUES (11, 5, '2018');

/*3 – Faça as consultas usando SQL*/

-- 1- Crie uma consulta com todas as disciplinas oferecidas no ano de 2018, constando os nomes das disciplinas, nomes e cidades dos professores responsáveis e nomes dos cursos das disciplinas.
SELECT disc.disc_nome, prof.prof_nome, prof.prof_cidade, disc.curso_nome
FROM disciplina disc
INNER JOIN professor_disciplina profDisc ON disc.disc_codigo = profDisc.disc_codigo
INNER JOIN professor prof ON profDisc.prof_numero = prof.prof_numero
WHERE profDisc.ano = '2018';

-- 2- Crie uma consulta que mostre todos os nomes dos professores do curso de CST Sistemas para Internet, no ano de 2018, e os nomes das disciplinas pelas quais são responsáveis.
SELECT prof.prof_nome, disc.disc_nome 
FROM professor prof
INNER JOIN professor_disciplina profDisc ON profDisc.prof_numero = prof.prof_numero 
INNER JOIN disciplina disc ON disc.disc_codigo = profDisc.disc_codigo
WHERE disc.curso_nome='CST Sistemas para Internet' AND profDisc.ano = '2018';

-- 3- Crie uma consulta com todos os nomes de alunos matriculados no ano de 2018, os nomes das disciplinas em que estão matriculados, a cidade onde moram e os nomes dos cursos das disciplinas.
SELECT Al.aluno_nome, disc.disc_nome, Al.aluno_cidade, disc.curso_nome
FROM aluno Al
INNER JOIN matricula mtrc ON mtrc.aluno_numero = Al.aluno_numero
INNER JOIN disciplina disc ON disc.disc_codigo = mtrc.disc_codigo
INNER JOIN professor_disciplina profDisc ON profDisc.disc_codigo = disc.disc_codigo
WHERE mtrc.ano = '2018';

-- 4- Crie uma consulta que mostre todos os alunos de Palmas que cursam alguma disciplina de Programação de Banco de dados no ano de 2018.
SELECT aluno_nome FROM aluno 
INNER JOIN matricula ON aluno.aluno_numero = matricula.aluno_numero
INNER JOIN disciplina ON matricula.disc_codigo = disciplina.disc_codigo
WHERE aluno.aluno_cidade = 'Palmas' AND disciplina.disc_nome LIKE '%Programação de Banco de dados%' OR '%Banco de dados%' AND matricula.ano = '2018';

-- 5- Crie uma consulta que mostre todos os professores que não moram em Palmas e que ministram alguma disciplina no curso de CST Sistemas para Internet.
SELECT p.prof_nome, p.prof_cidade, d.curso_nome, d.disc_nome FROM professor p
JOIN professor_disciplina pd ON p.prof_numero = pd.prof_numero
JOIN disciplina d ON pd.disc_codigo = d.disc_codigo
WHERE p.prof_cidade <>'Palmas' AND d.curso_nome = 'CST Sistemas para Internet';

-- 6- Crie uma consulta que mostre o nome dos professores e a média de aulas que ministram.
SELECT  p.prof_nome, AVG(d.qtd_aulas) FROM professor p
JOIN professor_disciplina pd ON p.prof_numero = pd.prof_numero 
JOIN disciplina d ON pd.disc_codigo = d.disc_codigo
group by p.prof_nome;

-- 7- Crie uma consulta que mostre o nome dos professores o total de aulas que ministram por curso.

SELECT  p.prof_nome, d.curso_nome, SUM(d.qtd_aulas) FROM professor p
JOIN professor_disciplina pd ON p.prof_numero = pd.prof_numero
JOIN disciplina d ON pd.disc_codigo = d.disc_codigo
group by p.prof_nome;

-- 8- Crie uma consulta que mostre o nome do aluno, nome do curso, código e nome das disciplinas matriculadas de todos os alunos no ano de 2018.
SELECT a.aluno_nome, d.curso_nome, d.disc_codigo, d.disc_nome FROM aluno a
JOIN matricula m ON a.aluno_numero = m.aluno_numero
JOIN disciplina d ON m.disc_codigo = d.disc_codigo
group by a.aluno_nome;


SELECT * FROM professor;
select * from matricula;
SELECT * FROM disciplina;
SELECT * FROM professor_disciplina;
SELECT * FROM aluno;

