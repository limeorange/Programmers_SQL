# 250610 화 PM 8:04

/*
1) 평가등급 계산
2) 성과금 계산
3) 사번, 성명, 평가등급, 성과금 출력
*/

WITH grade_table AS (
    SELECT
        emp_no,
        CASE
            WHEN AVG(score) >= 96 THEN 'S'
            WHEN AVG(score) >= 90 THEN 'A'
            WHEN AVG(score) >= 80 THEN 'B'
            ELSE 'C'
        END AS grade
    FROM hr_grade
    GROUP BY emp_no
)

SELECT
    g.emp_no,
    emp_name,
    grade,
    CASE
        WHEN grade = 'S' THEN sal * 0.2
        WHEN grade = 'A' THEN sal * 0.15
        WHEN grade = 'B' THEN sal * 0.1
        ELSE 0
    END AS bonus        
FROM grade_table AS g
JOIN hr_employees AS e
ON g.emp_no = e.emp_no
ORDER BY emp_no