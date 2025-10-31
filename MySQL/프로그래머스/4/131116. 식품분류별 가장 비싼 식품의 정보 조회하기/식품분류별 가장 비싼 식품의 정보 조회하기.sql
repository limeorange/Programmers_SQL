# 251031 금 PM 4:40

WITH max_info AS (
    SELECT
        category,
        MAX(price) AS max_price
    FROM food_product
    WHERE
        CATEGORY in ('과자', '국', '김치', '식용유')
    GROUP BY
        category
)

SELECT
    a.category,
    max_price,
    product_name
FROM food_product AS a
LEFT JOIN max_info  AS b
ON a.category = b.category
WHERE
    (a.category, price) in (SELECT category, max_price FROM max_info)
ORDER BY max_price DESC