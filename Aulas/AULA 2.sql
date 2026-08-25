-- CRIAR O DATABASE
-- CREATE DATABASE sprint1;

-- SELECIONAR O BANCO DE DADOS
USE sprint1;

-- CRIAR A TABELA EMPRESA
CREATE TABLE empresa (
id INT PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(50),
dtCriacao DATE, -- 'YYYY-MM-DD'
cnpj CHAR(18) UNIQUE, -- 01.234.567/0001-89
faturamento DECIMAL(10, 2)
);

/*
TIPOS DE NÚMEROS DECIMAIS
FLOAT - 7 CARACTERES 12345,67
DOUBLE - 15 CARACTERES 12345678909,8785
DECIMAL(P1,P2) - P1 = Número total de caracteres | P2 = Número de caracteres após a vírgula
(5,2) 123.45
(3,1) 23.4
(7,4) 246.7890
*/

-- DESCREVER OS CAMPOS DA TABELA
DESCRIBE empresa;

INSERT INTO empresa VALUES
	(default, 'Stefanini', '1960-01-01', null, 1000.99);

INSERT INTO empresa(nome, faturamento) VALUES
	('C6Bank', 2100.98),
    ('Deloite', 999.97);
    
SELECT * FROM empresa;

-- EXIBIR A EMPRESA CUJO O NOME É STEFANINI
SELECT nome FROM empresa
	WHERE nome = 'Stefanini';
    
-- EXIBIR O NOME DA EMPRESA QUE É DIFERENTE DA STEFANINI
SELECT nome FROM empresa
	WHERE nome != 'Stefanini';
    
-- EXBIR AS EMPRESAS QUE COMEÇAM COM A LETRA S
SELECT nome FROM empresa
	WHERE nome LIKE 'S%';
    
-- EXIBIR AS EMPRESAS ONDE A SEGUNDA LETRA É T
SELECT nome FROM empresa
	WHERE nome LIKE '_t%';
    
-- AULA 2 - novos comandos
SELECT * FROM empresa;

-- ALTER TABLE - Altera a tabela da coluna
-- MODIFY - modifica
ALTER TABLE empresa MODIFY COLUMN nome VARCHAR(25);
DESCRIBE empresa;

-- RENAME - Renomeia
ALTER TABLE empresa RENAME COLUMN dtCriacao TO dataCriacao;
DESCRIBE empresa;

-- ADD - Adiciona
ALTER TABLE empresa ADD COLUMN responsavel VARCHAR(20);
DESCRIBE empresa;

-- DROP - Dropa
ALTER TABLE empresa DROP COLUMN cnpj;
DESCRIBE empresa;

-- Auto_increment
ALTER TABLE empresaTop auto_increment = 10000;

-- ATUALIZAR UMA LINHA QUE JÁ EXISTE
UPDATE empresa SET responsavel = 'Andresa' WHERE id = 2;

-- EXCLUIR UMA LINHA QUE JÁ EXISTE
DELETE FROM empresa WHERE id = 3;

SELECT nome FROM empresa
	WHERE id = 1 OR id = 2;
    
-- SELECIONA OS DADOS ESPECIFICADOS
SELECT nome FROM empresa 
	WHERE id IN (1,2);
    
-- SELECIONA OS DADOS NÃO ESPECIFICADOS
SELECT nome FROM empresa
	WHERE id NOT IN (1,2);

-- RENOMEIA A TABELA
RENAME TABLE empresa TO empresaTop;

-- LIMPA TODAS AS LINHAS DA TABELA
TRUNCATE TABLE empresaTop;

INSERT INTO empresaTop (nome) VALUES
	('Sptech');
    
SELECT * FROM empresaTop;

DROP TABLE empresaTop;

SELECT * FROM aluno WHERE '% M%';

