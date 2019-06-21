CREATE TRIGGER Compra_Idade_Minima
BEFORE INSERT ON Compra
FOR EACH ROW 
WHEN strftime('%Y','now')- strftime('%Y',(SELECT data_nascimento FROM Utilizador WHERE ID = New.ID)) < (SELECT idade_minima FROM Jogo WHERE IDJogo = New.IDJogo)
BEGIN
	SELECT RAISE(rollback,'Utilizador nao tem idade para comprar este jogo');
END;