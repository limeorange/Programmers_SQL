# 240927 금 AM 12:10

# HR_DEPARTMENT, HR_EMPLOYEES, HR_GRADE 테이블을 이용해 //
# 사원별 성과금 정보를 조회하려합니다. //
# 평가 점수별 등급과 등급에 따른 성과금 정보가 아래와 같을 때, //
# 사번(EMP_NO), 성명(EMP_NAME), 평가 등급(GRADE), 성과금(GRADE)을 조회하는 SQL문을 작성해주세요. //*
# 평가등급의 컬럼명은 GRADE로, 성과금의 컬럼명은 BONUS로 해주세요. //
# 결과는 사번 기준으로 오름차순 정렬해주세요. //

# 반기별로 평가 점수가 다르므로 평가 점수의 평균을 구해서(='기준점수') 성과금을 구해야 함!

SELECT
    t.EMP_NO,
    t.EMP_NAME,
    CASE
        WHEN SCORE >= 96 THEN "S"
        WHEN SCORE >= 90 THEN "A"
        WHEN SCORE >= 80 THEN "B"
        ELSE "C"
    END AS GRADE,
    CASE
        WHEN SCORE >= 96 THEN 0.2*SAL
        WHEN SCORE >= 90 THEN 0.15*SAL
        WHEN SCORE >= 80 THEN 0.1*SAL
        ELSE 0
    END AS BONUS
FROM
    (SELECT
        e.emp_no,
        e.emp_name,
        AVG(g.SCORE) AS SCORE,
        e.sal
    FROM HR_EMPLOYEES AS e
    JOIN HR_DEPARTMENT AS d
    ON e.dept_id = d.dept_id
    JOIN HR_GRADE AS g
    ON e.emp_no = g.emp_no
    GROUP BY
        e.emp_no,
        e.emp_name) AS t
ORDER BY EMP_NO