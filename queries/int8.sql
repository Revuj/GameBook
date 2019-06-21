.mode      columns
.headers   on 
.nullvalue NULL
.width 10 20


-- Querie 8
-- calcula a diferenca de idades dos utilizadores com a media de idades daqueles que o seguem

DROP VIEW IF EXISTS idades;

CREATE VIEW IF NOT EXISTS idades AS
SELECT id, (date('now') - data_nascimento) AS idade 
FROM utilizador
ORDER BY idade ASC; 
        
DROP VIEW IF EXISTS media_idades_seguidores;
  
CREATE VIEW IF NOT EXISTS media_idades_seguidores AS
SELECT IDseguido, avg(idade) AS [media de idade dos seguidores]
FROM SeguirUtilizador, Utilizador, idades
WHERE IDseguidor = Utilizador.ID AND idades.ID = Utilizador.ID
GROUP BY IDseguido;

SELECT idades.ID, abs(idades.idade - media_idades_seguidores.[media de idade dos seguidores]) AS [diferenca de idades]
FROM media_idades_seguidores, idades
WHERE media_idades_seguidores.IDseguido = idades.ID
UNION -- se nao tem seguidores o avg e zero por isso e a propria idade
SELECT idades.ID ,idades.idade
FROM idades
WHERE idades.ID NOT IN (SELECT media_idades_seguidores.IDseguido FROM media_idades_seguidores)
ORDER BY idades.ID