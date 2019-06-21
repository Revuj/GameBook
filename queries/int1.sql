.mode columns
.headers on 
.nullvalue NULL
.width 30 20 20


-- Querie 1
-- mostra o nome da pessoa e o nome do usuario das pessoas que tem igual numero de seguidores e seguidos

SELECT nome, username, count(Utilizador.ID) AS [numero de pessoas]
FROM Utilizador, SeguirUtilizador
WHERE Utilizador.id = SeguirUtilizador.IDseguidor
GROUP BY Utilizador.ID
INTERSECT
SELECT nome, username, count(Utilizador.ID) AS [numero de pessoas]
FROM Utilizador, SeguirUtilizador
WHERE Utilizador.ID = SeguirUtilizador.IDseguido
GROUP BY Utilizador.ID
ORDER BY nome;