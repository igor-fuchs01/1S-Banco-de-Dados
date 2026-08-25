-- ========================================================================== EXERCÍCIO 1 ==========================================================================

-- No MySQL Workbench, crie o banco de dados "game_store".
CREATE DATABASE game_store;
USE game_store;

/*A loja de jogos “Game Store” estava passando dificuldades de organização pois o dono Mário, um simpático senhor italiano aposentado que trabalhou com encanamento durante sua 
juventude, não tinha controle do seu estoque de jogos.
Para ajudar Mário a organizar sua loja de jogos, um estudante da SPTech propôs criar uma tabela chamada “jogo” que continha o id como número e chave primária que se 
autoincrementa, o nome do jogo com tamanho máximo de 30 caracteres, o nome do diretor do jogo com tamanho máximo de 30 caracteres, o gênero com tamanho de 30 caracteres, 
a data de lançamento, a nota do jogo (entre 0-10) e um campo para guardar a quantidade de unidades disponíveis.*/
CREATE TABLE jogo(
id INT PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(30) NOT NULL,
diretor VARCHAR(30),
genero VARCHAR(30),
dataLancamento DATE,
nota DECIMAL(4, 2),
qtdUnidade INT NOT NULL
);

-- Insira pelo menos 5 registros para a tabela.
INSERT INTO jogo(nome, diretor, genero, dataLancamento, nota, qtdUnidade) VALUES
('Minecraft', 'Jeff Bezos', 'Aventura', '1990-08-10', 10, 2000),
('Terraria', 'Adam Sandler', 'Aventura', '2000-01-20', 8, 1000),
('God of War 3', 'Cristopher Nolan', 'Ação', '2020-03-03', '5', 5000),
('Call of Duty: Modern Warfare', 'Sam Malte', 'FPS', '2022-08-23', '7', 3000),
('Brawhalla', 'Kojina', 'Luta', '2013-03-10', '9', 1500);

-- Altere a tabela para inserir uma coluna que represente o tipo de mídia que deve armazenar o tipo de jogo apenas com os valores “física” ou “digital”.
ALTER TABLE jogo ADD COLUMN tipo VARCHAR(7) CONSTRAINT chkTipo CHECK(tipo IN ('Física', 'Digital'));

-- Atualize os registros dos jogos inseridos anteriormente.
UPDATE jogo SET tipo = 'Física' WHERE id = 1;
UPDATE jogo SET tipo = 'Digital' WHERE id = 2;
UPDATE jogo SET tipo = 'Digital' WHERE id = 3;
UPDATE jogo SET tipo = 'Digital' WHERE id = 4;
UPDATE jogo SET tipo = 'Física' WHERE id = 5;

SELECT * FROM jogo;

-- Exiba apenas os jogos com data de lançamento a partir de 2015.
SELECT * FROM jogo WHERE year(dataLancamento) >= 2015;

-- Exiba os jogos que tenham a letra “a” em seu nome e são de mídia física.
SELECT * FROM jogo WHERE nome LIKE '%a%' and tipo = 'Física';

-- Exiba os jogos onde o nome do diretor não contenha a letra “e”.
SELECT * FROM jogo WHERE NOT diretor LIKE '%e%';

-- Altere a tabela para criar uma checagem na inserção da nota, onde o valor não pode ser menor que 0 e nem maior que 10.
ALTER TABLE jogo MODIFY COLUMN nota DECIMAL(4, 2) CONSTRAINT chkNota CHECK(nota >= 0 and nota <= 10);

-- Exiba os jogos de um determinado gênero e que ainda esteja em estoque.
SELECT * FROM jogo WHERE genero = 'Aventura' and qtdUnidade > 0;

-- Exclua os jogos que não têm mais unidades disponíveis em estoque.
DELETE FROM jogo WHERE qtdUnidade <= 0;

-- Renomeie a coluna “diretor” para “criador” e exiba como ficou a estrutura da tabela.
ALTER TABLE jogo RENAME COLUMN diretor TO criador;

-- ========================================================================== EXERCÍCIO 2 - Esportes Olímpicos ==========================================================================
-- No MySQL Workbench, crie o banco de dados "olimpiadas".
CREATE DATABASE olimpiadas;
USE olimpiadas;

