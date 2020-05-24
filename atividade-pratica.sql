CREATE TABLE Fabricantes (
	Codigo INTEGER PRIMARY KEY NOT NULL,
    Nome TEXT NOT NULL
);

CREATE TABLE Produtos (
	Codigo INTEGER PRIMARY KEY NOT NULL,
    Nome TEXT NOT NULL,
    Preco DOUBLE NOT NULL,
    Fabricante INTEGER NOT NULL
);

INSERT INTO Fabricantes VALUES(1, 'Sony');
INSERT INTO Fabricantes VALUES(2, 'Creative Labs');
INSERT INTO Fabricantes VALUES(3, 'Hewlett-Packard');
INSERT INTO Fabricantes VALUES(4, 'Iomega');
INSERT INTO Fabricantes VALUES(5, 'Fujitsu');
INSERT INTO Fabricantes VALUES(6, 'Winchester');

INSERT INTO Produtos VALUES(1, 'Hard drive', 240, 5);
INSERT INTO Produtos VALUES(2, 'Memory', 120, 6);
INSERT INTO Produtos VALUES(3, 'ZIP drive', 150, 4);
INSERT INTO Produtos VALUES(4, 'Floppy disk', 5, 6);
INSERT INTO Produtos VALUES(5, 'Monitor', 240, 1);
INSERT INTO Produtos VALUES(6, 'DVD drive', 180, 2);
INSERT INTO Produtos VALUES(7, 'CD drive', 90, 2);
INSERT INTO Produtos VALUES(8, 'Printer', 270, 3);
INSERT INTO Produtos VALUES(9, 'Toner', 66, 3);
INSERT INTO Produtos VALUES(10, 'DVD burner', 180, 2);

SELECT * FROM Fabricantes;
SELECT * FROM Produtos;
SELECT * FROM Produtos WHERE Preco BETWEEN 60 AND 120;
SELECT AVG(Preco) FROM Produtos WHERE Fabricante = 2;
SELECT Fabricantes.nome, AVG(Produtos.preco) FROM Fabricantes JOIN Produtos ON Fabricantes.codigo = Produtos.fabricante GROUP BY Fabricantes.nome;