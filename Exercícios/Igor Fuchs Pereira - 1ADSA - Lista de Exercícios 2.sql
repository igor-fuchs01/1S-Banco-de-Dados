/*
================== Exercício 1 ==================
*/
USE sprint1;

/*
Criar a tabela chamada Atleta para conter os dados: idAtleta (int e chave primária da
tabela), nome (varchar, tamanho 40), modalidade (varchar, tamanho 40), qtdMedalha
(int, representando a quantidade de medalhas que o atleta possui)
*/
CREATE TABLE Atleta (
idAtleta INT PRIMARY KEY AUTO_INCREMENT, 
nome VARCHAR(40), 
modalidade VARCHAR(40), 
qtdMedalha INT);

INSERT INTO Atleta VALUES
	(default, 'Josvaldo', 'Natação', 0),
    (default, 'Nidosvaldo', 'Natação', 0),
    (default, 'Joaquim', 'Futebol', 0),
    (default, 'Neymar', 'Futebol', 20),
    (default, 'Alice', 'Corrida', 1),
    (default, 'Carlos', 'Corrida', 2),
    (default, 'Fernando', 'Corrida', 8),
    (default, 'Felps', 'Natação', 10),
    (default, 'Haaland', 'Futebol', 8),
    (default, 'Usain Bolt', 'Corrida', 10);
    
-- • Exibir todos os dados da tabela.
SELECT * FROM Atleta;

-- • Atualizar a quantidade de medalhas do atleta com id=1;
UPDATE Atleta SET qtdMedalha = 999 WHERE idAtleta = 1;

-- • Atualizar a quantidade de medalhas do atleta com id=2 e com o id=3;
UPDATE Atleta SET qtdMedalha = 100 WHERE idAtleta IN (2,3);

-- • Atualizar o nome do atleta com o id=4;
UPDATE Atleta SET nome = 'Joaquim' WHERE idAtleta = 4;

-- • Adicionar o campo dtNasc na tabela, com a data de nascimento dos atletas, tipo date;
ALTER TABLE Atleta ADD COLUMN dtNasc DATE;

-- • Atualizar a data de nascimento de todos os atletas;
UPDATE Atleta SET dtNasc = '2000-09-01' WHERE idAtleta = 1;
UPDATE Atleta SET dtNasc = '2001-09-01' WHERE idAtleta = 2;
UPDATE Atleta SET dtNasc = '2002-09-03' WHERE idAtleta = 3;
UPDATE Atleta SET dtNasc = '2003-09-03' WHERE idAtleta = 4;
UPDATE Atleta SET dtNasc = '2004-09-03' WHERE idAtleta = 5;
UPDATE Atleta SET dtNasc = '2005-09-03' WHERE idAtleta = 6;
UPDATE Atleta SET dtNasc = '2006-09-03' WHERE idAtleta = 7;
UPDATE Atleta SET dtNasc = '2007-09-03' WHERE idAtleta = 8;
UPDATE Atleta SET dtNasc = '2008-09-03' WHERE idAtleta = 9;
UPDATE Atleta SET dtNasc = '2009-09-03' WHERE idAtleta = 10;

-- • Excluir o atleta com o id=5;
DELETE FROM Atleta WHERE idAtleta = '5';

-- • Exibir os atletas onde a modalidade é diferente de natação;
SELECT * FROM Atleta WHERE modalidade <> 'Natação';

-- • Exibir os dados dos atletas que tem a quantidade de medalhas maior ou igual a 3;
SELECT * FROM Atleta WHERE qtdMedalha >= 3;

-- • Modificar o campo modalidade do tamanho 40 para o tamanho 60;
ALTER TABLE Atleta MODIFY COLUMN modalidade VARCHAR(60);

-- • Descrever os campos da tabela mostrando a atualização do campo modalidade;
DESCRIBE Atleta;

-- • Limpar os dados da tabela;
TRUNCATE TABLE Atleta;

/*
Criar a tabela chamada Musica para conter os dados: idMusica, titulo (tamanho 40), artista
(tamanho 40), genero (tamanho 40), sendo que idMusica é a chave primária da tabela.
Inserir dados na tabela, procurando colocar um gênero de música que tenha mais de uma
música, e um artista, que tenha mais de uma música cadastrada. Procure inserir pelo
menos umas 7 músicas.
*/
USE sprint1;
CREATE TABLE Musica (
idMusica INT PRIMARY KEY AUTO_INCREMENT,
titulo VARCHAR(40),
artista VARCHAR(40),
genero VARCHAR(40)
);

