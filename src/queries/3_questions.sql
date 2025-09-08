-- (3) What was the first item from the menu purchased by each customer?

SELECT s.customer_id, s.order_date, m.product_name
FROM sales s
INNER JOIN menu m ON s.product_id = m.product_id
WHERE s.order_date = (
    SELECT MIN(order_date)
    FROM sales
    WHERE customer_id = s.customer_id 
    );
    
    --Na verdade, as duas tabelas têm customer_id nesse contexto, mas de formas diferentes:

--where id=id
--No SELECT principal, você está usando a tabela sales com o alias s.
--Na subquery, você está novamente usando a tabela sales, mas sem alias.
--Quando você escreve WHERE customer_id = s.customer_id dentro da subquery, está dizendo:
--"Quero a menor data (MIN(order_date)) da tabela sales para o mesmo cliente que está na linha atual do SELECT principal."




--GROUP BY QUANDO É PRECISO
---No seu exemplo, não precisa de GROUP BY porque a função agregadora (MIN(order_date)) está dentro de uma subquery no WHERE, e não no SELECT principal.
-- Ou seja, você está filtrando linhas, não agrupando resultados.