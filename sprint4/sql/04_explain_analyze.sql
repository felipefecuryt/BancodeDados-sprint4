EXPLAIN ANALYZE
SELECT
    id,
    status,
    criado_em
FROM pedido
WHERE cliente_id = 1;

EXPLAIN ANALYZE
SELECT
    id,
    cliente_id,
    status
FROM pedido
WHERE status = 'PENDENTE';

EXPLAIN ANALYZE
SELECT
    id,
    pedido_id,
    produto_id,
    quantidade,
    preco_unitario
FROM item_pedido
WHERE pedido_id = 1;

EXPLAIN ANALYZE
SELECT
    id,
    pedido_id,
    produto_id,
    quantidade
FROM item_pedido
WHERE produto_id = 1;