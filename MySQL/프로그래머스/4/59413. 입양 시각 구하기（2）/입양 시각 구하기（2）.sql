# 250610 화 PM 7:48 / WITH RECURSIVE로 hour 열 생성 (재귀 활용)

WITH RECURSIVE
    hour_table AS (
    SELECT 0 AS hour
    UNION
    SELECT hour+1 FROM hour_table WHERE hour < 23
    ),
    count_table AS (
    SELECT
        HOUR(datetime) AS hour,
        COUNT(*) AS count
    FROM animal_outs
    GROUP BY hour
    )

SELECT
    h.hour AS hour,
    IFNULL(count, 0) AS count
FROM hour_table AS h
LEFT JOIN count_table AS c
ON h.hour = c.hour