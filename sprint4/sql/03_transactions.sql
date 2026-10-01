BEGIN;

INSERT INTO cliente (nome, email, telefone)
VALUES ('Felipe Tavares', 'felipe.tavares@email.com', '999999999')
RETURNING id;

INSERT INTO produto (nome, preco, estoque)
VALUES ('Notebook', 4500.00, 10)
RETURNING id;

INSERT INTO pedido (cliente_id)
VALUES (
    (SELECT id
     FROM cliente
     WHERE email = 'felipe.tavares@email.com')
)
RETURNING id;

INSERT INTO item_pedido (pedido_id, produto_id, quantidade, preco_unitario)
VALUES (
    (SELECT id
     FROM pedido
     WHERE cliente_id = (
         SELECT id
         FROM cliente
         WHERE email = 'felipe.tavares@email.com'
     )
     ORDER BY id DESC
     LIMIT 1),
    (SELECT id
     FROM produto
     WHERE nome = 'Notebook'
     ORDER BY id DESC
     LIMIT 1),
    1,
    4500.00
);

COMMIT;


BEGIN;

INSERT INTO cliente (nome, email, telefone)
VALUES ('Joao Silva', 'joao.silva@email.com', '988888888')
RETURNING id;

SAVEPOINT cliente_salvo;

INSERT INTO produto (nome, preco, estoque)
VALUES ('Mouse', 250.00, 30)
RETURNING id;

INSERT INTO pedido (cliente_id)
VALUES (
    (SELECT id
     FROM cliente
     WHERE email = 'joao.silva@email.com')
)
RETURNING id;

ROLLBACK TO SAVEPOINT cliente_salvo;

COMMIT;


BEGIN;

INSERT INTO cliente (nome, email, telefone)
VALUES ('Maria Souza', 'maria.souza@email.com', '977777777')
RETURNING id;

INSERT INTO produto (nome, preco, estoque)
VALUES ('Teclado', 500.00, 20)
RETURNING id;

ROLLBACK;