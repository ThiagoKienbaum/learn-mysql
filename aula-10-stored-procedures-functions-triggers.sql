SET GLOBAL log_bin_trust_function_creators = 1;
SHOW DATABASES;
SHOW TABLES;
USE aula;
SELECT * FROM funcionario;
DESCRIBE funcionario;

CREATE TABLE funcionario (
	codigo INT(3) AUTO_INCREMENT NOT NULL,
    nome VARCHAR(45) NOT NULL,
    sexo CHAR(1) NOT NULL,
    salario DECIMAL(6,2) NOT NULL,
    PRIMARY KEY (codigo)
);

/**Alterar precisão da coluna até SQL versão 8.2 **/
ALTER TABLE funcionario ADD salarioNovo DECIMAL(10,2);
UPDATE funcionario SET salarioNovo = salario WHERE codigo >= 0;
ALTER TABLE funcionario DROP COLUMN salario;
ALTER TABLE funcionario RENAME COLUMN salarioNovo TO salario;

INSERT INTO funcionario VALUES (NULL, 'Pedro', 'M', 7820.00);
INSERT INTO funcionario VALUES (NULL, 'Maria', 'F', 9320.00);
INSERT INTO funcionario VALUES (NULL, 'João', 'M', 2390.80);
INSERT INTO funcionario VALUES (NULL, 'Marta', 'F', 3450.75);

SELECT nome, salario FROM funcionario WHERE sexo = 'F';

DELIMITER $$
CREATE PROCEDURE quantidadeSalarioMenor(salarioComparativo DECIMAL)
	SELECT COUNT(*) FROM funcionario WHERE salario < salarioComparativo;
$$
CALL quantidadeSalarioMenor(5000);
DROP PROCEDURE funcao_minimo;

DELIMITER $$
CREATE PROCEDURE buscarSalarioFuncionario(funcionarioID SMALLINT)
	SELECT * FROM funcionario WHERE codigo = funcionarioID;
$$
CALL buscarSalarioFuncionario(2);

DELIMITER $$
CREATE PROCEDURE concederAumentoSalarialDezPorcento(funcionarioID SMALLINT)
	UPDATE funcionario SET salario = (salario * 1.1) WHERE codigo = funcionarioID;
$$
CALL concederAumentoSalarialDezPorcento(2);

DELIMITER $$
CREATE FUNCTION somarDoisValores(valor1 INT, valor2 INT)
	RETURNS INT
    RETURN valor1 + valor2;
$$
SELECT somarDoisValores(3,4);
SELECT somarDoisValores(8,2) AS 'Resultado da Soma';
DROP FUNCTION somarDoisValores;

DELIMITER $$
CREATE FUNCTION retornarSalario(id SMALLINT)
	RETURNS DECIMAL (10,2)
    RETURN (
		SELECT salario FROM funcionario WHERE codigo = id
	);
$$
SELECT retornarSalario(2) AS 'Salario';

DELIMITER $$
CREATE FUNCTION contarQuantidadeFuncionariosPorSexo(sexoFuncionario CHAR)
	RETURNS INT
    RETURN (
		SELECT COUNT(*) FROM funcionario WHERE sexo = sexoFuncionario
    );
$$
SELECT contarQuantidadeFuncionariosPorSexo('M');

CREATE TABLE backup (
	codigo INT(3) NOT NULL AUTO_INCREMENT,
    nome VARCHAR(40) NOT NULL,
    salario DECIMAL(10,2) NOT NULL,
    PRIMARY KEY(codigo)
);
SELECT * FROM backup;

DELIMITER $$
CREATE TRIGGER fazerBackup BEFORE DELETE ON funcionario FOR EACH ROW
	BEGIN
		INSERT INTO backup(nome, salario) VALUES(old.nome, old.salario);
	END
$$

DROP TRIGGER fazerBackup;

INSERT INTO funcionario VALUES (NULL, 'Thiago', 'M', '42');
DELETE FROM funcionario WHERE codigo = '7';

DELIMITER $$
CREATE FUNCTION quantidadeRegistrosBackupFuncionarios()
	RETURNS INT
    RETURN (SELECT COUNT(*) FROM backup);
$$

SELECT quantidadeRegistrosBackupFuncionarios();

DELIMITER $$
CREATE PROCEDURE quantidadeFuncionariosPorSexo(sexoFuncionario CHAR)
	BEGIN
		IF (sexoFuncionario = 'M') THEN
			SELECT COUNT(*) FROM funcionario WHERE sexo = 'M';
		ELSEIF (sexoFuncionario = 'F') THEN
			SELECT COUNT(*) FROM funcionario WHERE sexo = 'F';
		END IF;
    END
$$

CALL quantidadeFuncionariosPorSexo('F');

DELIMITER $$
CREATE PROCEDURE retornarFuncionariosPorSexo(sexoFuncionario CHAR)
	BEGIN
		IF (sexoFuncionario = 'M') THEN
			SELECT * FROM funcionario WHERE sexo = 'M';
		ELSEIF (sexoFuncionario = 'F') THEN
			SELECT * FROM funcionario WHERE sexo = 'F';
		END IF;
    END
$$

CALL retornarFuncionariosPorSexo('F');
