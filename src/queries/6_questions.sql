-- (6) Which item was purchased first by the customer after they became a member?

WITH ranked_sales AS (
    SELECT  
        s.customer_id,
        order_date, 
        m.product_name, 
        join_date,
        ROW_NUMBER() OVER(
            PARTITION BY s.customer_id 
            ORDER BY s.order_date) 
            AS rn 
    FROM sales s
    INNER JOIN menu m ON m.product_id= s.product_id
    INNER JOIN members me ON s.customer_id= me.customer_id
    WHERE s.order_date >= me.join_date
)
SELECT customer_id, order_date, product_name, join_date, rn
FROM ranked_sales
