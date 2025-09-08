-- (7) Which item was purchased just before the customer became a member?

WITH sales_before AS (
    SELECT s.customer_id, m.product_name, me.join_date, s.order_date,
    ROW_NUMBER() OVER (PARTITION BY m.product_name ORDER BY s.order_date DESC) AS product_s
    FROM sales s
    
    INNER JOIN menu m ON  s.product_id = m.product_id
    INNER JOIN members me ON s.customer_id = me.customer_id
    
    WHERE order_date<join_date

)

SELECT customer_id, product_name, join_date, order_date, product_s FROM sales_before
WHERE product_s=1;
