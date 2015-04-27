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