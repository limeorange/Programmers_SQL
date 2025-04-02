# 250402 수 PM 10:29

WITH
    hour_count AS (
    SELECT
    HOUR(datetime) AS HOUR,
    COUNT(*) AS COUNT
    FROM animal_outs
    GROUP BY HOUR
    ),
    hour_all AS (
    SELECT 0 AS HOUR
    UNION SELECT 1 UNION SELECT 2 UNION SELECT 3 UNION SELECT 4
    UNION SELECT 5 UNION SELECT 6 UNION SELECT 7 UNION SELECT 8
    UNION SELECT 9 UNION SELECT 10 UNION SELECT 11 UNION SELECT 12
    UNION SELECT 13 UNION SELECT 14 UNION SELECT 15 UNION SELECT 16
    UNION SELECT 17 UNION SELECT 18 UNION SELECT 19 UNION SELECT 20
    UNION SELECT 21 UNION SELECT 22 UNION SELECT 23
    )

SELECT
    a.hour,
    IFNULL(COUNT, 0) AS COUNT
FROM hour_all as a
LEFT JOIN hour_count as c
ON a.HOUR = c.HOUR