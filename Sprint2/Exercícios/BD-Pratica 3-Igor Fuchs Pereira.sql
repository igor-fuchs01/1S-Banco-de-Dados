-- ================================================= Exercício 01 =================================================
-- No MySQL Workbench:
-- Crie um banco de dados chamado Sprint2;
CREATE DATABASE Sprint2;

-- Use o banco de dados Sprint2;
USE Sprint2;

-- Escreva e execute os comandos para:
-- • Criar a tabela chamada Atleta para conter os dados: idAtleta (int e chave
-- primária da tabela), nome (varchar, tamanho 40), modalidade (varchar, tamanho
-- 40), qtdMedalha (int, representando a quantidade de medalhas que o atleta
-- possui)
CREATE TABLE Atleta(
idAtleta INT PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(40),
modalidade VARCHAR(40),
qtdMedalha INT
);

-- • Inserir dados na tabela, procurando colocar mais de um atleta para cada
-- modalidade e pelo menos 5 atletas.
INSERT INTO Atleta (nome, modalidade, qtdMedalha) VALUES
('Michael Felps', 'Natação', 28),
('Katia', 'Natação', 14),
('Usain Bolt', 'Atletismo', 8),
('Felix', 'Atletismo', 11),
('Rebeca Beta', 'Ginástica', 6),
('Simone Simara', 'Ginástica', 11);

-- • Criar uma tabela chamada País para conter os dados: idPais (int e chave primária
-- da tabela), nome (varchar, tamanho 30), capital (varchar, tamanho 40);
CREATE TABLE pais (
idPais INT PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(30),
capital VARCHAR(40)
);

-- • Inserir pelo menos 4 países na tabela país.
INSERT INTO Pais (nome, capital) VALUES
('Brasil', 'Brasília'),
('Estados Unidos', 'Washington, D.C.'),
('França', 'Paris'),
('Japão', 'Tóquio');

-- Fazer a modelagem lógica conforme a regra de negócio:
-- • 1 país tem 1 ou muitos atletas;
-- • 1 atleta é de 1 e somente 1 país;
-- Escreva e execute os comandos para:
-- • Criar a chave estrangeira na tabela correspondente conforme modelagem;
ALTER TABLE Atleta ADD COLUMN fkPais INT, ADD CONSTRAINT fkPaisAluno FOREIGN KEY (fkPais) REFERENCES pais(idPais);

-- • Atualizar o país de todos os atletas;
UPDATE Atleta SET fkPais = 1 WHERE idAtleta = 1;
UPDATE Atleta SET fkPais = 2 WHERE idAtleta = 2;
UPDATE Atleta SET fkPais = 3 WHERE idAtleta = 3;
UPDATE Atleta SET fkPais = 4 WHERE idAtleta = 4;
UPDATE Atleta SET fkPais = 5 WHERE idAtleta = 5;

-- • Exibir os atletas e seu respectivo país;
SELECT * FROM Atleta JOIN Pais ON idPais = fkPais;

-- • Exibir apenas o nome do atleta e o nome do respectivo país;
SELECT Atleta.nome as 'Nome do Atleta', Pais.nome as 'Nome do País' FROM Atleta JOIN Pais ON idPais = fkPais;

-- • Exibir os dados dos atletas, seus respectivos países, de uma determinada capital;
SELECT * FROM Atleta JOIN Pais ON idPais = fkPais WHERE Pais.capital = 'Tóquio';

-- ================================================= Exercício 02 =================================================
-- No MySQL Workbench, utilizando o banco de dados ‘sprint2’:
USE sprint2;

-- • Criar a tabela chamada Musica para conter os dados: idMusica, titulo (tamanho
-- 40), artista (tamanho 40), genero (tamanho 40), sendo que idMusica é a chave
-- primária da tabela.