/*Casimiro, um fã apaixonado por esportes, decidiu que queria acompanhar de perto as Olimpíadas. 
Ele pediu ajuda a um amigo para criar uma tabela que armazenasse informações sobre os esportes praticados nas Olimpíadas.
Eles criaram uma tabela chamada "esporte" que continha id como número e chave primária que se autoincrementa, nome que armazena o nome do esporte com limite de 40 caracteres, 
a categoria do esporte com limite de 20 caracteres que aceita apenas ("Individual" ou "Coletivo"), o número de jogadores que podem participar por equipe, 
estreia que armazena a data de quando o esporte estreou nas Olimpíadas e o nome do país de origem do esporte com até 30 caracteres.*/
CREATE TABLE esporte(
id INT PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(40) NOT NULL,
categoria VARCHAR(20) CONSTRAINT chkCategoria CHECK(categoria IN ('Individual', 'Coletivo')),
nmrJogador INT,
estreia DATE,
pais VARCHAR(30)
);

-- Insira pelo menos 5 registros na tabela.
INSERT INTO esporte VALUES 
	(default, 'Natação', 'Individual', 1, '2024-07-02', 'Peru'),
    (default, 'Corrida', 'Individual', 1, '2024-08-20', 'Estados Unidos'),
    (default, 'Futebol', 'Coletivo', 24, '2024-09-12', 'Brasil'),
    (default, 'Ginastica Ritmica', 'Coletivo', 6, '2024-10-03', 'Uruguai'),
    (default, 'Judô', 'Individual', 1, '2024-11-11', 'Japão');

-- Altere a tabela para adicionar uma coluna popularidade que armazene a popularidade do esporte como um valor decimal entre 0 e 10 e exiba como ficou a estrutura da tabela.
ALTER TABLE esporte ADD COLUMN popularidade DECIMAL(4, 2) CONSTRAINT chkPopularidade CHECK(popularidade >= 0 and popularidade <= 10);

-- Atualize os registros para definir a popularidade dos esportes inseridos anteriormente.
UPDATE esporte SET popularidade = 10 WHERE id = 1;
UPDATE esporte SET popularidade = 2 WHERE id = 2;
UPDATE esporte SET popularidade = 3 WHERE id = 3;
UPDATE esporte SET popularidade = 7 WHERE id = 4;
UPDATE esporte SET popularidade = 9 WHERE id = 5;

-- Exiba os esportes ordenados por popularidade em ordem crescente.
SELECT * FROM esporte ORDER BY popularidade;

-- Exiba apenas os esportes que estrearam nas Olimpíadas a partir do ano 2000.
SELECT * FROM esporte WHERE YEAR(estreia) >= 2000;

-- Crie uma checagem para que não possa ser inserido valores dentro de estreia que seja menor que 06 de abril de 1896 e depois da data atual.
ALTER TABLE esporte ADD CONSTRAINT chkEstreia CHECK(estreia >= '1896-04-06' and estreia <= '2026-08-21');

-- Altere a tabela para excluir a regra de inserção de categoria, assim podendo colocar valores além de "Individual" ou "Coletivo".
ALTER TABLE esporte DROP CONSTRAINT chkCategoria;

-- Exiba apenas os esportes cujo nome do país de origem tenha "a" na segunda letra.
SELECT * FROM esporte WHERE pais LIKE '_a%';

-- Exiba os dados onde o número de jogadores por equipe esteja entre 4 e 11.
SELECT * FROM esporte WHERE nmrJogador >= 4 and nmrJogador <= 11;

-- Remova os registros onde id seja 1, 3 e 5.
DELETE FROM esporte WHERE id IN (1, 3, 5);

/*3 – Desenhos Animados
No MySQL Workbench, crie o banco de dados "desenho".
Você foi contratado para criar um banco de dados que armazene informações detalhadas sobre desenhos animados exibidos na emissora. 
O objetivo é manter um catálogo com as seguintes informações.
Para atender a essa necessidade, você propôs a criação de uma tabela com os seguintes campos: id, um número inteiro chave primária da tabela, 
este valor deverá ser autoincrementado a partir do 10. Título, um campo de texto com tamanho de 50 caracteres que armazenará o título do desenho animado. 
A data de lançamento um campo que armazenará a data de lançamento do desenho. O nome da emissora original, um campo de texto com tamanho de 50 caracteres. 
Classificação, um campo que armazenará a classificação indicativa do desenho. Status, um campo de texto com tamanho de 15 caracteres, que armazenará o status do desenho. 
Nota, um campo que armazenará a avaliação do desenho, permitindo valores de 1 a 5.
*/
CREATE DATABASE desenho;
USE desenho;

