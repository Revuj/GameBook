.mode      columns
.headers   on 
.nullvalue NULL
.width 20 30


-- Querie 10
-- percentagem de horas jogas por jogador

DROP VIEW IF EXISTS horas_jogadas;

CREATE VIEW horas_jogadas AS
SELECT Utilizador.ID AS id, sum((julianday(data_final) -julianday(data_inicial))) * 24 AS [horas jogadas] 
FROM Jogo, Online, Sessao, Utilizador
WHERE Jogo.IDJogo = Online.IDJogo AND Online.IDJogo = Sessao.IDJogo AND Utilizador.ID = Sessao.ID
GROUP BY Utilizador.ID
ORDER BY Utilizador.ID;

DROP VIEW IF EXISTS total_horas;

CREATE VIEW total_horas AS 
SELECT sum((julianday(data_final) -julianday(data_inicial) ) * 24) AS total
FROM Sessao, Utilizador
WHERE Sessao.ID = Utilizador.ID;
       
SELECT horas_jogadas.id, horas_jogadas.[horas jogadas]/total_horas.total *100 AS [% tempo jogado]
FROM horas_jogadas,total_horas
