# 250610 화 PM 8:47

/*
1. A -> B -> C 순으로 개발자 등급 정보 구해서 합치기
- Front End 스킬코드 합 구하기 (A grade 구할 때 사용)
*/

WITH
    front_code AS (
    SELECT
        SUM(code) AS code
    FROM skillcodes
    WHERE category = 'Front End'
    ),
    
    a_grade AS (
    SELECT
        *,
        'A' AS grade
    FROM developers
    WHERE skill_code & (SELECT code FROM front_code) and
          skill_code & (SELECT code FROM skillcodes WHERE name = 'Python')
    ),
    
    b_grade AS (
    SELECT
        *,
        'B' AS grade
    FROM developers
    WHERE id not in (SELECT id FROM a_grade) and
          skill_code & (SELECT code FROM skillcodes WHERE name = 'C#')
    ),
    
    c_grade AS (
    SELECT
        *,
        'C' AS grade
    FROM developers
    WHERE id not in (SELECT id FROM a_grade) and
          id not in (SELECT id FROM b_grade) and
          skill_code & (SELECT code FROM front_code)
    ),
    
    union_table AS (
    SELECT * FROM a_grade UNION
    SELECT * FROM b_grade UNION
    SELECT * FROM c_grade
    )
    
SELECT
    grade, id, email
FROM union_table
ORDER BY grade, id