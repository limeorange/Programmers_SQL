# 250402 수 PM 10:08

SELECT
    YEAR(sales_date) AS YEAR,
    MONTH(sales_date) AS MONTH,
    gender,
    COUNT(DISTINCT s.user_id) AS USERS
FROM online_sale as s
JOIN user_info as u
ON s.user_id = u.user_id
WHERE gender is not null
GROUP BY YEAR, MONTH, gender
ORDER BY YEAR, MONTH, gender