CREATE TABLE Musica(
idMusica INT PRIMARY KEY AUTO_INCREMENT,
titulo varchar(40),
genero VARCHAR(40)
);
-- • Inserir dados na tabela, procurando colocar um gênero de música que tenha mais
-- de uma música, e um artista, que tenha mais de uma música cadastrada. Procure
-- inserir pelo menos umas 3 músicas.
INSERT INTO Musica(titulo, genero) VALUES
('Hail to the King - Avenged Sevenfold', 'Heavy Metal'),
('Do I Wanna Know - Artic Monkeys', 'Rock'),
('RU MINE? - Artic Monkeys', 'Rock');

-- • Criar a tabela chamada Album para conter os dados: idAlbum, nome, tipo (digital
-- ou físico) e dtLancamento (DATE).
CREATE TABLE Album(
idAlbum INT primary key auto_increment,
nome VARCHAR(45), 
tipo VARCHAR(45),
CONSTRAINT chkTipo CHECK(tipo IN('digital', 'físico')),
dtLancamento DATE DEFAULT (CURRENT_TIMESTAMP)
);

-- • Inserir pelo menos 2 albuns;
INSERT INTO Album(nome, tipo, dtLancamento) VALUES
('King', 'digital', '2024-05-20'),
('Is she will back?', 'físico', '2025-04-10'),
('Is she will back?', 'digital', '2025-04-10');

-- • Fazer a modelagem lógica conforme a regra de negócio:
-- • 1 album pode ter 1 ou muitas músicas;
-- • 1 música é de 1 e somente 1 album;

-- Execute os comandos para:
-- a) Exibir todos os dados das tabelas separadamente;
SELECT * FROM Album;
SELECT * FROM Musica;

-- b) Criar a chave estrangeira na tabela de acordo com a regra de negócio;
ALTER TABLE Musica ADD COLUMN fkAlbum INT, ADD CONSTRAINT fkAlbumMusica FOREIGN KEY (fkAlbum) references Album(idAlbum);

-- c) Atualizar os álbuns de cada música;
SELECT * FROM Musica;
UPDATE Musica SET fkAlbum = 1 WHERE idMusica = 1;
UPDATE Musica SET fkAlbum = 2 WHERE idMusica = 2;
UPDATE Musica SET fkAlbum = 2 WHERE idMusica = 3;

-- d) Exibir as músicas e seus respectivos álbuns;
SELECT * FROM Musica JOIN Album ON idAlbum = fkAlbum;

-- e) Exibir somente o título da música e o nome do seu respectivo álbum;
SELECT m.titulo as 'título da música', a.nome as 'nome' FROM musica as m JOIN album as a ON idAlbum = fkAlbum;

-- f) Exibir os dados das músicas e seu respectivo álbum, de um determinado tipo.
SELECT * FROM Musica JOIN Album ON idAlbum = fkAlbum WHERE Album.nome = 'King';

-- ================================================= Exercício 3 =================================================
USE sprint2;

-- Criar as tabelas;
CREATE TABLE Pessoa(
idPessoa INT PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(45),
cpf CHAR(11)
);

CREATE TABLE Reserva(
idReserva INT PRIMARY KEY AUTO_INCREMENT,
dtReserva DATETIME,
dtRetirada DATETIME,
dtDevolucao DATETIME,
fkPessoa INT UNIQUE
);

-- Inserir 5 registros
INSERT INTO Pessoa (nome, cpf) VALUES
('João Silva', '12345678901'),
('Maria Souza', NULL),
('Carlos Oliveira', '98765432100'),
('Riquelme', '45678912300'),
('Ana Santos', NULL);

-- Inserir 5 registros na tabela Reserva
INSERT INTO Reserva (dtReserva, dtRetirada, dtDevolucao, fkPessoa) VALUES
('2026-09-15 10:00:00', '2026-09-16 09:00:00', '2026-10-18 18:00:00', 1),
('2026-09-15 11:30:00', NULL, '2026-09-20 18:00:00', 2),
('2026-09-15 11:50:00', '2026-09-17 08:00:00', '2026-10-18 18:00:00', 3),
('2026-09-16 14:00:00', NULL, NULL, 4),
('2026-09-17 09:30:00', '2026-09-18 10:00:00', '2026-09-19 17:00:00', 5);

