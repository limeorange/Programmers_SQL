# 250402 수 PM 5:58

WITH all_sale AS (
    SELECT o.sales_date, o.product_id, o.user_id, o.sales_amount
    FROM ONLINE_SALE as o
    LEFT JOIN OFFLINE_SALE as off_
    ON o.sales_date = off_.sales_date
    
    UNION
    
    SELECT off_.sales_date, off_.product_id, NULL AS user_id, off_.sales_amount
    FROM OFFLINE_SALE as off_
    LEFT JOIN ONLINE_SALE as o
    ON off_.sales_date = o.sales_date
)

SELECT
    DATE_FORMAT(sales_date, '%Y-%m-%d') AS SALES_DATE,
    PRODUCT_ID,
    USER_ID,
    SUM(SALES_AMOUNT) AS SALES_AMOUNT
FROM all_sale
WHERE SALES_DATE LIKE '2022-03%'
GROUP BY
    SALES_DATE,
    PRODUCT_ID,
    USER_ID
ORDER BY SALES_DATE, PRODUCT_ID, USER_ID