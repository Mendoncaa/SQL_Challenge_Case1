-- (8) What is the total items and amount spent for each member before they became a member?
SELECT s.customer_id, COUNT(*) AS total_items, SUM(m.price) FROM sales s
    INNER JOIN menu m ON s.product_id= m.product_id
    INNER JOIN members me ON s.customer_id= me.customer_id
WHERE s.order_date < me.join_date
GROUP BY s.customer_id
