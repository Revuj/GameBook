.mode columns
.headers on 
.nullvalue NULL
.width 30 40 30 10


-- Querie 5
-- quantidade de dinheiro entregue e nao entregue pelas empresas em torneios

SELECT nome, [quantia do premio nao entregue] , [quantia do premio entregue], [quantia do premio nao entregue]+[quantia do premio entregue] AS total
FROM (SELECT Empresa.nome AS nome, sum(Premio.quantia) AS [quantia do premio entregue], Premio.entregue
      FROM Empresa, Jogo, Premio, Torneio, EntregaPremio
      WHERE Empresa.IDEmpresa = Jogo.IDEmpresa
      AND Jogo.IDJogo = Torneio.IDJogo
      AND Premio.IDPremio =  EntregaPremio.IDPremio
      AND Torneio.IDTorneio = EntregaPremio.IDTorneio AND Premio.entregue = 1
      GROUP BY Empresa.IDEmpresa, Premio.entregue) 
      JOIN 
     (SELECT Empresa.nome AS nome, sum(Premio.quantia) AS [quantia do premio nao entregue], premio.entregue
      FROM Empresa, Jogo, Premio, Torneio, EntregaPremio
      WHERE Empresa.IDEmpresa = Jogo.IDEmpresa
      AND Jogo.IDJogo = Torneio.IDJogo
      AND Premio.IDPremio =  EntregaPremio.IDPremio
      AND Torneio.IDTorneio = EntregaPremio.IDTorneio AND Premio.entregue = 0
      GROUP BY Empresa.IDEmpresa) 
    USING(nome);