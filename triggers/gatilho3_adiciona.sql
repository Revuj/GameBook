CREATE TRIGGER Entrega_Premio
AFTER UPDATE ON Premio
FOR EACH ROW
WHEN (Old.entregue = 0 AND New.entregue = 1)
BEGIN
	UPDATE Cartao_de_credito
	SET saldo = saldo + New.quantia
    WHERE Cartao_de_credito.ID = (SELECT Participacao.ID 
                                    FROM Participacao,Torneio,EntregaPremio 
                                    WHERE Participacao.classificacao = New.classificacao
                                    AND Participacao.IDTorneio = Torneio.IDTorneio 
                                    AND EntregaPremio.IDTorneio=Torneio.IDTorneio 
                                    AND New.IDPremio = EntregaPremio.IDPremio);
END;