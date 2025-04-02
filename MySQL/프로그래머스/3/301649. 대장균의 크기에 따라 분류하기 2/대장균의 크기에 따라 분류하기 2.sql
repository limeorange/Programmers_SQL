# 250402 수 PM 4:47
/*
PERCENT_RANK() OVER (ORDER BY 컬럼명) AS 새로운_컬럼명
=> 새로운_컬럼명에서 예약어(rank, order 등) 안 쓰도록 주의!
*/

WITH 
    RANK_P AS (
    SELECT
    ID,
    PERCENT_RANK() OVER (ORDER BY SIZE_OF_COLONY DESC) AS rank_p
    FROM ECOLI_DATA
    )

SELECT
    ID,
    CASE
        WHEN rank_p <= 0.25 THEN 'CRITICAL'
        WHEN rank_p <= 0.5 THEN 'HIGH'
        WHEN rank_p <= 0.75 THEN 'MEDIUM'
        ELSE 'LOW'
    END AS 'COLONY_NAME'
FROM RANK_P
ORDER BY ID