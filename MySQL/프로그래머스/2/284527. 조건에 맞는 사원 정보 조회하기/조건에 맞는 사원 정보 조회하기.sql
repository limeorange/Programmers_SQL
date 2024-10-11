# 241012 토 AM 1:50

SELECT
    G.SCORE,
    G.EMP_NO,
    E.EMP_NAME,
    E.POSITION,
    E.EMAIL
FROM HR_EMPLOYEES AS E
JOIN 
    (SELECT
        EMP_NO,
        SUM(SCORE) AS SCORE
    FROM HR_GRADE
    WHERE YEAR = 2022
    GROUP BY EMP_NO
    HAVING SCORE = (
                SELECT
                    MAX(TOTAL_SCORE) AS MAX_SCORE
                FROM
                    (SELECT
                        EMP_NO,
                        SUM(SCORE) AS TOTAL_SCORE
                    FROM HR_GRADE
                    WHERE YEAR = 2022
                    GROUP BY EMP_NO
                    ORDER BY TOTAL_SCORE DESC) AS T
                )) AS G
ON E.EMP_NO = G.EMP_NO