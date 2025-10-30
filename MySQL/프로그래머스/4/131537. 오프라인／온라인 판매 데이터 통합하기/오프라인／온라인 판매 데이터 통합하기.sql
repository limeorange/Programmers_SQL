# 251030 목 PM 8:05

WITH t1 AS (
    SELECT
        DATE_FORMAT(sales_date, '%Y-%m-%d') AS sales_date,
        product_id,
        user_id,
        SUM(sales_amount) AS sales_amount
    FROM online_sale
    GROUP BY
        sales_date,
        product_id,
        user_id
    HAVING sales_date LIKE '2022-03%'
),
t2 AS (
    SELECT
        DATE_FORMAT(sales_date, '%Y-%m-%d') AS sales_date,
        product_id,
        NULL AS user_id,
        SUM(sales_amount) AS sales_amount
    FROM offline_sale
    GROUP BY
        sales_date,
        product_id
    HAVING sales_date LIKE '2022-03%')

SELECT
    *
FROM t1
UNION
SELECT
    * 
FROM t2
ORDER BY sales_date, product_id, user_id