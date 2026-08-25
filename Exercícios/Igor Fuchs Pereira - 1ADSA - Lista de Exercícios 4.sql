/*Uma loja de roupas chamada FashionStore precisa criar um banco de dados para armazenar informações sobre os produtos disponíveis para venda.

Crie uma tabela chamada produto com os seguintes campos:

Campo	Tipo de Dado	Descrição
id	INT (PK)	Identificador único do produto
nome	VARCHAR(100)	Nome do produto
categoria	VARCHAR(50)	Categoria do produto (ex: Camiseta, Calça)
preco	DECIMAL(10,2)	Preço do produto
tamanho	VARCHAR(5)	Tamanho (P, M, G, GG) – use CHECK
data_cadastro	DATETIME	Data e hora em que o produto foi cadastrado
disponivel	TINYINT	Se o produto está disponível para venda, sendo 0 para não disponível e 1 para disponível
1. Comandos*/
CREATE DATABASE FashionStore; 	
USE FashionStore;

-- Criação da Tabela
CREATE TABLE produto(
id INT PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(100) NOT NULL,
categoria VARCHAR(50),
preco DECIMAL(10,2),
tamanho VARCHAR(5),
CONSTRAINT chkTamanho CHECK(tamanho IN ('P', 'M', 'G', 'GG')),
data_cadastro DATETIME,
disponivel TINYINT,
CONSTRAINT chkDisponivel CHECK(disponivel IN (0,1))
);

-- Inserção de Dados
-- Insira pelo menos 6 produtos variados, com diferentes categorias, tamanhos, datas e disponibilidade.
INSERT INTO produto(nome, categoria, preco, tamanho, data_cadastro, disponivel) VALUES 
	('Camiseta Básica', 'Camiseta', 39.90, 'M', '2025-01-15 10:30:00', 1),
	('Calça Jeans Slim', 'Calça', 129.90, 'G', '2026-02-10 14:00:00', 1),
	('Jaqueta Corta-Vento', 'Blusa', 199.50, 'GG', '2025-03-05 09:15:00', 0),
	('Regata Esportiva', 'Vestuário', 29.90, 'P', '2025-03-20 16:45:00', 1),
	('Moletom com Capuz', 'Vestuário', NULL, 'GG', '2025-04-01 11:00:00', 1),
	('Short Tactel', 'Vestuário', NULL, 'M', '2026-04-18 13:20:00', 0);

-- Consultas
-- Agora, escreva as consultas SQL para responder às perguntas abaixo:
SELECT * FROM produto;

-- Listar os produtos que contenham a palavra "Camiseta" no nome.
SELECT * FROM produto WHERE nome LIKE '%camiseta%';

-- Listar os produtos que não sejam do tamanho 'M'.
SELECT * FROM produto WHERE tamanho != 'M';

-- Exibir apenas os produtos cadastrados depois de 18 de agosto de 2025.
SELECT * FROM produto WHERE data_cadastro >= '2025-08-18';

-- Listar os produtos disponíveis cuja categoria seja "Camiseta" ou "Blusa".
SELECT * FROM produto WHERE disponivel = 1 and (categoria LIKE '%camiseta%' or categoria LIKE '%blusa%');

-- Exibir o nome do produto concatenado com seu preço, com o alias 'produto_preco'.
SELECT concat('O produto com o nome ', IFNULL(nome, 'NONAME'), ' terá o valor de R$', IFNULL(preco, 'NÃO TEM PREÇO')) AS produto_preco FROM produto;

-- Listar os produtos cujo nome NÃO contenha a palavra "Blusa".
SELECT * FROM produto WHERE nome NOT LIKE '%camiseta%';

-- Listar todos os produtos com uma coluna adicional chamada 'status' que mostre "Disponível" se disponivel = 1 e "Indisponível" caso contrário.
SELECT *,
CASE
	WHEN disponivel = 1 THEN 'Disponível'
    ELSE 'Indisponível'
END AS 'status' FROM produto;

-- Liste os produtos da categoria "Calça" com preço maior que 100 reais.
SELECT * FROM produto WHERE categoria LIKE '%Vestuário%' and preco > 100;

