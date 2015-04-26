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


-- USO
exec DOWN_ESTOQUE @idProduto = 1, @qtd_baixada = 15

exec UP_ESTOQUE @idProduto = 1, @qtd_up = 200

select * from Produto where idProduto = 1