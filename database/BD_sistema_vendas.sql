CREATE DATABASE sistema_vendas;
USE sistema_vendas;

-- -----------------------------------------------------
-- Cliente
-- -----------------------------------------------------
CREATE TABLE Cliente (
  idCliente INT NOT NULL,
  nome VARCHAR(100) NULL,
  telefone VARCHAR(15) NULL,
  logradouro VARCHAR(150) NULL,
  cnpj VARCHAR(50) NULL,
  estado VARCHAR(2) NULL,
  pais VARCHAR(45) NULL,
  numero INT NULL,
  PRIMARY KEY (idCliente)
);


-- -----------------------------------------------------
-- Produto
-- -----------------------------------------------------
CREATE TABLE Produto (
  idProduto INT NOT NULL,
  descricao VARCHAR(300) NULL,
  qtd_estoque INT NULL,
  valor FLOAT NULL,
  cod_barra INT NULL,
  PRIMARY KEY (idProduto)
);


-- -----------------------------------------------------
-- Usuario
-- -----------------------------------------------------
CREATE TABLE Usuario (
  idUsuario INT NOT NULL,
  nome VARCHAR(45) NULL,
  senha VARCHAR(45) NULL,
  login VARCHAR(45) NULL,
  PRIMARY KEY (idUsuario)
);


-- -----------------------------------------------------
-- Entrada_Estoque
-- -----------------------------------------------------
CREATE TABLE Entrada_Estoque (
  idEntradaEstoque INT NOT NULL,
  idUsuario INT NOT NULL,
  idProduto INT NOT NULL,
  qtd_entradas INT NULL,
  PRIMARY KEY (idEntradaEstoque)
);


-- -----------------------------------------------------
-- Pedido
-- -----------------------------------------------------
CREATE TABLE Pedido (
  idPedido INT NOT NULL,
  idCliente INT NOT NULL,
  data_pedido VARCHAR(45) NULL,
  prazo_pagamento INT NULL,
  valor FLOAT NULL,
  qtd INT NULL,
  PRIMARY KEY (idPedido)
);


-- -----------------------------------------------------
-- Produto_Pedido_Item
-- -----------------------------------------------------
CREATE TABLE Produto_Pedido_Item (
  idProdutoPedido INT NOT NULL,
  qty VARCHAR(45) NULL,
  idProduto INT NOT NULL,
  idPedido INT NOT NULL,
  PRIMARY KEY (idProdutoPedido)
);


-- -----------------------------------------------------
-- Faturamento
-- -----------------------------------------------------
CREATE TABLE Faturamento (
  idFaturamento INT NOT NULL,
  idPedido INT NOT NULL,
  num_nota_fiscal INT NULL,
  data VARCHAR(45) NULL,
  PRIMARY KEY (idFaturamento)
);


-- -----------------------------------------------------
-- Contas_a_Receber
-- -----------------------------------------------------
CREATE TABLE Contas_a_Receber (
  idContasReceber INT NOT NULL,
  idCliente INT NOT NULL,
  idDuplicata INT NOT NULL,
  num_nota_fiscal INT NULL,
  vencimento DATE NULL,
  data_baixa DATE NULL,
  PRIMARY KEY (idContasReceber)
);


-- -----------------------------------------------------
-- Tela
-- -----------------------------------------------------
CREATE TABLE Tela (
  idTela INT NOT NULL,
  nome VARCHAR(45) NULL,
  PRIMARY KEY (idTela)
);


-- -----------------------------------------------------
-- Tela_Usuario
-- -----------------------------------------------------
CREATE TABLE Tela_Usuario (
  idTela INT NOT NULL,
  idUsuario INT NOT NULL,
  PRIMARY KEY (idTela, idUsuario)
);