CREATE TABLE catalogo(
	id INT PRIMARY KEY AUTO_INCREMENT,
    titulo VARCHAR(50),
    dtLancamento DATE,
    emissora VARCHAR(50),
    classificacao INT,
    statuss VARCHAR(15),
    nota DECIMAL (3, 2),
    CONSTRAINT chkNota CHECK(nota >= 1 and nota <= 5)
) AUTO_INCREMENT = 10;

INSERT INTO catalogo (titulo, dtLancamento, emissora, classificacao, statuss, nota) VALUES
	('Stranger Things', '2020-10-20', 'Netflix', 16, 'finalizado', 5),
	('Lost', '2005-04-12', 'FOX', 12, 'finalizado', 3),
	('Breaking Bad', '2010-02-13', 'Netflix', 18, 'finalizado', 4.8),
	('Loki', '2019-05-15', 'Amazon Prime', 18, 'exibindo', 4),
	('Peaky Blinders', '2018-05-02', 'Netflix', 14, 'exibindo', 3);

-- Exibir todos os dados da tabela
SELECT * FROM catalogo;

-- Exibir todos os desenhos com a classificação menor ou igual a 14 anos
SELECT * FROM catalogo WHERE classificacao <= 14;

-- Exibir todos os desenhos de uma mesma emissora original
SELECT * FROM catalogo WHERE emissora = 'FOX';

-- Modificar o campo status, para que aceite apenas o status 'exibindo', 'finalizado', 'cancelado', tente inserir algum outro valor para ver se a regra foi aplicada
ALTER TABLE catalogo ADD CONSTRAINT chkStatuss CHECK(statuss IN ('exibindo', 'finalizado', 'cancelado'));
INSERT INTO catalogo(statuss) VALUES (
	'aaaaaaa'
);

-- Modificar o status 'exibindo' para 'finalizado' de 2 desenhos pelo ID
UPDATE catalogo SET statuss = 'finalizado' WHERE statuss = 'exibindo' and id = 13;
UPDATE catalogo SET statuss = 'finalizado' WHERE statuss = 'exibindo' and id = 14;

-- Deletar a linha do desenho de ID 12
DELETE FROM catalogo WHERE id = 12;

-- Exibir apenas os desenhos que comecem com uma determinada letra
SELECT * FROM catalogo WHERE titulo LIKE 's%';

-- Renomear a coluna classificacao para classificacaoIndicativa
ALTER TABLE catalogo RENAME COLUMN classificacao TO classificacaoIndicativa;

-- Atualizar a nota e data de lançamento do desenho de ID 11
UPDATE catalogo SET nota = 5, dtLancamento = '2020-05-10' WHERE id = 11;

-- Limpe todos os dados da tabela
TRUNCATE TABLE catalogo;

-- Remover a regra do status do desenho
ALTER TABLE catalogo DROP CONSTRAINT chkStatuss;



/*4 – Despensa do Scooby-Doo
No MySQL Workbench, crie o banco de dados "estoque".
A turma do Scooby Doo percebeu que os alimentos guardados no armário estavam sumindo de forma muito rápida. 
Para ter um melhor controle, Fred propôs criar um banco de dados que registrasse os dados de entrada e saída dos alimentos do armário.
Ele criou uma tabela chamada "MisteriosSA", que possui os campos id um número inteiro chave primária, nome um campo de texto 
para armazenar o nome do produto, data da compra para armazenar a data na qual o produto foi comprado, preço valor numérico com casas decimais, 
peso um valor numérico que armazena o peso em gramas e data de retirada para armazenar a data em que o produto foi consumido.
*/
CREATE DATABASE estoque;
USE estoque;

CREATE TABLE MisteriosSA(
id INT PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(30),
dtCompra DATE,
preco DECIMAL(10, 2),
peso DECIMAL(10, 2),
dtRetirada DATE
);

-- Insira na tabela, no mínimo 5 compras de alimentos com datas diferentes. Por agora, não preencha a coluna referente a "data de retirada".
INSERT INTO MisteriosSA(nome, dtCompra, preco, peso) VALUES
('Biscoitos Scooby', '2026-03-03', 20, 10),
('Cachorro-quente', '2026-04-01', 40.90, 40),
('Biscoitos Scooby', '2026-04-20', 30, 20),
('Cachorro-quente', '2026-04-29', 25, 35),
('Biscoitos Scooby', '2026-05-10', 50, 60);

-- Verifique se os valores foram inseridos corretamente.
SELECT * FROM MisteriosSA;

