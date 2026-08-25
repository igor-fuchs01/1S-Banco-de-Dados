/*
================== Exercício 1 ==================
*/
USE sprint1;

/*
Criar a tabela chamada Atleta para conter os dados: idAtleta (int e chave primária da
tabela), nome (varchar, tamanho 40), modalidade (varchar, tamanho 40), qtdMedalha
(int, representando a quantidade de medalhas que o atleta possui)
*/
CREATE TABLE Atleta (idAtleta INT PRIMARY KEY, 
nome VARCHAR(40), 
modalidade VARCHAR(40), 
qtdMedalha INT);

INSERT INTO Atleta VALUES
	(1, 'Josvaldo', 'Natação', 0),
    (2, 'Nidosvaldo', 'Natação', 0),
    (3, 'Joaquim', 'Futebol', 0),
    (4, 'Neymar', 'Futebol', 20),
    (5, 'Alice', 'Corrida', 1),
    (6, 'Carlos', 'Corrida', 2),
    (7, 'Fernando', 'Corrida', 8),
    (8, 'Felps', 'Natação', 10),
    (9, 'Haaland', 'Futebol', 8),
    (10, 'Usain Bolt', 'Corrida', 10);
    
-- Exibir todos os dados da tabela.
SELECT * FROM Atleta;

-- Exibir apenas os nomes e quantidade de medalhas dos atletas.
SELECT nome, qtdMedalha FROM Atleta;

-- Exibir apenas os dados dos atletas de uma determinada modalidade.
SELECT * FROM Atleta WHERE modalidade = 'Corrida';

-- Exibir os dados da tabela ordenados pela modalidade.
SELECT * FROM Atleta ORDER BY modalidade;

-- Exibir os dados da tabela, ordenados pela quantidade de medalhas, em ordem decrescente.
SELECT * FROM Atleta ORDER BY qtdMedalha DESC;

-- Exibir os dados da tabela, dos atletas cujo nome contenha a letra s
SELECT * FROM Atleta WHERE nome LIKE '%s%';

-- Exibir os dados da tabela, dos atletas cujo nome comece com uma determinada letra.
SELECT * FROM Atleta WHERE nome LIKE 'n%';

-- Exibir os dados da tabela, dos atletas cujo nome termine com a letra o.
SELECT * FROM Atleta WHERE nome LIKE '%o';

-- Exibir os dados da tabela, dos atletas cujo nome tenha a penúltima letra r.
SELECT * FROM Atleta WHERE nome LIKE '%r_';

-- Eliminar a tabela.
DROP TABLE Atleta;

/*
================== Exercício 2 ==================
*/

USE sprint1;

/*
Criar a tabela chamada Musica para conter os dados: idMusica, titulo (tamanho 40), artista
(tamanho 40), genero (tamanho 40), sendo que idMusica é a chave primária da tabela.
Inserir dados na tabela, procurando colocar um gênero de música que tenha mais de uma
música, e um artista, que tenha mais de uma música cadastrada. Procure inserir pelo
menos umas 7 músicas.
*/

CREATE TABLE Musica (
idMusica INT PRIMARY KEY,
titulo VARCHAR(40),
artista VARCHAR(40),
genero VARCHAR(40)
);

-- Inserir pelo menos 7 músicas
INSERT INTO Musica VALUES 
	(1, 'Hail to the King', 'Avenged Sevenfold', 'Heavy Metal'),
	(2, 'In The End', 'Linkin Park', 'Rock'),
	(3, 'Serpentine', 'Disturbed', 'Heavy Metal'),
	(4, 'A Horse With No Name', 'American', 'Rock'),
	(5, 'Is This Love', 'Bob Marley', 'Reggae'),
	(6, 'Súplica Cearense', 'O Rappa', 'Reggae-Rock'),
	(7, 'My Demons', 'Starset', 'Rock'),
	(8, 'On My Own', 'Three Days Grace', 'Hard Rock'),
	(9, 'Simple Man', 'Lynyrd Skynyrd', 'Rock'),
	(10, 'Lose Yourself', 'Eminem', 'Rap');

-- a) Exibir todos os dados da tabela.
SELECT * FROM Musica;

-- b) Exibir apenas os títulos e os artistas das músicas.
SELECT titulo, artista FROM Musica;

-- c) Exibir apenas os dados das músicas de um determinado gênero.
SELECT * FROM Musica WHERE genero = 'Rock';

-- d) Exibir apenas os dados das músicas de um determinado artista.
SELECT * FROM Musica WHERE artista = 'Linkin Park';

