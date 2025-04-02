# 250402 수 PM 9:57

WITH max_table AS (
    SELECT
    category,
    MAX(price) AS max_price
    FROM FOOD_PRODUCT
    WHERE
        CATEGORY IN ('과자', '국', '김치', '식용유')
    GROUP BY category
)

SELECT
    category,
    price,
    product_name
FROM FOOD_PRODUCT
WHERE
    (category, price) in (SELECT category, max_price FROM max_table)
ORDER BY price DESC