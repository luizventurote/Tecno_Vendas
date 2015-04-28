CREATE TRIGGER TGR_DOWN_ESTOQUE
ON Saida_Estoque 
FOR INSERT 
AS BEGIN 

	DECLARE 
	@idProduto_saida	INT,
	@qtd_saida			INT

	SELECT @idProduto_saida=idProduto, @qtd_saida=qtd_saida FROM INSERTED 
	
		
	exec DOWN_ESTOQUE @idProduto = @idProduto_saida, @qtd_baixada = @qtd_saida
	
END



CREATE TRIGGER TGR_UP_ESTOQUE
ON Entrada_Estoque 
FOR INSERT 
AS BEGIN 

	DECLARE 
	@idProduto_up	INT,
	@qtd_up			INT

	SELECT @idProduto_up=idProduto, @qtd_up=qtd_entradas FROM INSERTED 
	
	exec UP_ESTOQUE @idProduto = @idProduto_up, @qtd_up = @qtd_up
	
END



CREATE TRIGGER TGR_FATURAR_PEDIDO
ON faturamento 
FOR INSERT 
AS BEGIN 

	-- Variáveis
	DECLARE 
	@idFaturamento	AS INT,
	@idPedido		AS INT,
	@idProduto		AS INT, 
	@qtdProduto		AS INT, 
	@qtd			AS INT 

	-- Select da tabela onde estão inserindo os dados
	SELECT @idFaturamento=idFaturamento, @idPedido=idPedido FROM INSERTED 
	

	-- Cursor
	DECLARE CursorFaturamento CURSOR FOR  
		SELECT idProduto, qtd FROM Produto_Pedido_Item WHERE idPedido = @idPedido 

	OPEN CursorFaturamento  
 
	FETCH NEXT FROM CursorFaturamento INTO @idProduto, @qtd   
	WHILE @@FETCH_STATUS = 0   
	BEGIN   
		
		-- Executa procedure para dar baixa no estoque
		EXEC DOWN_ESTOQUE @idProduto = @idProduto, @qtd_baixada = @qtd

		-- Next
		FETCH NEXT FROM CursorFaturamento INTO @idProduto, @qtd   
	END   

	CLOSE CursorFaturamento   
	DEALLOCATE CursorFaturamento

END