-- e) Exibir os dados da tabela ordenados pelo título da música.
SELECT * FROM Musica ORDER BY titulo;

-- f) Exibir os dados da tabela ordenados pelo artista em ordem decrescente.
SELECT * FROM Musica ORDER BY artista DESC;

-- g) Exibir os dados da tabela, das músicas cujo título comece com uma determinada letra.
SELECT * FROM Musica WHERE titulo LIKE 'I%';

-- h) Exibir os dados da tabela, das músicas cujo artista termine com uma determinada letra.
SELECT * FROM Musica WHERE artista LIKE '%d';

-- i) Exibir os dados da tabela, das músicas cujo gênero tenha como segunda letra uma determinada letra.
SELECT * FROM Musica WHERE genero LIKE '_e%';

-- j) Exibir os dados da tabela, das músicas cujo título tenha como penúltima letra uma determinada letra.
SELECT * FROM Musica WHERE titulo LIKE '%n_';

-- k) Elimine a tabela.
DROP TABLE Musica;

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
idFilme INT PRIMARY KEY,
título VARCHAR(50),
genero VARCHAR(40),
diretor VARCHAR(40)
);

INSERT INTO Filme VALUES 
	(1, 'Interstellar', 'Ficção Científica', 'Cristopher Nolan'),
    (2, 'Oppenheimer', 'Drama', 'Cristopher Nolan'),
    (3, 'A Origem', 'Ficção Científica', 'Cristopher Nolan'),
    (4, 'O Cavaleiro das Trevas', 'Ação', 'Cristopher Nolan'),
    (5, 'Vingadores: Ultimato', 'Ação', 'Anthony Russo'),
    (6, 'Minions', 'Comedy', 'Pierre Coffin'),
    (7, 'Como Treinar Seu Dragão', 'Adventure', 'Dean DeBlois'),
    (8, 'Toy Story', 'Comedy', 'Andrew Stanton');

-- Exibir todos os dados da tabela.
SELECT * FROM Filme;

-- Exibir apenas os títulos e os diretores dos filmes.
SELECT título, diretor FROM Filme;

-- Exibir apenas os dados dos filmes de um determinado gênero.
SELECT * FROM Filme WHERE genero = 'Ficção Cientifíca';

-- Exibir apenas os dados dos filmes de um determinado diretor.
SELECT * FROM Filme WHERE diretor = 'Cristopher Nolan';

-- Exibir os dados da tabela ordenados pelo título do filme.
SELECT * FROM Filme ORDER BY título;

-- Exibir os dados da tabela ordenados pelo diretor em ordem decrescente.
SELECT * FROM Filme ORDER BY diretor DESC;

-- Exibir os dados da tabela, dos filmes cujo título comece com uma determinada letra.
SELECT * FROM Filme WHERE título LIKE 'O%';

-- Exibir os dados da tabela, dos filmes cujo diretor termine com uma determinada letra.
SELECT * FROM Filme WHERE diretor LIKE '%n';

-- Exibir os dados da tabela, dos filmes cujo gênero tenha como segunda letra uma determinada letra.
SELECT * FROM Filme WHERE genero LIKE '_o%';

-- Exibir os dados da tabela, dos filmes cujo título tenha como penúltima letra uma determinada letra.
SELECT * FROM Filme WHERE título LIKE '%a_';

-- Elimine a tabela.
DROP TABLE Filme;

/*
================== Exercício 4 ==================
*/

/*No MySQL Workbench, utilizando o banco de dados ‘sprint1’:
Criar a tabela chamada Professor para conter os dados: idProfessor, nome (tamanho 50),especialidade (tamanho 40), dtNasc (date), sendo que idProfessor é a chave primária databela.
Exemplo do campo data: ‘AAAA-MM-DD’ - ‘1983-10-13’.Inserir dados na tabela, procurando colocar uma especialista para mais de um professor.
Procure inserir pelo menos uns 6 professores.*/
USE sprint1;

CREATE TABLE Professor (
idProfessor INT PRIMARY KEY,
nome VARCHAR(50),
especialidade VARCHAR(40),
dtNasc date);

INSERT INTO Professor VALUES 
	(1, 'Vivian', 'Banco de Dados', '2000-08-21'),
	(2, 'JP', 'Algoritimos', '2000-09-12'),
	(3, 'Mateus', 'Arquitetura Computacional', '2000-01-10'),
	(4, 'Frizza', 'Pesquisa e Inovação', '1970-08-08'),
	(5, 'Pedro', 'Banco de Dados', '2000-01-11'),
	(6, 'Fernando', 'Algoritimos', '2003-11-02'),
	(7, 'Davi', 'Arquitetura Computacional', '1999-04-30'),
	(8, 'Gerson', 'Pesquisa e Inovação', '1980-03-14');

