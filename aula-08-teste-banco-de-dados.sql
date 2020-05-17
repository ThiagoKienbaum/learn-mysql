CREATE DATABASE sistema;
USE sistema;

CREATE TABLE cadastro_cidade (
	codigo INT(2) AUTO_INCREMENT NOT NULL,
    nome VARCHAR(30) NOT NULL,
	uf VARCHAR(2) NOT NULL,
    PRIMARY KEY (codigo)
);

SHOW TABLES;

INSERT INTO cadastro_cidade (nome, uf) VALUES ('Curitiba', 'PR');
INSERT INTO cadastro_cidade (nome, uf) VALUES ('Rio de Janeiro', 'RJ');
INSERT INTO cadastro_cidade (nome, uf) VALUES ('Ponta Grossa', 'PR');
INSERT INTO cadastro_cidade (nome, uf) VALUES ('São Paulo', 'SP');
INSERT INTO cadastro_cidade (nome, uf) VALUES ('Ribeirão', 'SP');

ALTER TABLE cadastro_cidade RENAME cidade;
UPDATE cidade SET nome = 'São Paulo' WHERE codigo = 4;

SELECT * FROM cidade;
DESCRIBE cidade;

SELECT * FROM cidade;
SELECT * FROM cidade WHERE uf = 'SP';
DELETE FROM cidade WHERE codigo = 6;

INSERT INTO cidade (codigo, nome, uf) VALUES (6, 'Rio de Janeiro', 'RJ');
SELECT COUNT(*) AS 'Quantidade de Cidades' FROM cidade;

CREATE TABLE funcionario (
	codigo INT(3) AUTO_INCREMENT NOT NULL,
    nome VARCHAR(30) NOT NULL,
    endereco VARCHAR(40) NOT NULL,
    numero INT(6) NOT NULL,
    salario DECIMAL(6,2) NOT NULL,
    codigo_cidade INT(2) NOT NULL,
    PRIMARY KEY(codigo)
);

ALTER TABLE funcionario ADD sexo CHAR(1);
DESCRIBE funcionario;

INSERT INTO funcionario (nome, endereco, numero, salario, codigo_cidade, sexo) VALUES (
	'Pedro', 'Rua Flores', 30, 1500.00, 2, 'M'
);

INSERT INTO funcionario (nome, endereco, numero, salario, codigo_cidade, sexo) VALUES (
	'Maria', 'Avenida Brasil', 400, 1960.70, 1, 'F'
);

INSERT INTO funcionario (nome, endereco, numero, salario, codigo_cidade, sexo) VALUES (
	'Jose', 'Rua do João', 759, 3800.00, 4, 'F'
);

INSERT INTO funcionario (nome, endereco, numero, salario, codigo_cidade, sexo) VALUES (
	'Marco', 'Avenida Santa Rita', 2, 3450.50, 2, 'M'
);

SELECT * FROM funcionario;
SELECT nome, sexo FROM funcionario;
SELECT * FROM funcionario WHERE salario > 2000;
SELECT * FROM funcionario WHERE sexo = 'M' AND salario <= 1500;
SELECT * FROM funcionario ORDER BY salario ASC;
SELECT * FROM funcionario ORDER BY nome DESC;
SELECT * FROM funcionario WHERE salario >= 1000 AND salario <= 2000;
SELECT * FROM funcionario WHERE salario BETWEEN 3000 AND 4000;
SELECT * FROM funcionario WHERE nome LIKE 'M%';
SELECT * FROM funcionario WHERE nome LIKE '%A%';
SELECT * FROM funcionario WHERE nome NOT LIKE 'M%';

ALTER TABLE funcionario ADD setor VARCHAR(10) NOT NULL;
ALTER TABLE funcionario MODIFY sexo CHAR(1) NOT NULL;

DESCRIBE funcionario;

UPDATE funcionario SET setor = 'Produção' WHERE codigo < 5;
UPDATE funcionario SET setor = 'Gerente' WHERE codigo = 3;
DELETE FROM funcionario WHERE codigo > 3;

SELECT funcionario.nome, cidade.nome FROM funcionario JOIN cidade ON funcionario.codigo_cidade = cidade.codigo;
SELECT AVG(salario) FROM funcionario;
SELECT sexo, AVG(salario) AS 'Média salarial' FROM funcionario GROUP BY sexo;
SELECT SUM(salario) FROM funcionario;
