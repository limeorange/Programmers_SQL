# 250405 토 PM 9:17 / group_concat 사용

WITH
    group_table AS (
    SELECT
        cart_id,
        group_concat(name) AS names
    FROM cart_products
    WHERE name in ('Milk', 'Yogurt')
    GROUP BY cart_id
    )

SELECT
    cart_id
FROM group_table
WHERE names LIKE '%Milk%' AND names LIKE '%Yogurt%'
ORDER BY cart_id