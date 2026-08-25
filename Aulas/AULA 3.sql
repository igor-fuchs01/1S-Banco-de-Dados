USE sprint1;

CREATE TABLE sensor(
id INT PRIMARY KEY AUTO_INCREMENT,
tipo VARCHAR(50) DEFAULT('DH11'),
temperaturaIdeal FLOAT NOT NULL,
locall VARCHAR(20) UNIQUE,
statuss VARCHAR(40),
CONSTRAINT chkStatus CHECK(statuss IN ('Ativo', 'Inativo')),
dataHora DATETIME DEFAULT CURRENT_TIMESTAMP
) AUTO_INCREMENT = 1000;

INSERT INTO sensor VALUES
	(default, 'LM35', 29.2, 'Quadrante A', 'Ativo', '2026-08-18 10:47:00');

INSERT INTO sensor (temperaturaIdeal, locall, statuss) VALUES
	(25.4, 'Quadrante B', 'Inativo'),
	(23.4, 'Quadrante C', 'Ativo');
    
SELECT * FROM sensor;

-- O COMANDO ABAIXO DARÁ ERRO DE CONSTRAINT
INSERT INTO sensor (temperaturaIDeal, statuss) VALUES
	(19.0, 'Em manutenção');

ALTER TABLE sensor DROP CONSTRAINT chkstatus;

ALTER TABLE sensor ADD CONSTRAINT chkStatuss
	CHECK (statuss IN ('Ativo', 'Inativo', 'Em manutenção'));

UPDATE sensor SET tipo = 'DHT11' WHERE id IN (1001, 1002);

-- ALIAS - APELIDO
SELECT tipo AS 'Qualquer Coisa' FROM sensor;
SELECT tipo AS QualquerCoisa FROM sensor;

-- CONCAT - CONCATENAR
SELECT CONCAT('O tipo do sensor é ', tipo,' e o seu status é ', statuss) AS Frase FROM sensor;

-- INSERINDO STATUS NULO
INSERT INTO sensor(temperaturaIdeal) VALUES
	(19.3);
    
SELECT * FROM sensor;

-- IFNULL - SE NULO
SELECT IFNULL(statuss, 'Não preenchido') FROM sensor;
SELECT CONCAT('O tipo do sensor é ', IFNULL(tipo, 'Sensor não preenchido'),' e o seu status é ', IFNULL(statuss, 'Status não preenchido')) AS Frase FROM sensor;

-- CONDIÇÃO - CASE
SELECT CASE
	WHEN temperaturaIdeal > 23.4 THEN 'Temperatual Alta'
    WHEN temperaturaIdeal = 23.4 THEN 'Temperatura Ideal'
    ELSE 'Temperatura não tratada'
END AS Temperatura
FROM SENSOR;

SELECT * FROM sensor;

-- CONFIGURAR DATA
SELECT date_format(dataHora, '%d/%m/%y %H:%i') FROM sensor;

/*
DDL -> Comandos atrelados a alteração, criação, definição etc da tabela 
DML -> Manipulação de dados
DQL -> Select
DCL -> Controle e permissão de usuários
*/