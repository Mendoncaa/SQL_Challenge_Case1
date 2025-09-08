-- (9) ->If each $1 spent equates to 10 points and sushi has a 2x points multiplier - how many points would each customer have?

SELECT customer_id, SUM( 
    CASE 
        WHEN  m.product_name= 'sushi' THEN m.price * 20
        ELSE m.price *10
    END
)
    FROM sales s
    INNER JOIN menu m ON m.product_id= s.product_id
    GROUP BY customer_id
    