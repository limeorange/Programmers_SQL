# 250403 목 PM 2:36

WITH hr_table AS (
    SELECT
    e.EMP_NO,
    EMP_NAME,
    AVG(SCORE) AS SCORE,
    MAX(SAL) AS SAL
    FROM HR_EMPLOYEES AS e
    LEFT JOIN HR_GRADE AS g
    ON e.EMP_NO = g.EMP_NO
    GROUP BY
        e.EMP_NO,
        EMP_NAME
)

SELECT
    EMP_NO,
    EMP_NAME,
    CASE
        WHEN 96 <= SCORE THEN 'S'
        WHEN 90 <= SCORE THEN 'A'
        WHEN 80 <= SCORE THEN 'B'
        ELSE 'C'
    END AS GRADE,
    CASE
        WHEN 96 <= SCORE THEN SAL*0.2
        WHEN 90 <= SCORE THEN SAL*0.15
        WHEN 80 <= SCORE THEN SAL*0.1
        ELSE 0
    END AS BONUS    
FROM hr_table
ORDER BY EMP_NO