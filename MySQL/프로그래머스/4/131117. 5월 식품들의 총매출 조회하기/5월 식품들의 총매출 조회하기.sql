# 250611 수 PM 2:57

SELECT
    o.product_id,
    product_name,
    SUM(amount * price) AS total_sales
FROM food_order AS o
JOIN food_product AS p
ON o.product_id = p.product_id
WHERE produce_date LIKE '2022-05%'
GROUP BY o.product_id, product_name
ORDER BY total_sales DESC, product_id