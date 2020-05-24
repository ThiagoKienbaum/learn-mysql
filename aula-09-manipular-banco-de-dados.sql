SHOW DATABASES;

USE aula;
SHOW TABLES;

SELECT * FROM cidade;
SELECT * FROM usuario;
SELECT * FROM resumo_cadastro;

DESCRIBE cidade;
DESCRIBE usuario;
DESCRIBE resumo_cadastro;

INSERT INTO cidade (nome) VALUES ('Irati');
INSERT INTO cidade (nome) VALUES ('Ponta Grossa');

UPDATE cidade SET nome = 'Ponta Grossa' WHERE codigo = 2;
DELETE FROM cidade WHERE codigo = 1;
CREATE INDEX codigo_cidade ON cidade (codigo);

INSERT INTO usuario (login, senha) VALUES (
	'Joaquim',
    '23456'
);

INSERT INTO usuario (login, senha) VALUES (
	'João',
    '8888'
);

UPDATE usuario SET senha = '1234' WHERE codigo = 2;
CREATE INDEX codigo_usuario ON usuario (codigo);

CREATE TABLE resumo_cadastro (
	id INT(4) AUTO_INCREMENT NOT NULL,
    nome VARCHAR(45) NOT NULL,
    sexo CHAR(1) NOT NULL,
    PRIMARY KEY(id),
    INDEX cadastro(id)
);
