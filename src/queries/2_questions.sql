-- (2) How many days has each customer visited the restaurant?

SELECT customer_id, COUNT(DISTINCT order_date) AS visit_days FROM sales
GROUP BY customer_id;