-- Configurar chave estrangeira
ALTER TABLE Reserva ADD CONSTRAINT fkPessoaReserva foreign key (fkPessoa) REFERENCES Pessoa(idPessoa);

-- Exibir dados;
SELECT * FROM Reserva join pessoa on idPessoa = fkPessoa;

-- Exibir dados com AS;
SELECT r.dtReserva as 'Data da Reserva', r.dtRetirada as 'Data da Retirada', r.dtDevolucao as 'Data da Devolução', p.nome as 'Nome', p.cpf as 'CPF'
	FROM Reserva as r JOIN Pessoa as p ON fkPessoa = idPessoa;

-- Exibir dados com CASE;
SELECT r.dtReserva as 'Data da Reserva', r.dtRetirada as 'Data da Retirada', r.dtDevolucao as 'Data da Devolução', p.nome as 'Nome', p.cpf as 'CPF',
	CASE
		WHEN timestampdiff(DAY, r.dtRetirada, r.dtDevolucao) < 15 THEN 'A estadia durou menos que 15 dias'
        ELSE 'A estadia durou mais que 15 dias'
	END as 'Tempo de Devolução'
FROM Reserva as r JOIN Pessoa as p ON idPessoa = fkPessoa; 

-- Exibir dados com IFNULL;
SELECT r.dtReserva as 'Data da Reserva', ifnull(r.dtRetirada, '2026-09-16 00:00:00') as 'Data da Retirada', ifnull(r.dtDevolucao, now()) as 'Data da Devolução', p.nome as 'Nome', ifnull(p.cpf, 'Não informou o CPF') as 'CPF',
	CASE
		WHEN timestampdiff(DAY, ifnull(r.dtRetirada, '2026-09-16 00:00:00'), ifnull(r.dtDevolucao, now())) < 15 THEN 'A estadia durou menos que 15 dias'
        ELSE 'A estadia durou mais que 15 dias'
	END as 'Tempo de Devolução'
FROM Reserva as r JOIN Pessoa as p ON idPessoa = fkPessoa;

-- ================================================= Exercício 4 =================================================
USE sprint2;

-- Criar as tabelas;
CREATE TABLE pessoa1(
idPessoa1 int primary key auto_increment,
nome varchar(45),
dtNascimento DATE
);

CREATE TABLE pessoa2(
idPessoa2 INT PRIMARY KEY AUTO_INCREMENT,
nome varchar(45),
dtnascimento date,
fkPessoa1 INT
);

-- Inserir 5 registros
INSERT INTO pessoa1 (nome, dtNascimento) VALUES
('João Silva', '1995-03-15'),
('Maria Souza', '2000-07-22'),
('Carlos Oliveira', '1998-11-10'),
('Ana Santos', NULL),
('Pedro Costa', '1992-05-30');

INSERT INTO pessoa2 (nome, dtNascimento, fkPessoa1) VALUES
('Lucas Silva', '2001-02-18', 1),
('Juliana Souza', '1999-09-25', 2),
('Rafael Oliveira', NULL, 3),
('Beatriz Santos', '2003-04-12', NULL),
('Gabriel Costa', '1997-12-05', 5);

-- Configurar chave estrangeira
ALTER TABLE pessoa2 ADD CONSTRAINT fkPessoa1Pessoa2 foreign key (fkPessoa1) references pessoa1(idPessoa1);

-- Exibir dados;
SELECT * FROM pessoa1 JOIN pessoa2 ON idPessoa1 = fkPessoa1;

-- Exibir dados com AS;
SELECT p1.nome as 'Nome do Primeiro Amante', p1.dtNascimento as 'Data de nascimento do Primeiro Amante',  p2.nome as 'Nome do Segundo Amante', p2.dtNascimento as 'Data de nascimento do Segundo amante' 
    FROM pessoa1 as p1 JOIN pessoa2 as p2 ON p1.idPessoa1 = p2.fkPessoa1;

