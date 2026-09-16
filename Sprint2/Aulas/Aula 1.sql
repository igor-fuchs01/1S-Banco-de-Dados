CREATE DATABASE sprint2;

USE sprint2;

-- Crair a tabela responsável, pois ela não tem FK
CREATE TABLE Responsavel(
	idResp INT primary KEY auto_increment,
    nome VARCHAR(45),
    salario decimal(10,2)
) AUTO_INCREMENT = 5000;

INSERT INTO responsavel(nome, salario) VALUES
	('Jow', 1.88),
    ('Jerry', 1.48),
    ('Jan', 1.98);

CREATE TABLE Empresa(
	idEmpresa INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(45),
    cnpj VARCHAR(18),
    fkResp INT NOT NULL UNIQUE,
    CONSTRAINT fkEmpresaResp FOREIGN KEY (fkResp) REFERENCES responsavel(idResp)
);

INSERT INTO empresa(nome, cnpj, fkResp) VALUES 
	('C6 Bank', null, 5000),
    ('Safra', null, 5001),
    ('Stefanini', null, 5002);
    
-- JOIN (JUNÇÃO, ASSOCIAÇÃO)
SELECT * FROM responsavel
		JOIN empresa ON fkResp = idResp;
        
SELECT r.nome AS Responsável, e.nome as 'Nome da Empresa' FROM empresa AS e JOIN responsavel AS r on idResp = fkResp;

CREATE TABLE aluno (
 ra char(8) primary key,
 nome varchar(45),
 bairro varchar(25),
 fkEmpresa int not null
);

ALTER TABLE aluno ADD CONSTRAINT fkEmpresaAluno FOREIGN KEY (fkEmpresa) REFERENCES empresa(idEmpresa);

INSERT INTO aluno VALUES
	('0126999', 'Jonas', 'Paraíso', 1),
	('0126998', 'Janna', 'Perdizes', 1),
	('0126997', 'Jeremias', null, 2),
	('0126996', 'Januario', null, 3);
    
SELECT * FROM empresa JOIN aluno ON fkEmpresa = idEmpresa;

SELECT empresa.nome as Empresa, aluno.nome as Aluno, responsavel.nome as Responsável 
	FROM empresa JOIN responsavel on idResp = fkResp JOIN aluno ON idEmpresa = fkEmpresa
    WHERE empresa.nome = 'C6 Bank';