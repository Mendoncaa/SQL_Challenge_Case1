-- (5) Which item was the most popular for each customer?

WITH customer_products AS (
  SELECT
    s.customer_id,
    m.product_name,
    COUNT(*) AS total
  FROM sales s
  INNER JOIN menu m ON m.product_id = s.product_id
  GROUP BY s.customer_id, m.product_name
)
SELECT customer_id, product_name, total
FROM (
  SELECT *,
         ROW_NUMBER() OVER (PARTITION BY customer_id ORDER BY total DESC) AS rn
  FROM customer_products
) ranked
WHERE rn = 1