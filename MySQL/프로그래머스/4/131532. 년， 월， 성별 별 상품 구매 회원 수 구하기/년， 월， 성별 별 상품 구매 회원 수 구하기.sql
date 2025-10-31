# 251031 금 PM 4:57

# 년, 월, 성별 별 회원수 집계 시 한 회원에 대한 기록이 2개 이상 있어도 1명으로 카운팅(DISTINCT a1.user_id) => 그냥 COUNT(*)하면 안됨.

SELECT
    YEAR(sales_date) AS YEAR,
    MONTH(sales_date) AS MONTH,
    GENDER,
    COUNT(DISTINCT a1.user_id) AS USERS
FROM online_sale AS a1
LEFT JOIN user_info AS a2
ON a1.user_id = a2.user_id
WHERE
    gender is not null
GROUP BY YEAR, MONTH, GENDER
ORDER BY YEAR, MONTH, GENDER