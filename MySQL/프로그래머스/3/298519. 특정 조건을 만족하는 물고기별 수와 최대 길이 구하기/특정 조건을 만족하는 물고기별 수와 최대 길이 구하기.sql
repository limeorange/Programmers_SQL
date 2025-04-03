# 250403 목 PM 5:26
/*
1) 10cm 이하 물고기 10cm로 채워주기 (CTE: fish_table)
- LENGTH 전처리 과정과 LENGTH를 활용한 GROUP BY + 집계 함수 작업 병행 불가 => CTE 분리 
2) 외부 테이블에서 GROUP BY + AVG, MAX, COUNT 연산 조건에 맞춰서 진행
*/
WITH fish_table AS(
    SELECT
        FISH_TYPE,
        IF(LENGTH is null, 10, LENGTH) AS LENGTH
    FROM FISH_INFO
)

SELECT
    COUNT(*) AS FISH_COUNT,
    MAX(LENGTH) AS MAX_LENGTH,
    FISH_TYPE
FROM fish_table
GROUP BY FISH_TYPE
HAVING AVG(LENGTH) >= 33
ORDER BY FISH_TYPE