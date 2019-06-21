.mode      columns
.headers   on 
.nullvalue NULL
.width 30 20


-- Querie 7
-- utilizadores cujos jogos que têm cobrem pelo menos metade dos generos

SELECT Utilizador.nome, count(Genero.IDGenero) AS [numero de generos]
FROM Utilizador, Compra, Jogo, Genero, PossuiGenero
WHERE Utilizador.ID = Compra.ID 
AND Compra.IDJogo = Jogo.IDJogo
AND Jogo.IDJogo = PossuiGenero.IDJogo
AND PossuiGenero.IDGenero = Genero.IDGenero
GROUP BY Utilizador.ID
HAVING count(Genero.IDGenero) >= round((SELECT count(IDGenero) FROM Genero)/2)
ORDER BY Utilizador.nome;