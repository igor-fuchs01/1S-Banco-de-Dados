-- isso é um comentário
/*
Isso é um bloco de comentários
*/

-- Todo comando SQL é em inglês
-- Todo comando termina com ponto e vírgula (;)

/*
Modelo de dados relacional são tabelas que se relacionam entre elas.
Também contêm linhas e colunas e cada linha tem cédulas com valores.
*/

-- Structured Query Language - SQL

-- CRIAR O BANCO DE DADOS
CREATE DATABASE sprint1;

-- SELECIONAR O BANCO DE DADOS
USE sprint1;

-- CRIAR A TABELA CHAMADA ALUNO
CREATE TABLE aluno (
-- nomeDoCampo tipoDoCampo
ra CHAR(8) PRIMARY KEY, -- character
nome VARCHAR(20),
bairro VARCHAR(10),
falta INT
);

-- INSERIR OS DADOS
INSERT INTO aluno VALUES
('01262999', 'Pedro', 'Consolação', 1);

-- INSERIR MAIS DE UMA LINHA
INSERT INTO aluno VALUES
('01262998', 'Vivian', 'Sacomã', 0),
('01262997', 'Matheus', 'Sacomã', 3);

-- EXIBIR OS DADOS
SELECT ra, nome, bairro, falta FROM aluno;
SELECT * FROM aluno;

-- EXIBIR APENAS O NOME DO ALUNO
SELECT nome FROM aluno;

-- EXBIR OS ALUNOS ONDE O BAIRRO É SACOMÃ
SELECT nome FROM aluno WHERE bairro = 'Sacomã';

-- EXIBIR OS ALUNOS ONDE O BAIRRO É DIFERENTE DE SACOMÃ
SELECT nome FROM aluno WHERE bairro != 'Sacomã';

-- EXIBIR OS ALUNOS ONDE O BAIRRO É DIFERENTE DE SACOMÃ
SELECT nome FROM aluno WHERE bairro <> 'Sacomã';

-- EXIBIR OS ALUNOS ONDE O BAIRRO COMEÇA COM A LETRA S
SELECT * FROM aluno WHERE bairro LIKE 'S%';

-- EXIBIR OS ALUNOS ONDE O BAIRRO TERMINA COM A LETRA O
SELECT * FROM aluno WHERE bairro LIKE '%O';

-- EXIBIR OS ALUNOS ONDE O BAIRRO CONTENHA A LETRA A
SELECT * FROM ALUNO WHERE bairro LIKE '%A%';

-- EXIBIR EM ORDEM CRESCENTE E DECRESCENTE
SELECT * FROM aluno ORDER BY bairro ASC;
SELECT * FROM aluno ORDER BY bairro DESC;