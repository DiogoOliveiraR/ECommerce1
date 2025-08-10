CREATE DATABASE ecommerce;
USE ecommerce;

CREATE TABLE Fornecedor (
    idFornecedor INT PRIMARY KEY AUTO_INCREMENT,
    Razao_Social VARCHAR(45),
    CNPJ VARCHAR(15),
    Contato VARCHAR(45)
);

CREATE TABLE Estoque (
    idEstoque INT PRIMARY KEY AUTO_INCREMENT,
    Local VARCHAR(45),
    Quantidade INT
);

CREATE TABLE Produto (
    idProduto INT PRIMARY KEY AUTO_INCREMENT,
    Categoria VARCHAR(45)
);

CREATE TABLE Estoque_has_Produto (
    Estoque_idEstoque INT,
    Produto_idProduto INT,
    Quantidade INT,
    PRIMARY KEY (Estoque_idEstoque, Produto_idProduto),
    FOREIGN KEY (Estoque_idEstoque) REFERENCES Estoque(idEstoque),
    FOREIGN KEY (Produto_idProduto) REFERENCES Produto(idProduto)
);

CREATE TABLE Terceiro_Vendedor (
    idTerceiro_Vendedor INT PRIMARY KEY AUTO_INCREMENT,
    Razao_Social VARCHAR(45),
    Local VARCHAR(45),
    Nome_Fantasia VARCHAR(45)
);

CREATE TABLE Produtos_por_Vendedor (
    Terceiro_Vendedor_idTerceiro_Vendedor INT,
    Produto_idProduto INT,
    Quantidade VARCHAR(15),
    PRIMARY KEY (Terceiro_Vendedor_idTerceiro_Vendedor, Produto_idProduto),
    FOREIGN KEY (Terceiro_Vendedor_idTerceiro_Vendedor) REFERENCES Terceiro_Vendedor(idTerceiro_Vendedor),
    FOREIGN KEY (Produto_idProduto) REFERENCES Produto(idProduto)
);

CREATE TABLE Disponibilizacao_Produto (
    Fornecedor_idFornecedor INT,
    Produto_idProduto INT,
    PRIMARY KEY (Fornecedor_idFornecedor, Produto_idProduto),
    FOREIGN KEY (Fornecedor_idFornecedor) REFERENCES Fornecedor(idFornecedor),
    FOREIGN KEY (Produto_idProduto) REFERENCES Produto(idProduto)
);

CREATE TABLE Cliente (
    idCliente INT PRIMARY KEY AUTO_INCREMENT,
    Pnome VARCHAR(15),
    Nome_do_Meio VARCHAR(3),
    Sobrenome VARCHAR(45),
    CPF CHAR(11),
    Endereco VARCHAR(45),
    Data_de_Nascimento DATE
);

CREATE TABLE Pedido (
    idPedido INT PRIMARY KEY AUTO_INCREMENT,
    Status_do_Pedido ENUM('pendente', 'enviado', 'entregue', 'cancelado'),
    Descricao VARCHAR(45),
    Cliente_idCliente INT,
    Frete FLOAT,
    FOREIGN KEY (Cliente_idCliente) REFERENCES Cliente(idCliente)
);

CREATE TABLE Relacao_Produto_Pedido (
    Pedido_idPedido INT,
    Produto_idProduto INT,
    Quantidade VARCHAR(15),
    Status VARCHAR(45),
    PRIMARY KEY (Pedido_idPedido, Produto_idProduto),
    FOREIGN KEY (Pedido_idPedido) REFERENCES Pedido(idPedido),
    FOREIGN KEY (Produto_idProduto) REFERENCES Produto(idProduto)
);


