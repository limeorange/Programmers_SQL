# 251030 목 PM 8:56

# PERCENT_RANK() OVER (ORDER BY 컬럼명 정렬기준) AS 새로운_컬럼명
# => 새로운_컬럼명에서 예약어(rank, order 등) 안 쓰도록 주의!

WITH t1 AS (
    SELECT
        ID,
        PERCENT_RANK() OVER (ORDER BY size_of_colony DESC) AS rank_p
    FROM ecoli_data
)

SELECT
    id,
    CASE
        WHEN rank_p <= 0.25 THEN 'CRITICAL'
        WHEN rank_p <= 0.5 THEN 'HIGH'
        WHEN rank_p <= 0.75 THEN 'MEDIUM'
        ELSE 'LOW'
    END AS colony_name
FROM t1
ORDER BY id