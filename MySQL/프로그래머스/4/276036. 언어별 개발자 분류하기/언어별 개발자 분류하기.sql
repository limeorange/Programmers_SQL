# 250403 목 PM 3:33

/*
오답포인트) A, B, C 테이블을 각각 구해서 UNION하는 방법은 중복 처리가 제대로 안됨
1) A, B, C 등급 조건 처리 (CASE WHEN)
2) WHERE 조건으로 A, B, C 등급에 해당하지 않는 개발자 제외하기
- not null 조건 주려면 서브쿼리나 CTE로 작성해야 함
*/

WITH
    F AS (
    SELECT SUM(CODE) AS CODE
    FROM SKILLCODES
    WHERE CATEGORY = 'Front End'
    ),
    C AS (
    SELECT CODE AS CODE
    FROM SKILLCODES
    WHERE NAME = 'C#'
    ),
    P AS (
    SELECT SUM(CODE) AS CODE
    FROM SKILLCODES
    WHERE NAME = 'Python'
    ),
    dev_table AS (
    SELECT
    CASE
        WHEN SKILL_CODE & (SELECT CODE FROM F) > 0 AND
             SKILL_CODE & (SELECT CODE FROM P) > 0 THEN 'A'
        WHEN SKILL_CODE & (SELECT CODE FROM C) > 0 THEN 'B'
        WHEN SKILL_CODE & (SELECT CODE FROM F) > 0 AND
             SKILL_CODE & (SELECT CODE FROM P) = 0 THEN 'C'
    END AS GRADE,
    ID,
    EMAIL
    FROM DEVELOPERS
    )

SELECT
    *
FROM dev_table
WHERE GRADE is not NULL
ORDER BY GRADE, ID