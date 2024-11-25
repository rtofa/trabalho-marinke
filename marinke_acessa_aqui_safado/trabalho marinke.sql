
CREATE TABLE funcionarios(
	id SERIAL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL
);

CREATE TABLE mesas(
	id SERIAL PRIMARY KEY,
    funcionario_id INT NOT NULL,
    status VARCHAR(50) DEFAULT 'livre',
    FOREIGN KEY (funcionario_id) REFERENCES funcionarios(id)
);

CREATE TABLE vendas (
    id SERIAL PRIMARY KEY,
    mesa_id INT NOT NULL,
	pagamento_id INT NOT NULL,
	total DECIMAL(10, 2) NOT NULL,
    valor_total DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (mesa_id) REFERENCES mesas(id)
);

CREATE TABLE pedidos (
    id SERIAL PRIMARY KEY,
    mesa_id INT NOT NULL,
    FOREIGN KEY (mesa_id) REFERENCES mesas(id)
);

CREATE TABLE produtos (
    id SERIAL PRIMARY KEY,
	preco DECIMAL(10, 2) NOT NULL
    nome VARCHAR(100) NOT NULL
);

CREATE TABLE produtos_pedidos (
    id SERIAL PRIMARY KEY,
    pedido_id INT NOT NULL,
    produto_id INT NOT NULL,
	quantidade INT NOT NULL,
    FOREIGN KEY (pedido_id) REFERENCES pedidos(id),
    FOREIGN KEY (produto_id) REFERENCES produtos(id)
	
);

CREATE TABLE pagamentos (
    id SERIAL PRIMARY KEY,
    tipo_pagamento VARCHAR(50) NOT NULL, 
    descricao VARCHAR(100) 
);


INSERT INTO funcionarios (nome) VALUES 
('João'), 
('Maria'), 
('Carlos');

INSERT INTO mesas (funcionario_id, status) VALUES 
(7, 'ocupada'), 
(8, 'ocupada'), 
(9, 'livre');


INSERT INTO vendas (mesa_id, valor_total, pagamento_id) VALUES 
(7, 150.50), 
(8, 200.00);


INSERT INTO produtos (nome, preco) VALUES 
('Pizza', 50.00), 
('Refrigerante', 10.00), 
('Sobremesa', 20.00);


INSERT INTO pedidos (mesa_id) VALUES 
(7), 
(8);


INSERT INTO produtos_pedidos (pedido_id, produto_id, quantidade) 
VALUES 
(1, 1, 2),
(1, 2, 3), 
(2, 3, 1); 


INSERT INTO pagamentos (tipo_pagamento, descricao) VALUES 
('Cartão', 'Cartão de Crédito');

INSERT INTO vendas (mesa_id, total, pagamento_id) VALUES 
(1, 160.00, 1); 


--CONSULTAS 

-- Questão A)
SELECT 
    f.nome AS Nome_Funcionario, 
    m.id AS Mesa_Atendida,      
    SUM(p.preco * pp.quantidade) AS Total_Gasto 
FROM 
    funcionarios f
JOIN 
    mesas m ON f.id = m.funcionario_id
JOIN 
    pedidos ped ON m.id = ped.mesa_id
JOIN 
    produtos_pedidos pp ON ped.id = pp.pedido_id
JOIN 
    produtos p ON pp.produto_id = p.id
GROUP BY 
    f.nome, m.id
ORDER BY 
    f.nome, m.id;

-- Questão B)

SELECT 
    p.nome AS Produto,
    pp.quantidade AS Quantidade_Pedida,
    p.preco AS Preco_Unitario,
    (pp.quantidade * p.preco) AS Total_Consumido
FROM 
    mesas m
JOIN 
    pedidos ped ON m.id = ped.mesa_id
JOIN 
    produtos_pedidos pp ON ped.id = pp.pedido_id
JOIN 
    produtos p ON pp.produto_id = p.id
WHERE 
    m.id = 7;

-- Questão C)

CREATE OR REPLACE PROCEDURE redefinir_status_mesa(mesa_id INT)
LANGUAGE plpgsql

AS $$
BEGIN

    UPDATE mesas
    SET status = 'livre'
    WHERE id = mesa_id;
END;
$$;

CALL redefinir_status_mesa(1);


