-- (4)What is the most purchased item on the menu and how many times was it purchased by all customers?

SELECT m.product_name, COUNT(s.product_id) AS total_purchases FROM sales s
INNER JOIN menu m ON s.product_id= m.product_id
GROUP BY m.product_name
ORDER BY total_purchases DESC
LIMIT 1