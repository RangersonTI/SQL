-- Criação do banco de dados
CREATE DATABASE escola;

-- Seleção do banco de dados
USE escola;

-- Criação da tabela "alunos"
CREATE TABLE alunos (
  id INT PRIMARY KEY AUTO_INCREMENT,
  nome VARCHAR(50),
  idade INT,
  sexo CHAR(1),
  cidade VARCHAR(50)
);

-- Inserção de dados na tabela "alunos"
INSERT INTO alunos (nome, idade, sexo, cidade) VALUES
  ('Ana Silva', 18, 'F', 'São Paulo'),
  ('Pedro Souza', 19, 'M', 'Rio de Janeiro'),
  ('Maria Santos', 17, 'F', 'Belo Horizonte'),
  ('João Pereira', 20, 'M', 'Salvador');

-- Criação da tabela "disciplinas"
CREATE TABLE disciplinas (
  id INT PRIMARY KEY AUTO_INCREMENT,
  nome VARCHAR(50),
  carga_horaria INT,
  professor VARCHAR(50)
);

-- Inserção de dados na tabela "disciplinas"
INSERT INTO disciplinas (nome, carga_horaria, professor) VALUES
  ('Matemática', 80, 'Carlos Silva'),
  ('História', 60, 'Maria Souza'),
  ('Geografia', 60, 'José Santos');

-- Criação da tabela "notas"
CREATE TABLE notas (
  id INT PRIMARY KEY AUTO_INCREMENT,
  aluno_id INT,
  disciplina_id INT,
  nota FLOAT,
  FOREIGN KEY (aluno_id) REFERENCES alunos(id),
  FOREIGN KEY (disciplina_id) REFERENCES disciplinas(id)
);

-- Inserção de dados na tabela "notas"
INSERT INTO notas (aluno_id, disciplina_id, nota) VALUES
  (1, 1, 8.5),
  (1, 2, 7.0),
  (2, 1, 6.5),
  (2, 2, 9.0),
  (3, 1, 9.0),
  (3, 3, 7.5),
  (4, 2, 5.5),
  (4, 3, 6.0);

-- Perguntas práticas para os alunos responderem
-- 1. Crie uma View que mostre o nome e a idade dos alunos que têm nota acima de 7.0 em alguma disciplina.
	CREATE VIEW NotasMaior7 AS 
		SELECT a.nome, a.idade FROM alunos a
		INNER JOIN notas n ON a.id = n.aluno_id
		WHERE n.nota > 7
		GROUP BY a.id;
	
    SELECT * FROM NotasMaior7;
	
-- 2. Crie uma View que mostre o nome e a nota dos alunos em cada disciplina.
	CREATE VIEW TabelaDeNotas AS  
		SELECT a.nome AS Aluno, d.nome AS Disciplina, n.nota AS Nota FROM alunos a
		INNER JOIN notas n ON a.id = n.aluno_id
		INNER JOIN disciplinas d ON n.disciplina_id = d.id;
    
	SELECT * FROM TabelaDeNotas;

-- 3. Crie uma View que mostre o nome das disciplinas e a quantidade de alunos que tiraram nota acima de 7.0
	CREATE VIEW NotasMaioresQue7EmDisciplina AS
		SELECT d.nome AS Disciplina, COUNT(n.nota) AS 'Notas maiores que 7' FROM disciplinas d
		INNER JOIN notas n ON d.id = n.disciplina_id
		WHERE n.nota > 7
		GROUP BY d.nome;
        
	SELECT * FROM NotasMaioresQue7EmDisciplina;
    
-- 4. Crie uma View que mostre o nome dos alunos que tiraram nota acima da média em todas as disciplinas.
	CREATE VIEW AlunosAprovadosPorMedia AS
		SELECT a.nome AS Aluno FROM alunos a
		INNER JOIN notas n ON a.id = n.aluno_id
        WHERE n.nota > 7
		GROUP BY a.id;
        
	SELECT * FROM AlunosAprovadosPorMedia;

-- 5. Crie uma View que mostre o nome dos alunos que tiraram nota acima da média em pelo menos duas disciplinas.
		
	CREATE VIEW AlunosAprovadosPorMediaEm1 AS
		SELECT a.nome AS Aluno FROM alunos a
		INNER JOIN notas n ON a.id = n.aluno_id
		GROUP BY a.id
        HAVING MIN(7) < AVG(n.nota);
        
	SELECT * FROM AlunosAprovadosPorMediaEm1;
    