-- Inserir pelo menos 7 músicas
INSERT INTO Musica VALUES 
	(default, 'Hail to the King', 'Avenged Sevenfold', 'Heavy Metal'),
	(default, 'In The End', 'Linkin Park', 'Rock'),
	(default, 'Serpentine', 'Disturbed', 'Heavy Metal'),
	(default, 'A Horse With No Name', 'American', 'Rock'),
	(default, 'Is This Love', 'Bob Marley', 'Reggae'),
	(default, 'Súplica Cearense', 'O Rappa', 'Reggae-Rock'),
	(default, 'My Demons', 'Starset', 'Rock'),
	(default, 'On My Own', 'Three Days Grace', 'Hard Rock'),
	(default, 'Simple Man', 'Lynyrd Skynyrd', 'Rock'),
	(default, 'Numb', 'Linkin Park', 'Rock');
    
-- a) Exibir todos os dados da tabela.
SELECT * FROM Musica;

-- b) Adicionar o campo curtidas do tipo int na tabela;
ALTER TABLE Musica ADD COLUMN curtidas INT;

-- c) Atualizar o campo curtidas de todas as músicas inseridas;
UPDATE Musica SET curtidas = 100 WHERE idMusica = 1;
UPDATE Musica SET curtidas = 300 WHERE idMusica = 2;
UPDATE Musica SET curtidas = 200 WHERE idMusica = 3;
UPDATE Musica SET curtidas = 400 WHERE idMusica = 4;
UPDATE Musica SET curtidas = 500 WHERE idMusica = 5;
UPDATE Musica SET curtidas = 600 WHERE idMusica = 6;
UPDATE Musica SET curtidas = 700 WHERE idMusica = 7;
UPDATE Musica SET curtidas = 800 WHERE idMusica = 8;
UPDATE Musica SET curtidas = 900 WHERE idMusica = 9;
UPDATE Musica SET curtidas = 1000 WHERE idMusica = 10;

-- d) Modificar o campo artista do tamanho 40 para o tamanho 80;
ALTER TABLE Musica MODIFY COLUMN artista VARCHAR(80);

-- e) Atualizar a quantidade de curtidas da música com id=1;
UPDATE Musica SET curtidas = 2000 WHERE idMusica = 1;

-- f) Atualizar a quantidade de curtidas das músicas com id=2 e com o id=3;
UPDATE Musica SET curtidas = 3000 WHERE idMusica IN (2,3);

-- g) Atualizar o nome da música com o id=5;
UPDATE Musica SET titulo = 'ZUM ZUM ZUM' WHERE idMusica = 5;

-- h) Excluir a música com o id=4;
DELETE FROM Musica WHERE idMusica = 4;

-- i) Exibir as músicas onde o gênero é diferente de funk;
SELECT * FROM Musica WHERE genero <> 'funk';

-- j) Exibir os dados das músicas que tem curtidas maior ou igual a 20;
SELECT * FROM Musica WHERE curtidas >= 20;

-- k) Descrever os campos da tabela mostrando a atualização do campo artista;
DESCRIBE Musica;

-- l) Limpar os dados da tabela;
TRUNCATE TABLE Musica;

/*
================== Exercício 3 ==================
*/
/*
Criar a tabela chamada Filme para conter os dados: idFilme, título (tamanho 50), genero
(tamanho 40), diretor (tamanho 40), sendo que idFilme é a chave primária da tabela.
Inserir dados na tabela, procurando colocar um gênero de filme que tenha mais de um
filme, e um diretor, que tenha mais de um filme cadastrado. Procure inserir pelo menos
uns 7 filmes.
*/

USE sprint1;

CREATE TABLE Filme (
idFilme INT PRIMARY KEY AUTO_INCREMENT,
título VARCHAR(50),
genero VARCHAR(40),
diretor VARCHAR(40)
);

INSERT INTO Filme VALUES 
	(default, 'Interstellar', 'Ficção Científica', 'Cristopher Nolan'),
    (default, 'Oppenheimer', 'Drama', 'Cristopher Nolan'),
    (default, 'A Origem', 'Ficção Científica', 'Cristopher Nolan'),
    (default, 'O Cavaleiro das Trevas', 'Ação', 'Cristopher Nolan'),
    (default, 'Vingadores: Ultimato', 'Ação', 'Anthony Russo'),
    (default, 'Minions', 'Comedy', 'Pierre Coffin'),
    (default, 'Como Treinar Seu Dragão', 'Adventure', 'Dean DeBlois'),
    (default, 'Toy Story', 'Comedy', 'Andrew Stanton');

