.mode columns
.headers on 
.nullvalue NULL
.width 30 20


-- Querie 4
-- top 3 grupos com maior influencia (maior seguidores)

SELECT Grupo.nome, count(IDseguido) AS [total de seguidores]
FROM Grupo, Adesao, Utilizador, SeguirUtilizador
WHERE Grupo.IDGrupo = Adesao.IDGrupo
AND Utilizador.ID = Adesao.ID
AND SeguirUtilizador.IDseguido= Utilizador.ID
GROUP BY Grupo.IDGrupo
ORDER BY count(IDseguido) DESC
LIMIT 3;