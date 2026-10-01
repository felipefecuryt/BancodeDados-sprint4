CREATE ROLE equipe_vendas;

CREATE USER vendedor
WITH PASSWORD 'SenhaVendedor123';

CREATE USER analista
WITH PASSWORD 'SenhaAnalista123';

GRANT equipe_vendas TO vendedor;

GRANT CONNECT ON DATABASE sprint4
TO equipe_vendas;

GRANT USAGE ON SCHEMA public
TO equipe_vendas;

GRANT SELECT, INSERT, UPDATE
ON cliente, pedido, item_pedido
TO equipe_vendas;

GRANT CONNECT ON DATABASE sprint4
TO analista;

GRANT USAGE ON SCHEMA public
TO analista;

GRANT SELECT
ON cliente, produto, pedido, item_pedido
TO analista;

REVOKE DELETE
ON cliente, pedido, item_pedido
FROM equipe_vendas;