-- • Exibir todos os dados da tabela.
SELECT * FROM Filme;

-- • Adicionar o campo protagonista do tipo varchar(50) na tabela;
ALTER TABLE Filme ADD COLUMN protagonista VARCHAR(50);

-- • Atualizar o campo protagonista de todas os filmes inseridos;
UPDATE Filme SET protagonista = 'Robin hood' WHERE idFilme = 1;
UPDATE Filme SET protagonista = 'Fifth Cent' WHERE idFilme = 2;
UPDATE Filme SET protagonista = 'Eminem' WHERE idFilme = 3;
UPDATE Filme SET protagonista = 'Buzzlighter' WHERE idFilme = 4;
UPDATE Filme SET protagonista = 'Soluço' WHERE idFilme = 5;
UPDATE Filme SET protagonista = 'Chavinho' WHERE idFilme = 6;
UPDATE Filme SET protagonista = 'Canario' WHERE idFilme = 7;
UPDATE Filme SET protagonista = 'Aladin' WHERE idFilme = 8;

-- • Modificar o campo diretor do tamanho 40 para o tamanho 150;
ALTER TABLE Filme MODIFY COLUMN diretor VARCHAR(150);

-- • Atualizar o diretor do filme com id=5;
UPDATE Filme SET diretor = 'Wendel Bezerra' WHERE idFilme = 5;

-- • Atualizar o diretor dos filmes com id=2 e com o id=7;
UPDATE Filme SET diretor = 'Murilo Vogaz' WHERE idFilme IN (2,7);

-- • Atualizar o título do filme com o id=6;
UPDATE Filme SET título = 'De Volta Para o Futuro' WHERE idFilme = 6;

-- • Excluir o filme com o id=3;
DELETE FROM Filme WHERE idFilme = 3;

-- • Exibir os filmes em que o gênero é diferente de drama;
SELECT * FROM Filme WHERE genero <> 'drama';

-- • Exibir os dados dos filmes que o gênero é igual ‘suspense’;
SELECT * FROM Filme WHERE genero = 'suspense';

-- • Descrever os campos da tabela mostrando a atualização do campo protagonista e diretor;
DESCRIBE Filme;

-- • Limpar os dados da tabela;
TRUNCATE TABLE Filme;

/*
================== Exercício 4 ==================
*/

/*No MySQL Workbench, utilizando o banco de dados ‘sprint1’:
Criar a tabela chamada Professor para conter os dados: idProfessor, nome (tamanho 50),especialidade (tamanho 40), dtNasc (date), sendo que idProfessor é a chave primária databela.
Exemplo do campo data: ‘AAAA-MM-DD’ - ‘1983-10-13’.Inserir dados na tabela, procurando colocar uma especialista para mais de um professor.
Procure inserir pelo menos uns 6 professores.*/
USE sprint1;

CREATE TABLE Professor (
idProfessor INT PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(50),
especialidade VARCHAR(40),
dtNasc date);

INSERT INTO Professor VALUES 
	(default, 'Vivian', 'Banco de Dados', '2000-08-21'),
	(default, 'JP', 'Algoritimos', '2000-09-12'),
	(default, 'Mateus', 'Arquitetura Computacional', '2000-01-10'),
	(default, 'Frizza', 'Pesquisa e Inovação', '1970-08-08'),
	(default, 'Pedro', 'Banco de Dados', '2000-01-11'),
	(default, 'Fernando', 'Algoritimos', '2003-11-02'),
	(default, 'Davi', 'Arquitetura Computacional', '1999-04-30'),
	(default, 'Gerson', 'Pesquisa e Inovação', '1980-03-14');
    
-- a) Exibir todos os dados da tabela.
SELECT * FROM Professor;

-- b) Adicionar o campo funcao do tipo varchar(50), onde a função só pode ser ‘monitor’, ‘assistente’ ou ‘titular’;
ALTER TABLE Professor ADD COLUMN funcao VARCHAR(50);
ALTER TABLE Professor ADD CHECK (funcao IN ('monitor', 'assistente', 'titular'));

