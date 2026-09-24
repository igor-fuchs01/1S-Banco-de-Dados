USE sprint2;

CREATE TABLE funcionario (
idFuncionario INT primary key auto_increment,
nome varchar(45),
areaFuncionario varchar(45),
salario decimal(10,2),
fkSupervisor INT,
constraint fkFuncionarioSupervisor 
	foreign key (fkSupervisor) 
		REFERENCES funcionario(idFuncionario)
);

INSERT INTO funcionario(nome, salario, fkSupervisor) VALUES 
('Brandão', 100.00, null),
('Vivian', 99.00, 1),
('Matheus', 96, 1),
('Pedro', 101.00, 2);

select * from funcionario;

SELECT * FROM funcionario JOIN funcionario as supervisor ON funcionario.fkSupervisor = supervisor.idFuncionario; 

SELECT funcionario.nome as NomeFunc, supervisor.nome as NomeSuper FROM funcionario 
	left join funcionario as Supervisor on funcionario.fkSupervisor = Supervisor.idFuncionario;
    
CREATE TABLE dependente (
idDependente INT,
fkFuncionario INT,
CONSTRAINT pkCompost primary key (idDependente, fkFuncionario),
nome varchar(45),
parentesco varchar(45),
CONSTRAINT fkDepFunc foreign key (fkFuncionario) REFERENCES funcionario(idFuncionario)
);

INSERT INTO dependente VALUES
(1, 2, 'Cintia', 'namorada'),
(1, 3, 'Lola', 'pet'),
(2, 3, 'Sebastian', 'pet'),
(1, 4, 'Eliane', 'Mãe');

SELECT funcionario.nome as Func,
	dependente.nome as Dependente
	from funcionario LEFT JOIN dependente
	on idFuncionario = fkFuncionario;
    
SELECT funcionario.nome as Func,
	dependente.nome as Dependente
	from funcionario LEFT JOIN dependente
		on idFuncionario = fkFuncionario;
        
SELECT funcionario.nome as Func,
	dependente.nome as Dependente,
    supervisor.nome as Supervisor
	from funcionario JOIN dependente
		on idFuncionario = fkFuncionario 
			join funcionario as supervisor 
            on supervisor.idFuncionario = funcionario.fkSupervisor
            order by funcionario.idFuncionario;
 
-- 
SELECT funcionario.nome as Func,
	dependente.nome as Dependente
	from funcionario LEFT JOIN dependente
		on idFuncionario = fkFuncionario 
			WHERE dependente.nome is null;