# 250402 수 PM 6:01
/*
오답포인트) offline_sale 테이블에서 user_id 컬럼 만들 때 'NULL'이 아닌 NULL로 명시
*/

WITH all_sale AS (
    SELECT sales_date, product_id, user_id, sales_amount
    FROM ONLINE_SALE
    UNION
    SELECT sales_date, product_id, NULL AS user_id, sales_amount
    FROM OFFLINE_SALE
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