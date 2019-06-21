.mode columns
.headers on 
.nullvalue NULL
.width 10 30 20 20


-- Querie 2
-- mostra o id, nome e username do usuario mais influente, ou seja, com maior numero de seguidores

SELECT ID, nome, username, count(IDseguido) AS [numero de seguidores]
FROM Utilizador, SeguirUtilizador
WHERE Utilizador.ID = IDseguido
GROUP BY ID
HAVING count(idseguido) = 
    (SELECT max(numero) 
     FROM (SELECT Utilizador.nome, count(IDseguido) AS numero 
           FROM Utilizador, SeguirUtilizador
           WHERE ID = IDseguido 
           GROUP BY IDseguido));