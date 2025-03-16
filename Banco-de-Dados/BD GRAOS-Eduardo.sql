create database graos;
use graos;

-- TABELA 1 CADASTRO/LOGIN
CREATE TABLE login (
	idEmpresa INT primary key auto_increment,
    nomeEmpresa varchar(50),
    -- nomeUsuario varchar(50),
    senha varchar(50),
    cnpj char(14) unique,
    email varchar(50) unique,
    dtRegistro datetime default current_timestamp,
    UFestado char(2),
    cidade varchar(30),
    cep char(8)
    -- nvlAcesso varchar(10),
    -- constraint chkNvlAcesso check (nvlAcesso in('admin','user'))
);
INSERT INTO login (nomeEmpresa, senha, cnpj, email, UFestado, cidade, cep) VALUES 
	('SoftWave', 'minhaSenha123', '75111946000124', 'pedro.almeida@email.com', 'RS', 'Porto Alegre', '90000000'),  
	('CodeMasters', 'seguranca456', '37281060000130', 'larissa.fonseca@email.com', 'SC', 'Florianópolis', '88000000'),  
	('CyberNet', 'andre789', '06762026000153', 'andre.luiz@email.com', 'PR', 'Curitiba', '80000000'),  
	('NextGenTech', 'nextGenPass', '09491417000179', 'susana.martins@email.com', 'BA', 'Salvador', '40000000'),  
	('InovaSoft', 'marcosSenha', '94163378000150', 'marcos.lima@email.com', 'PE', 'Recife', '50000000');

UPDATE login SET nomeEmpresa = 'SojaPlus' WHERE idEmpresa = 2;
DELETE FROM login WHERE idEmpresa = 5;
SELECT * FROM login;

ALTER TABLE login DROP COLUMN nomeUsuario, DROP COLUMN nvlAcesso, DROP CONSTRAINT chkNvlAcesso;

-- TABELA X FUNCIONARIOS
-- TABELA 2 DADOS DO SENSOR/ARMAZEM
CREATE TABLE sensor(
	idSensor int primary key auto_increment,
		/* numSerie varchar(10) unique,
		statusSensor varchar(10),
		constraint chkStatusSensor check(statusSensor in('Novo', 'Modificado'),
		descricaoModificacao varchar(500),
		dtModificacao date, */
    umidade decimal(4,2),
    temperatura decimal(4,2),
    nomeArmazem varchar(30),
    dataInfo datetime default current_timestamp,
    dtInstalacao datetime
);
INSERT INTO sensor (umidade, temperatura, nomeArmazem, dtInstalacao)  
VALUES  
(45.30, 22.50, 'Armazem Norte', '2024-12-01 08:30:00'),  
(50.75, 24.10, 'Armazem Sul', '2024-11-15 10:45:00'),  
(38.60, 21.80, 'Armazem Leste', '2025-01-05 14:20:00'),  
(55.20, 26.30, 'Armazem Oeste', '2024-10-10 07:10:00'),  
(42.90, 23.70, 'Armazem Central', '2024-09-25 12:00:00');

UPDATE sensor SET dtInstalacao = '2025-02-12' WHERE idSensor = 4;
DELETE FROM sensor WHERE idSensor = 5;
SELECT concat('O sensor ', idSensor, ' registrou uma umidade relativa no ar de ', umidade, '% e uma temperatura de ', temperatura,
 '°C no ', nomeArmazem, ' no dia ', date_format(dataInfo, ' %d/%m/%y %H:%m')) as 'Registros' FROM sensor;
SELECT * FROM sensor;
	
-- TABELA 3 DADOS DOS GRAOS - INFOS TECNICAS
CREATE TABLE grao (
	idGrao INT PRIMARY KEY AUTO_INCREMENT,
    nomeArmazem VARCHAR(20),
    maxUmidade DECIMAL(4,2),
    minUmidade DECIMAL(4,2), -- UMIDADE RELATIVA; %
    temperaturaMax DECIMAL(4,2),
    temperaturaMin DECIMAL(4,2)
);  
INSERT INTO grao (nomeGrao, maxUmidade, minUmidade, temperaturaMax, temperaturaMin)  
VALUES  
('Soja', 13.00, 11.00, 28.00, 12.00);

ALTER TABLE grao RENAME COLUMN idGrao to idArmazem;
SELECT concat(maxUmidade, '%') AS 'Umidade maxima' FROM grao;
UPDATE grao SET minUmidade = 9 WHERE idGrao = 2;
DELETE FROM grao WHERE idGrao IN(5, 4, 3, 1);
SELECT * FROM grao;