-- Exibir dados com CASE;
SELECT p1.dtNascimento as 'Data de Nascimento - Amante 1', p2.dtNascimento as 'Data de Nascimento - Amante 2',
CASE
	WHEN timestampdiff(year, p1.dtNascimento, p2.dtNascimento) > 6 or timestampdiff(year, p1.dtNascimento, p2.dtNascimento) < -6 THEN 'Esse casal tem uma diferença de idade maior que 7 anos'
	WHEN timestampdiff(year, p1.dtNascimento, p2.dtNascimento) > 3 or timestampdiff(year, p1.dtNascimento, p2.dtNascimento) < -3 THEN 'Esse casal tem uma diferença de idade maior que 4 anos'
    ELSE 'Esse casal quase não tem diferença de idade'
END as 'Diferença de idade entre casais'
FROM pessoa1 as p1 join pessoa2 as p2 on idPessoa1 = fkPessoa1;

-- Exibir dados com IFNULL;
SELECT ifnull(p1.dtNascimento, '2004-09-20') as 'Data de Nascimento - Amante 1', ifnull(p2.dtNascimento, '2004-09-20') as 'Data de Nascimento - Amante 2', timestampdiff(year, ifnull(p1.dtNascimento, '2004-09-20'), ifnull(p2.dtNascimento, '2004-09-20')) as 'Diferença de Idade',
CASE
	WHEN timestampdiff(year, ifnull(p1.dtNascimento, '2004-09-20'), ifnull(p2.dtNascimento, '2004-09-20')) > 6 or timestampdiff(year, ifnull(p1.dtNascimento, '2004-09-20'), ifnull(p2.dtNascimento, '2004-09-20')) < -6 THEN 'Esse casal tem uma diferença de idade maior que 7 anos'
	WHEN timestampdiff(year, ifnull(p1.dtNascimento, '2004-09-20'), ifnull(p2.dtNascimento, '2004-09-20')) > 3 or timestampdiff(year, ifnull(p1.dtNascimento, '2004-09-20'), ifnull(p2.dtNascimento, '2004-09-20')) < -3 THEN 'Esse casal tem uma diferença de idade maior que 4 anos'
    ELSE 'Esse casal quase não tem diferença de idade'
END as 'Diferença de idade entre casais'
FROM pessoa1 as p1 join pessoa2 as p2 on idPessoa1 = fkPessoa1;

-- ================================================= Exercício 5 =================================================
-- Referente a regra de negócio acima, cria a modelagem utilizando um relacionamento 1:1, implemente com o script realizando os seguintes comandos:
USE sprint2;

-- Criar as tabelas;
CREATE TABLE Cliente(
idCliente INT PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(45),
cpf CHAR(14),
dtNascimento DATE,
fkHabilitacao INT UNIQUE
);

CREATE TABLE Habilitacao(
idHabilitacao INT PRIMARY KEY AUTO_INCREMENT,
categoria VARCHAR(3),
dtValidade DATE,
dtEmissao DATE
);

-- Inserir 5 registros
INSERT INTO Cliente (nome, cpf, dtNascimento, fkHabilitacao)
VALUES
('João Silva', '123.456.789-01', '2000-04-15', 1),
('Maria Santos', '234.567.890-12', null, 2),
('Carlos Oliveira', '345.678.901-23', '2002-01-10', 3),
('Ana Souza', '456.789.012-34', '1995-11-30', 4),
('Pedro Costa', '567.890.123-45', '2001-06-05', 5);

INSERT INTO Habilitacao (categoria, dtValidade, dtEmissao)
VALUES
('B', '2030-09-15', '2025-09-15'),
('A', '2029-05-20', '2024-05-20'),
('AB', '2031-01-10', null),
('B', '2025-11-30', '2020-11-30'),
('A', '2030-03-25', '2025-03-25');

-- Configurar chave estrangeira
ALTER TABLE Cliente ADD CONSTRAINT fkHabilitacaoCliente foreign key (fkHabilitacao) REFERENCES Habilitacao(idHabilitacao);