-- Liste os produtos com nome que não contenha a palavra "Camiseta".

-- Exiba os produtos cujo id seja 1, 3 ou 5.
SELECT * FROM produto WHERE id IN (1, 3, 5);

-- Liste os produtos com tamanho diferente de 'P' e 'M'.

-- Liste os produtos cadastrados antes de 18 de agosto de 2025.

-- Liste o nome e preço de todos os produtos, com um alias chamado produto_valor.
SELECT nome, preco FROM produto;

-- Mostre todos os produtos com uma coluna chamada info_completa que junte nome, categoria e preço.
SELECT concat('Este é o nome do produto "', nome, '" essa é a categoria "', ifnull(categoria, 'SEM CATEGORIA'), '" com o valor de "', ifnull(preco, 'SEM PRECO')) as info_completa FROM produto;

-- Mostre os produtos que estão disponíveis e têm tamanho 'M'.

-- Liste os produtos com nomes que começam com a letra 'C'.

-- Atualize o preço da "Jaqueta Couro" para 270.00.

-- Marque como indisponível todos os produtos da categoria "Blusa".
SELECT nome, disponivel, 0 as disponivel FROM produto;

-- Atualize o campo tamanho para 'M' nos produtos com nome que contenha "Short".
UPDATE produto SET tamanho = 'M' WHERE nome LIKE '%short%';
-- SET sql_safe_updates = 1;

-- Atualize a categoria para "Camiseta" em todos os produtos cujo nome contenha "Camiseta".

-- Marque como disponível todos os produtos cadastrados após 20 de agosto de 2025.

-- Aumente em 5% o preço dos produtos com preço inferior a 100 reais.
UPDATE produto SET preco = (preco * 1.05) WHERE preco < 100;
SELECT * FROM produto WHERE preco < 100;
SET sql_safe_updates = 0;

-- Atualize o nome do produto de id 4 para "Short Esportivo Unissex".

-- Marque como indisponíveis os produtos com nome que contenha "Blusa" ou "Moletom".

-- Atualize a data de cadastro de todos os produtos da categoria "Camiseta" para a data atual.

-- Insira mais 6 produtos

-- Exiba os produtos com categoria igual a "Jaqueta" e que não estejam disponíveis.
SELECT * FROM produto WHERE categoria = 'Vestuário' and disponivel = 0;

-- Liste os produtos com tamanho 'GG' ou 'P', ordenados pelo preço decrescente.

-- Mostre apenas o nome e o tamanho dos produtos cadastrados no mês de agosto de 2025.

-- Exiba os produtos com nomes terminando em "a".

-- Exiba os produtos cuja categoria não esteja entre "Camiseta", "Calça" e "Short".

-- Mostre os produtos com preço entre R$ 50,00 e R$ 150,00, com alias para nome e preço.

-- Exiba todos os produtos e adicione uma coluna chamada info que junte nome e categoria com hífen.

-- Mostre os produtos que estão indisponíveis com uma coluna status que diga "Em falta".

-- Liste todos os produtos cujo nome tenha 2 palavras (dica: um espaço).
SELECT * FROM produto WHERE nome LIKE '%Jaqueta%';

-- Exiba os produtos cujo nome não contenha a palavra "Blusa", que tenham tamanho 'M' ou 'G', estejam disponíveis, tenham sido cadastrados após 15 de agosto de 2025, e mostre:
-- O nome como nome_produto
-- O preço como preco_atual
-- A data de cadastro
-- Uma coluna chamada descricao concatenando nome, categoria e preço
-- Uma coluna status_disponibilidade usando CASE para mostrar "Disponível" ou "Indisponível"

SELECT nome as nome_produto, preco as preco_atual, data_cadastro, concat(nome, ' + ', categoria, ' + ', preco) as descricao,
CASE
	WHEN disponivel = 1 THEN 'Disponível'
    ELSE 'Indisponível'
END AS status_disponibilidade FROM produto WHERE nome NOT LIKE '%blusa%' and tamanho IN ('M', 'G') and data_cadastro > '2025-08-15';