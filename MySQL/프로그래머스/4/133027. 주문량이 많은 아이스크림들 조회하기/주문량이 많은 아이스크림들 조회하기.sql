# 251031 금 PM 8:50

# july 테이블은 '같은 맛이라도 서로 다른 출하 번호' => 자체적으로 group by 먼저해서 맛 별 total_order 구한 다음 first_half랑 join해야 전체적인 total_order 계산이 정확함.

WITH j AS (
    SELECT
        flavor,
        SUM(total_order) AS total_order
    FROM july
    GROUP BY flavor
)

SELECT
    a.flavor
FROM first_half AS a
JOIN j AS b
ON a.flavor = b.flavor
ORDER BY (a.total_order+b.total_order) DESC
LIMIT 3