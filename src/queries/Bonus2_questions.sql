WITH memberTable AS (
SELECT s.customer_id, s.order_date, m.product_name, m.price,
    CASE
        WHEN s.order_date < me.join_date THEN 'N'
        ELSE 'Y'
    END AS member
FROM sales s
INNER JOIN menu m ON s.product_id = m.product_id
INNER JOIN members me ON s.customer_id = me.customer_id
),
member_ranking AS (
    SELECT *, ROW_NUMBER() OVER (PARTITION BY customer_id ORDER BY order_date) AS ranking
    FROM memberTable
    WHERE member = 'Y'
),
non_member AS (
    SELECT customer_id, order_date, product_name, price, member, NULL AS ranking
    FROM memberTable
    WHERE member = 'N'
)
SELECT customer_id, order_date, product_name, price, member, ranking
FROM member_ranking
UNION ALL
SELECT customer_id, order_date, product_name, price, member, ranking
FROM non_member
ORDER BY customer_id ASC, price DESC;
