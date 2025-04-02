# 250402 수 PM 11:15 / RECURSIVE 활용해서 0~23 hour열 생성

WITH RECURSIVE
    hour_count AS (
    SELECT
    HOUR(datetime) AS HOUR,
    COUNT(*) AS COUNT
    FROM animal_outs
    GROUP BY HOUR
    ),
    hour_all AS (
    SELECT 0 AS HOUR
    UNION ALL
    SELECT hour+1 FROM hour_all WHERE hour < 23
    )

SELECT
    a.hour,
    IFNULL(COUNT, 0) AS COUNT
FROM hour_all as a
LEFT JOIN hour_count as c
ON a.HOUR = c.HOUR