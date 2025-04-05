# 250405 토 PM 9:07
# 오답포인트) 년, 월 별로 상품 구매한 회원수 COUNT할 때 DISTINCT로 중복 제거!

WITH
    user_list AS (
    SELECT user_id
    FROM user_info
    WHERE YEAR(joined) = 2021
    )
    
SELECT
    YEAR(sales_date) AS year,
    MONTH(sales_date) AS month,
    COUNT(DISTINCT user_id) AS purchased_users,
    ROUND(COUNT(DISTINCT user_id)/(SELECT COUNT(user_id) FROM user_list), 1) AS purchased_ratio
FROM online_sale
WHERE user_id in (SELECT user_id FROM user_list)
GROUP BY year, month
ORDER BY year, month