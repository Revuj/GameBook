.mode      columns
.headers   on 
.nullvalue NULL
.width 30 20 20


-- Querie 9
-- numero total de sessoes dos 10 jogos mais vendido
DROP VIEW IF EXISTS top10_jogos_online;

CREATE VIEW IF NOT EXISTS top10_jogos_online AS
SELECT Jogo.IDJogo AS id, count(Jogo.IDJogo) AS vendas
FROM Compra, Jogo, Online
WHERE Jogo.IDJogo = Compra.IDJogo AND Jogo.IDJogo = Online.IDJogo
GROUP BY Jogo.IDJogo
ORDER BY COUNT(jogo.idjogo) DESC LIMIT 10;

DROP VIEW IF EXISTS nr_sessoes;

CREATE VIEW IF NOT EXISTS nr_sessoes AS
SELECT count(Jogo.IDJogo) AS [nr de sessoes], Jogo.IDJogo AS id
FROM Sessao, Jogo, Online
WHERE Jogo.IDJogo = Sessao.IDJogo AND Jogo.IDJogo = Online.IDJogo
GROUP BY Jogo.IDJogo;
    
SELECT Jogo.nome, [nr de sessoes], vendas
FROM nr_sessoes, top10_jogos_online, Jogo
WHERE nr_sessoes.id = top10_jogos_online.id
AND Jogo.IDJogo = nr_sessoes.id;