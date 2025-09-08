SELECT s.customer_id, s.order_date, m.product_name, m.price,
    CASE
        WHEN s.order_date < me.join_date THEN 'N'
        ELSE 'Y'
    END AS member
FROM sales s
INNER JOIN menu m ON s.product_id = m.product_id
INNER JOIN members me ON s.customer_id = me.customer_id
ORDER BY customer_id ASC, price DESC