-- Exibir dados;
SELECT * FROM Cliente join Habilitacao on idHabilitacao = fkhabilitacao;

-- Exibir dados com AS;
SELECT 
	c.nome as 'Nome do Cliente', 
	c.cpf as 'CPF', 
	c.dtNascimento as 'Data de Nascimento', 
    h.categoria as 'Categoria da CNH', 
    h.dtValidade as 'Data de Validade', 
    h.dtEmissao as 'Data de Emissão'
FROM Cliente as c JOIN Habilitacao as h ON idHabilitacao = fkHabilitacao;

-- Exibir dados com CASE;
SELECT c.nome as 'Nome do Cliente', h.dtValidade as 'Data de Validade CNH',
CASE
	WHEN h.dtValidade < now() THEN 'A sua carteira de motorista está vencida!'
    ELSE 'Você ainda tem tempo de sobra para dirigir!'
END as 'Vencimento da CNH'
FROM Cliente as c JOIN Habilitacao as h ON idHabilitacao = fkHabilitacao;

-- Exibir dados com IFNULL;
SELECT concat('A pessoa com o nome ', ifnull(c.nome, 'NOME NÃO INFORMADO'), ', nasceu em ', ifnull(c.dtNascimento, 'DATA DE NASCIMENTO NÃO INFORMADA'), ' e tirou sua CNH na data: ', ifnull(h.dtEmissao, 'DATA DE EMISSÃO NÃO INFORMADA')) as 'Frase com nome, nascimento e data de emissão'
FROM Cliente as c JOIN Habilitacao as h ON idHabilitacao = fkHabilitacao;

-- ================================================= Exercício 6 =================================================
-- Regra de negócio: 
-- 1 Farmácia tem no mínimo 1 e no máximo 1 endereço, 1 endereço é de no mínimo 1 farmácia e no máximo 1.
-- 1 Farmácia tem no mínimo 1 farmacêutico e no máximo n, 1 farmacêutico é de no mínimo 1 farmácia e no máximo 1.


-- Criar a modelagem lógica na regra acima, com os campos de sua escolha.

-- Criar as tabelas;
CREATE TABLE Endereco(
idEndereco int primary key auto_increment,
logradouro varchar(45),
cep char(10),
numero varchar(10)
);

CREATE TABLE Farmacia(
idFarmacia INT primary key auto_increment,
cnpj char(18) UNIQUE,
nome varchar(45),
slogan varchar(45),
fkEndereco INT UNIQUE
);

CREATE TABLE Farmaceutico(
idFarmaceutico INT primary key auto_increment,
nome varchar(45),
cpf CHAR(14) UNIQUE,
turno VARCHAR(6),
constraint chkTurno check(turno in('Manhã', 'Tarde', 'Noite')),
fkFarmacia INT
);

-- Inserir 5 registros;
INSERT INTO Endereco (logradouro, cep, numero) VALUES
('Rua das Flores', '09210-000', '123'),
('Avenida Brasil', '09280-140', '456'),
('Rua São João', '09310-100', '789'),
('Alameda Santos', '09040-020', '321'),
('Rua XV de Novembro', '09015-000', '654');

INSERT INTO Farmacia (cnpj, nome, slogan, fkEndereco) VALUES
('12.345.678/0001-90', 'Farmácia Saúde+', 'Cuidando de você', 1),
('23.456.789/0001-01', 'DrogaBem', 'Perto de casa, perto de você', 2),
('34.567.890/0001-12', 'FarmaVida', 'Saúde é vida', 3),
('45.678.901/0001-23', 'Farmácia Popular', 'Preço justo, saúde em dia', 4),
('56.789.012/0001-34', 'Boa Saúde Farma', 'Sua saúde em primeiro lugar', 5);

