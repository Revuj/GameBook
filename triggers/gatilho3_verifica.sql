.mode      columns
.headers   on
.nullvalue NULL

SELECT ID, saldo
FROM Cartao_de_credito
WHERE ID = 3;

UPDATE Premio SET entregue = 1 WHERE IDPremio = 7;

SELECT ID, saldo
FROM Cartao_de_credito
WHERE ID = 3;


SELECT ID, saldo
FROM Cartao_de_credito
WHERE ID = 8;

UPDATE Premio SET entregue = 1 WHERE IDPremio = 8;

SELECT ID, saldo
FROM Cartao_de_credito
WHERE ID = 8;