-- c) Atualizar os professores inseridos e suas respectivas funções;
UPDATE Professor SET funcao = 'titular' WHERE idProfessor = 1;
UPDATE Professor SET funcao = 'titular' WHERE idProfessor = 2;
UPDATE Professor SET funcao = 'titular' WHERE idProfessor = 3;
UPDATE Professor SET funcao = 'titular' WHERE idProfessor = 4;
UPDATE Professor SET funcao = 'monitor' WHERE idProfessor = 5;
UPDATE Professor SET funcao = 'monitor' WHERE idProfessor = 6;
UPDATE Professor SET funcao = 'monitor' WHERE idProfessor = 7;
UPDATE Professor SET funcao = 'monitor' WHERE idProfessor = 8;

-- d) Inserir um novo professor;
INSERT INTO Professor (nome, especialidade, dtNasc, funcao) VALUES 
	('Gerson', 'Cloud', '1980-09-21', 'titular');

-- e) Excluir o professor onde o idProfessor é igual a 5;
DELETE FROM Professor WHERE idProfessor = 5;

-- f) Exibir apenas os nomes dos professores titulares;
SELECT nome FROM Professor WHERE funcao = 'titular';

-- g) Exibir apenas as especialidades e as datas de nascimento dos professores monitores;
SELECT especialidade, dtNasc FROM Professor WHERE funcao = 'monitor';

-- h) Atualizar a data de nascimento do idProfessor igual a 3;
UPDATE Professor SET dtNasc = '1994-10-10' WHERE idProfessor = 3;

-- i) Limpar a tabela Professor;
TRUNCATE TABLE Professor;

/*
================== Exercício 5 ==================
*/

/*No MySQL Workbench, utilizando o banco de dados ‘sprint1’:
Criar a tabela chamada Curso para conter os dados: idCurso, nome (tamanho 50), sigla
(tamanho 3), coordenador, sendo que idCurso é a chave primária da tabela.
Inserir dados na tabela, procure inserir pelo menos 3 cursos.
Execute os comandos para:*/

USE sprint1;
CREATE TABLE Curso(
	idCurso INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(50),
    sigla CHAR(3) UNIQUE,
    coordenador VARCHAR(50)
);

INSERT INTO Curso(nome, sigla, coordenador) VALUES 
	('Análise e Desenvolvimento de Sistemas', 'ADS', 'Gerson'),
    ('Sistemas da Informação', 'SIS', 'Marcio'),
    ('Ciência da Computação', 'CCO', 'Marina');

-- a) Exibir todos os dados da tabela.
SELECT * FROM Curso;

-- b) Exibir apenas os coordenadores dos cursos.
SELECT coordenador FROM Curso;

-- c) Exibir apenas os dados dos cursos de uma determinada sigla.
SELECT * FROM Curso WHERE sigla = 'ADS';

-- d) Exibir os dados da tabela ordenados pelo nome do curso.
SELECT * FROM Curso ORDER BY nome;

-- e) Exibir os dados da tabela ordenados pelo nome do coordenador em ordem decrescente.
SELECT * FROM Curso ORDER BY coordenador DESC;

-- f) Exibir os dados da tabela, dos cursos cujo nome comece com uma determinada letra.
SELECT * FROM Curso WHERE nome LIKE 'A%';

-- g) Exibir os dados da tabela, dos cursos cujo nome termine com uma determinada letra.
SELECT * FROM Curso WHERE nome LIKE '%o';

-- h) Exibir os dados da tabela, dos cursos cujo nome tenha como segunda letra uma determinada letra.
SELECT * FROM Curso WHERE nome LIKE '_i%';

-- i) Exibir os dados da tabela, dos cursos cujo nome tenha como penúltima letra uma determinada letra.
SELECT * FROM Curso WHERE nome LIKE '%a_';

-- j) Elimine a tabela.
DROP TABLE Curso;

/*
================== Exercício 6 ==================
*/
/*No MySQL Workbench, utilizando o banco de dados ‘sprint1’:
Você vai criar uma tabela para armazenar os dados de revistas (como por ex: Veja, Isto é,
Epoca, Quatro Rodas, Claudia, etc).
Criar a tabela chamada Revista para conter os campos: idRevista (int e chave
primária da tabela), nome (varchar, tamanho 40), categoria (varchar, tamanho 30). Os
valores de idRevista devem iniciar com o valor 1 e ser incrementado automaticamente
pelo sistema.*/
USE sprint1;
CREATE TABLE Revista(
idRevista INT PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(40),
categoria VARCHAR(30)
); 

-- • Inserir 4 registros na tabela, mas sem informar a categoria.
INSERT INTO Revista(nome) VALUES 
	('Veja'),
    ('Exame'),
    ('Ciência Hoje das Crianças'),
    ('Turma da Mônica');