-- a) Exibir todos os dados da tabela.
SELECT * FROM Professor;

-- b) Exibir apenas as especialidades dos professores.
SELECT especialidade FROM Professor;

-- c) Exibir apenas os dados dos professores de uma determinada especialidade.
SELECT * FROM Professor WHERE especialidade = 'Banco de Dados';

-- d) Exibir os dados da tabela ordenados pelo nome do professor.
SELECT * FROM Professor ORDER BY nome;

-- e) Exibir os dados da tabela ordenados pela data de nascimento do professor em ordem decrescente.
SELECT * FROM Professor ORDER BY dtNasc DESC;

-- f) Exibir os dados da tabela, dos professores cujo nome comece com uma determinada letra.
SELECT * FROM Professor WHERE nome LIKE 'M%';

-- g) Exibir os dados da tabela, dos professores cujo nome termine com uma determinada letra.
SELECT * FROM Professor WHERE nome LIKE '%n';

-- h) Exibir os dados da tabela, dos professores cujo nome tenha como segunda letra uma determinada letra.
SELECT * FROM Professor WHERE nome LIKE '_a%';

-- i) Exibir os dados da tabela, dos professores cujo nome tenha como penúltima letra uma determinada letra.
SELECT * FROM Professor WHERE nome LIKE '%a_';

-- j) Elimine a tabela.
DROP TABLE Professor;

/*
================== Exercício 5 ==================
*/

/*
No MySQL Workbench, utilizando o banco de dados ‘sprint1’:
Criar a tabela chamada Jogo para conter os dados: idJogo, nome (tamanho 50), comentario (tamanho 200), ranking (número inteiro), sendo que idJogo é a chave primária da tabela.
*/

USE sprint1;

CREATE TABLE Jogo (
idJogo INT PRIMARY KEY,
nome VARCHAR(50),
comentario VARCHAR(200),
ranking INT
);

INSERT INTO Jogo VALUES 
(1, 'Minecraft', 'Excelente jogo e bem quadrado', 3),
(2, 'Palworld', 'O jogo que proporciona similar de pokemons', 1),
(3, 'Terraria', 'Uma obra prima para jogar com os amigos, o famoso minecraft 2D', 2),
(4, 'CS2', 'Um jogo de tiro excelente, eles têm a melhor comunidade existente', 6),
(5, '9 Kings', 'Um jogo de cartas brasileiro da qual você ter que defender seu reino', 5),
(6, 'Elden Ring', 'O melhor souls like já criado, um cavaleiro que pode derrotar inúmeros monstros', 4),
(7, 'Clash Royale', 'Já foi um dos melhores jogos para mobile, hoje em dia está muito complexo', 8),
(8, 'Clash Of Clans', 'Um jogo mobile que da saudades, o melhor gerenciador de vilas existente', 7);

-- a) Exibir todos os dados da tabela.
SELECT * FROM Jogo;

-- b) Exibir apenas os nomes dos jogos.
SELECT nome FROM Jogo;

-- c) Exibir apenas o comentário de um determinado jogo.
SELECT comentario FROM Jogo WHERE nome = 'Elden Ring';

-- d) Exibir os dados da tabela ordenados pelo nome do jogo.
SELECT * FROM Jogo ORDER BY nome;

-- e) Exibir os dados da tabela ordenados pelo ranking em ordem decrescente.
SELECT * FROM Jogo ORDER BY ranking DESC;

-- f) Exibir os dados da tabela, dos jogos cujo nome comece com uma determinada letra.
SELECT * FROM Jogo WHERE nome LIKE 'C%';

-- g) Exibir os dados da tabela, dos jogos cujo nome termine com uma determinada letra.
SELECT * FROM Jogo WHERE nome LIKE '%s';

-- h) Exibir os dados da tabela, dos jogos cujo nome tenha como segunda letra uma determinada letra.
SELECT * FROM Jogo WHERE nome LIKE '_i%';

-- i) Exibir os dados da tabela, dos jogos cujo nome tenha como penúltima letra uma determinada letra.
SELECT * FROM Jogo WHERE nome LIKE '%n_';

-- j) Exibir os dados da tabela, dos jogos cujo nome seja diferente de Minecraft.
SELECT * FROM Jogo WHERE nome != 'Minecraft';

-- k) Elimine a tabela.
DROP TABLE Jogo;