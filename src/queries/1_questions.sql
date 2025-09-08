-- (1) What is the total amount each customer spent at the restaurant?
SELECT sales.customer_id, SUM(produto.price) AS total_spent
FROM sales
INNER JOIN(SELECT price, product_name, product_id FROM menu) produto
ON sales.product_id= produto.product_id
GROUP BY sales.customer_id

