# 250403 목 PM 6:09

SELECT
    p.product_id,
    product_name,
    SUM(price*amount) AS TOTAL_SALES
FROM FOOD_PRODUCT AS p
JOIN FOOD_ORDER AS o
ON p.product_id = o.product_id
WHERE PRODUCE_DATE LIKE '2022-05%'
GROUP BY
    p.product_id,
    product_name
ORDER BY total_sales DESC, product_id