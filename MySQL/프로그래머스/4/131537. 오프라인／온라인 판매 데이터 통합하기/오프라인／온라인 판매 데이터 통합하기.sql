# 250609 월 PM 11:31

WITH all_sales AS (
    SELECT
        sales_date,
        product_id,
        user_id,
        sales_amount
    FROM online_sale
    UNION
    SELECT
        sales_date,
        product_id,
        NULL,
        sales_amount
    FROM offline_sale
)

SELECT
    DATE_FORMAT(sales_date, '%Y-%m-%d') AS sales_date,
    product_id,
    user_id,
    sales_amount
FROM all_sales
WHERE YEAR(sales_date) = 2022 AND MONTH(sales_date) = 3
ORDER BY sales_date, product_id, user_id