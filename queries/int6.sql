.mode      columns
.headers   on 
.nullvalue NULL
.width 20 20


-- Querie 6 
-- Amizade recíproca

SELECT n1.nome,n2.nome
FROM(SELECT u1.IDseguido AS id1, u1.IDseguidor AS id2
     FROM SeguirUtilizador u1, SeguirUtilizador u2
     WHERE u1.IDseguidor = u2.IDseguido AND u1.IDseguido = u2.IDseguidor
     AND u1.IDseguidor < u2.IDseguidor), 
    Utilizador n1 , Utilizador n2
WHERE id1 = n1.ID and id2 = n2.ID;