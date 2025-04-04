# 250404 금 PM 11:34

SELECT
    SUBSTR(product_code, 1, 2) AS category,
    COUNT(*) AS products
FROM product
GROUP BY category
ORDER BY category