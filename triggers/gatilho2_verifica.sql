.mode      columns
.headers   on
.nullvalue NULL

SELECT Utilizador.ID,strftime('%Y','now')- strftime('%Y',data_nascimento) AS idade,IDJogo
FROM Utilizador,Compra
WHERE Utilizador.ID = Compra.ID AND Utilizador.ID = 5;

INSERT INTO Compra(ID,IDJogo,data_de_compra,classificacao) VALUES (5,18,'2018-12-12',1);

SELECT *
FROM Compra
WHERE ID = 5;