INSERT INTO Farmaceutico (nome, cpf, turno, fkFarmacia) VALUES
('Ana Paula Silva', '123.456.789-00', 'Manhã', 1),
('Carlos Eduardo Souza', '234.567.890-11', 'Tarde', 2),
('Mariana Costa', '345.678.901-22', 'Noite', 3),
('João Pedro Lima', '456.789.012-33', 'Manhã', 4),
('Fernanda Alves', '567.890.123-44', 'Tarde', 5),
('Paulo Silva', '123.476.789-00', 'Manhã', 1),
('Carla Souza', '234.587.890-11', 'Tarde', 2),
('Mariano Costa', '345.978.901-22', 'Noite', 3),
('Joaquina Lima', '456.189.012-33', 'Manhã', 4),
('Fernando Alves', '567.390.123-44', 'Tarde', 5);

-- Configurar chave estrangeira;
ALTER TABLE Farmacia ADD CONSTRAINT fkEnderecoFarmacia foreign key (fkEndereco) REFERENCES Endereco(idEndereco);
ALTER TABLE Farmaceutico ADD CONSTRAINT fkFarmaciaFarmaceutico foreign key (fkFarmacia) REFERENCES Farmacia(idFarmacia);

-- Exibir dados;
SELECT * FROM Farmacia;
SELECT * FROM Farmaceutico;
SELECT * FROM Endereco;
SELECT * FROM Farmacia JOIN Farmaceutico ON idFarmacia = fkFarmacia JOIN Endereco ON fkEndereco = idEndereco;

-- Exibir dados com AS;
SELECT 
    f.nome AS 'Nome da Farmácia',
    f.cnpj AS 'CNPJ',
    f.slogan AS 'Slogan',
    fa.nome AS 'Nome do Farmacêutico',
    fa.turno AS 'Turno de Trabalho',
    e.logradouro AS 'Logradouro',
    e.numero AS 'Número',
    e.cep AS 'CEP' FROM Farmacia AS f
JOIN Farmaceutico AS fa ON f.idFarmacia = fa.fkFarmacia
JOIN Endereco AS e ON f.fkEndereco = e.idEndereco;

-- Exibir dados com CASE;
SELECT 
    fa.nome AS 'Nome do Farmacêutico', f.nome AS 'Farmácia', fa.turno AS 'Turno',
    CASE
        WHEN fa.turno = 'Manhã' THEN 'Trabalha no período do dia'
        WHEN fa.turno = 'Tarde' THEN 'Trabalha no período da tarde'
        ELSE 'Trabalha no período da noite'
    END AS 'Descrição do Turno'
FROM Farmaceutico AS fa
JOIN Farmacia AS f ON f.idFarmacia = fa.fkFarmacia;

-- Exibir dados com IFNULL;
SELECT 
    CONCAT('A farmácia ', IFNULL(f.nome, 'NOME NÃO INFORMADO'), 
	' tem o slogan: "', IFNULL(f.slogan, 'SLOGAN NÃO INFORMADO'), 
	'" e está localizada na ', IFNULL(e.logradouro, 'RUA NÃO INFORMADA'), 
	', número ', IFNULL(e.numero, 'NÚMERO NÃO INFORMADO')) AS 'Frase com nome, slogan e endereço'
FROM Farmacia AS f
JOIN Endereco AS e ON f.fkEndereco = e.idEndereco;

-- ================================================= DESAFIO =================================================
USE sprint2;

CREATE TABLE Time(
    idTime INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(45),
    estado CHAR(2)
);

CREATE TABLE Tecnico(
    idTecnico INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(45),
    fkTime INT,
    CONSTRAINT fkTimeTecnico FOREIGN KEY (fkTime) REFERENCES Time(idTime)
);

CREATE TABLE Escalacao(
    idEscalacao INT PRIMARY KEY AUTO_INCREMENT,
    numJogador CHAR(3),
    nome VARCHAR(45),
    posicao VARCHAR(45),
    tipo VARCHAR(45),
    dtJogo DATETIME,
    fkTecnico INT,
    CONSTRAINT fkTecnicoEscalacao FOREIGN KEY (fkTecnico) REFERENCES Tecnico(idTecnico)
);