.mode columns
.headers on 
.nullvalue NULL
.width 30 10


-- Querie 3
-- empresas e respetivo lucro em vendas de jogos

SELECT a.name AS nome, sum([ganhos totais]) AS lucro
FROM (SELECT Empresa.nome as name, count(Compra.IDJogo) * Jogo.preco AS [ganhos totais]
      FROM Empresa, Jogo, Compra
      WHERE Empresa.IDEmpresa = Jogo.IDEmpresa AND Compra.IDJogo = Jogo.IDJogo
      GROUP BY Jogo.IDJogo ) a
GROUP BY a.name
UNION 
SELECT Empresa.nome, 0 
FROM Empresa
WHERE Empresa.IDEmpresa NOT IN(SELECT Jogo.IDEmpresa 
                   		       FROM Compra, Jogo
                   		       WHERE Compra.IDJogo = Jogo.IDJogo)
ORDER BY Empresa.nome;