-- Exiba os nomes, as datas de compra e retirada e o id dos alimentos ordenados a partir da data de compra mais antiga.
SELECT id, nome, dtCompra, dtRetirada FROM MisteriosSA ORDER BY dtCompra ASC;

-- Alguém comeu uma caixa de biscoitos, atualize a data de retirada da caixa de “Biscoitos Scooby” que foi comprada a mais tempo.
UPDATE MisteriosSA SET dtRetirada = '2026-08-22' WHERE nome = 'Biscoitos Scooby' and id = 1;

-- Altere o nome da coluna id para idComida.
ALTER TABLE MisteriosSA RENAME COLUMN id TO idComida;

-- Altere o tipo do check para que os alimentos só possam ser “Biscoitos Scooby” ou “Cachorro-quente”.
ALTER TABLE MisteriosSA ADD CONSTRAINT chkNome CHECK(nome IN ('Biscoitos Scooby', 'Cachorro-quente'));

-- Exiba os produtos onde o nome seja "Biscoitos Scooby" de forma que o nome das colunas dataCompra apareça como "data da compra" e dataRetirada apareça como "data da retirada".
SELECT nome, dtCompra AS 'data da compra', preco, peso, dtRetirada as 'data da retirada' FROM MisteriosSA;

-- Exiba os alimentos que foram comprados antes do dia 25 de julho de 2024.
SELECT * FROM MisteriosSA WHERE dtCompra <= '2024-07-25';

-- Exiba os alimentos que possuem um preço acima ou igual a 30.50.
SELECT * FROM MisteriosSA WHERE preco >= 30.50;

-- Limpe a tabela.
TRUNCATE TABLE MisteriosSA;

/*5 – Heróis
No MySQL Workbench, crie o banco de dados “vingadores”.
Crie uma tabela chamada “heroi”, onde terá um campo de nome contendo até 45 caracteres. 
O seu herói poderá ter uma versao, onde será armazenado o filme de sua escolha, esse campo aceitará até 45 caracteres. 
Todo herói, tem uma habilidade que se destaca entre os outros super-heróis. Todo herói tem uma altura, esse campo aceitará valores inteiros representando centímetros. 
O id deverá se autoincrementar.
*/
CREATE DATABASE vingadores;
USE vingadores;

CREATE TABLE heroi(
id INT PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(45),
versao VARCHAR(45),
habilidade VARCHAR(45),
altura INT
);

-- Insira 5 heróis para derrotar o vilão Doutor Destino.
INSERT INTO heroi (nome, versao, habilidade, altura) VALUES
	('Homem de Ferro', 'Vingadores - Ultimato', 'Inteligência e Dinheiro', 175),
	('Capitão América', 'Vingadores - Ultimato', 'Força e resistência', 191),
	('Thor', 'Vingadores - Guerra Infinita', 'Força e Controlar Trovão', 178),
	('Vanda', 'Vingadores - Ultimato', 'Magia', 168),
	('Homem Formiga', 'Vingadores - Guerra Civil', 'Aumentar e diminuir de tamanho', 180);

-- Exiba os dados inseridos na tabela
SELECT * FROM heroi;

-- Adicione um campo de regeneração, onde ele aceitará apenas os valores booleanos de TRUE ou FALSE.
ALTER TABLE heroi ADD COLUMN regeneracao BOOLEAN;

-- Modifique o campo versão para aceitar até 100 caracteres.
ALTER TABLE heroi MODIFY COLUMN versao VARCHAR(100);

-- Remova o herói de id 3 pois ele se morreu em batalha.
DELETE FROM heroi WHERE id = 3;

-- Chegou reforços, insira um novo herói para a equipe.
INSERT INTO heroi(nome, versao, habilidade, altura, regeneracao) VALUES
	('Wolverine', 'XMEN 3', 'Regeneração e Garras', 179, TRUE);

-- Exiba todos os dados inseridos na tabela onde o nome do herói começa com “C” ou “H”.
SELECT * FROM heroi WHERE nome LIKE 'C%' or nome LIKE 'H%';

-- Exiba todos os dados inseridos na tabela onde o nome do herói não contém a letra “A” no campo nome.
SELECT * FROM heroi WHERE nome NOT LIKE '%a%';

-- Exiba apenas o nome do herói onde a altura for maior que 190.
SELECT * FROM heroi WHERE altura > 190;

-- Exiba todos os dados da tabela de forma decrescente pelo nome onde a altura do herói for maior que 180.
SELECT * FROM heroi WHERE altura > 180 ORDER BY nome DESC;

-- Limpe os dados da tabela.
TRUNCATE TABLE heroi;