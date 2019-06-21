.mode      columns
.headers   on
.nullvalue NULL

SELECT *
FROM Desejo_de_compra
WHERE ID = 1;

INSERT INTO Compra(ID,IDJogo,data_de_compra,classificacao) VALUES (1,3,'2018-12-12',1);

SELECT *
FROM Desejo_de_compra
WHERE ID = 1;