-- • Exibir todos os dados da tabela.
SELECT * FROM Revista;

-- • Atualize os dados das categorias das 3 revistas inseridas. Exibir os dados da tabela novamente para verificar se atualizou corretamente.
UPDATE Revista SET categoria = 'Notícias' WHERE idRevista = 1;
UPDATE Revista SET categoria = 'Notícias' WHERE idRevista = 2;
UPDATE Revista SET categoria = 'Ciência para crianças' WHERE idRevista = 3;
SELECT * FROM Revista;

-- • Insira mais 3 registros completos.
INSERT INTO Revista(nome, categoria) VALUES
	('Forbes', 'Economia e negócios'),
    ('Vogue', 'Moda'),
    ('Superinteressante', 'Ciência');

-- • Exibir novamente os dados da tabela.
SELECT * FROM Revista;

-- • Exibir a descrição da estrutura da tabela.
DESCRIBE Revista;

-- • Alterar a tabela para que a coluna categoria possa ter no máximo 40 caracteres.
ALTER TABLE Revista MODIFY COLUMN categoria VARCHAR(40);

-- • Exibir novamente a descrição da estrutura da tabela, para verificar se alterou o tamanho da coluna categoria
DESCRIBE Revista;

-- • Acrescentar a coluna periodicidade à tabela, que é varchar(15).
ALTER TABLE Revista ADD COLUMN periodicidade VARCHAR(15);

-- • Exibir os dados da tabela.
SELECT * FROM Revista;

-- • Excluir a coluna periodicidade da tabela.
ALTER TABLE Revista DROP COLUMN periodicidade;

/*
================== Exercício 7 ==================
*/
/*No MySQL Workbench, utilizando o banco de dados ‘sprint1’:
Você vai criar uma tabela para armazenar os dados de Carros (como por ex: Gol, Fusca, Onix, HB20, Corola, etc).
Escreva e execute os comandos para:
• Criar a tabela chamada Carro para conter os campos: idCarro (int e chave primária da tabela), nome (varchar, tamanho 40), placa (char, tamanho 7). Os valores de idCarro devem iniciar com o valor 1000 e ser incrementado automaticamente pelo sistema.
*/

USE sprint1;
CREATE TABLE Carro (
idCarro INT PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(40),
placa CHAR(7) UNIQUE
) AUTO_INCREMENT = 1000;

-- • Inserir 4 registros na tabela;
INSERT INTO Carro(nome, placa) VALUES
	('Livina', 'ENL1B35'),
    ('Tracker', 'BA123PH'),
    ('Fusion', 'ABC1234'),
    ('Camaro', 'API2P20');

-- • Exibir todos os dados da tabela.
SELECT * FROM Carro;

-- • Insira mais 3 registros sem a placa dos carros.
INSERT INTO Carro(nome) VALUES
	('Veloster'),
    ('Celta'),
    ('FIAT 147');

-- • Exibir novamente os dados da tabela.
SELECT * FROM Carro;

-- • Exibir a descrição da estrutura da tabela.
DESCRIBE Carro;

-- • Alterar a tabela para que a coluna nome possa ter no máximo 28 caracteres.
ALTER TABLE Carro MODIFY COLUMN nome VARCHAR(28);

-- • Exibir novamente a descrição da estrutura da tabela, para verificar se alterou o tamanho da coluna;
DESCRIBE Carro;

-- • Acrescentar a coluna ano à tabela, que é char(4);
ALTER TABLE Carro ADD COLUMN ano CHAR(4);

-- • Atualizar todos os dados nulos da tabela;
UPDATE Carro SET placa = 'XVA1334' WHERE idCarro = 1004;
UPDATE Carro SET placa = 'AYS1508' WHERE idCarro = 1005;
UPDATE Carro SET placa = 'CAR1L34' WHERE idCarro = 1006;
UPDATE Carro SET ano = '1999' WHERE idCarro = 1000;
UPDATE Carro SET ano = '2010' WHERE idCarro = 1001;
UPDATE Carro SET ano = '2011' WHERE idCarro = 1002;
UPDATE Carro SET ano = '2022' WHERE idCarro = 1003;
UPDATE Carro SET ano = '1987' WHERE idCarro = 1004;
UPDATE Carro SET ano = '1999' WHERE idCarro = 1005;
UPDATE Carro SET ano = '2001' WHERE idCarro = 1006;