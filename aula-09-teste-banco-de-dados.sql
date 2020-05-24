CREATE DATABASE aula;
USE aula;

CREATE TABLE usuario (
	codigo INT(3) AUTO_INCREMENT NOT NULL,
    login VARCHAR(30) NOT NULL,
    senha VARCHAR(12) NOT NULL,
    PRIMARY KEY (codigo)
);

SELECT * FROM usuario;
DESCRIBE usuario;

SHOW TABLES;

CREATE TABLE cidade (
	codigo INT(3) AUTO_INCREMENT NOT NULL,
    nome VARCHAR(45) NOT NULL,
    PRIMARY KEY (codigo)
);

SELECT * FROM cidade;
DESCRIBE cidade;

CREATE USER gerencia@localhost IDENTIFIED BY '123';
GRANT SELECT ON aula.cidade TO gerencia@localhost;
GRANT ALL PRIVILEGES ON aula.cidade TO gerencia@localhost;
GRANT ALL PRIVILEGES ON aula.* TO gerencia@localhost;

REVOKE ALL PRIVILEGES ON aula.* FROM gerencia@localhost;

CREATE USER usuario1@localhost IDENTIFIED BY '132';
DROP USER usuario1@localhost;
