--- ******************************************************
---  Procedimento para baixar o Estoque de um produto
--- ******************************************************
CREATE PROCEDURE DOWN_ESTOQUE (@idProduto int, @qtd_baixada int) AS 
BEGIN

	DECLARE @qtd_estoque int

	/* Pega a quantidade do estoque atual */
	SELECT @qtd_estoque = qtd_estoque FROM Produto WHERE idProduto = @idProduto
	
	/* Decrementa estoque */
	IF @qtd_estoque is NOT NULL
		BEGIN
			IF @qtd_estoque >= @qtd_baixada
				BEGIN
					UPDATE Produto SET qtd_estoque = qtd_estoque - @qtd_baixada WHERE idProduto = @idProduto
					IF @@ROWCOUNT = 1
						RETURN 0 --- ok
					ELSE
						RETURN -1 --- Erro
			END -- Fim do IF
			ELSE
				RETURN 1 -- produto em falta
		END -- Fim do IF	
	ELSE
		RETURN -2 -- produto não Existe
	
END


--- ******************************************************
---  Procedimento para aumentar o Estoque de um produto
--- ******************************************************
CREATE PROCEDURE UP_ESTOQUE (@idProduto int, @qtd_up int) AS 
BEGIN

	DECLARE @qtd_estoque int

	/* Pega a quantidade do estoque atual */
	SELECT @qtd_estoque = qtd_estoque FROM Produto WHERE idProduto = @idProduto
	
	/* Incrementa estoque */
	IF @qtd_estoque is NOT NULL
		BEGIN
			UPDATE Produto SET qtd_estoque = qtd_estoque + @qtd_up WHERE idProduto = @idProduto
				IF @@ROWCOUNT = 1
					RETURN 0 --- ok
				ELSE
					RETURN -1 --- Erro
		END -- Fim do IF	
	ELSE
		RETURN -2 -- produto não Existe
	
END


--- ******************************************************
---  Procedimento para atualizar todo o estoque
--- ******************************************************
CREATE PROCEDURE UPDATE_ALL_ESTOQUE AS
BEGIN

	-- VARIÁVEIS
	-----------------------------------------------------------
	DECLARE 
	@idEntradaEstoque	AS INT, 
	@idProduto			AS INT, 
	@qtd_entradas		AS INT,
	@idSaidaEstoque 	AS INT, 
	@qtd_saida			AS INT,
	@qtd_estoque	AS INT		
	
	
	-- ZERA O ESTOQUE
	-----------------------------------------------------------
	DECLARE CursorZerarEstoque CURSOR FOR  
		SELECT idProduto, qtd_estoque FROM Produto

	OPEN CursorZerarEstoque  
 
	FETCH NEXT FROM CursorZerarEstoque INTO @idProduto, @qtd_estoque 
	WHILE @@FETCH_STATUS = 0   
	BEGIN   
		
		UPDATE Produto SET qtd_estoque = 0 WHERE idProduto = @idProduto
		
		-- Next
		FETCH NEXT FROM CursorZerarEstoque INTO @idProduto, @qtd_estoque  
	END   

	CLOSE CursorZerarEstoque   
	DEALLOCATE CursorZerarEstoque
	
		
	-- CURSOR QUE INCREMENTA ESTOQUE
	-----------------------------------------------------------
	DECLARE CursorUpEstoque CURSOR FOR  
		SELECT idEntradaEstoque, idProduto, qtd_entradas FROM Entrada_Estoque

	OPEN CursorUpEstoque  
 
	FETCH NEXT FROM CursorUpEstoque INTO @idEntradaEstoque, @idProduto, @qtd_entradas 
	WHILE @@FETCH_STATUS = 0   
	BEGIN   
	
		exec UP_ESTOQUE @idProduto = @idProduto, @qtd_up = @qtd_entradas
		
		-- Next
		FETCH NEXT FROM CursorUpEstoque INTO @idEntradaEstoque, @idProduto, @qtd_entradas  
	END   

	CLOSE CursorUpEstoque   
	DEALLOCATE CursorUpEstoque
	
	
	-- CURSOR QUE DECREMENTA ESTOQUE
	-----------------------------------------------------------
	DECLARE CursorDownEstoque CURSOR FOR  
		SELECT idSaidaEstoque, idProduto, qtd_saida FROM Saida_Estoque

	OPEN CursorDownEstoque  
 
	FETCH NEXT FROM CursorDownEstoque INTO @idSaidaEstoque, @idProduto, @qtd_saida 
	WHILE @@FETCH_STATUS = 0   
	BEGIN   
		
		exec DOWN_ESTOQUE @idProduto = @idProduto, @qtd_baixada = @qtd_saida
		
		-- Next
		FETCH NEXT FROM CursorDownEstoque INTO @idSaidaEstoque, @idProduto, @qtd_saida  
	END   

	CLOSE CursorDownEstoque   
	DEALLOCATE CursorDownEstoque
	
	
END









