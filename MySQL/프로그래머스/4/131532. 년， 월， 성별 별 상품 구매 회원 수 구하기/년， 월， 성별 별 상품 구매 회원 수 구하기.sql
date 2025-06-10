# 250610 화 PM 7:22

SELECT
    YEAR(sales_date) AS year,
    MONTH(sales_date) AS month,
    gender,
    COUNT(DISTINCT s.user_id) AS users    
FROM online_sale AS s
JOIN user_info AS u
ON s.user_id = u.user_id
WHERE gender is not null
GROUP BY year, month, gender
ORDER BY year, month, gender