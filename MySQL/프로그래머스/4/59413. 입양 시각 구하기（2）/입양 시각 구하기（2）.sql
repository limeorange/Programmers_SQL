# 240926 목 PM 9:22

# 0시부터 23시까지, 각 시간대별로 입양이 몇 건이나 발생했는지 조회하는 SQL문을 작성해주세요.
# 이때 결과는 시간대 순으로 정렬해야 합니다.

# with문 사용해서 서브쿼리 생성
# 서브쿼리 생성할 때 변수 사용
# 입양이 몇 건 발생 => animal_id 기준으로 COUNT

# 방법1) 변수 사용
SET @hour = -1;
WITH h AS (
    SELECT @hour := @hour + 1 AS HOUR
    FROM information_schema.COLUMNS
    LIMIT 24
)

SELECT
    h.hour,
    COUNT(a.animal_id) AS COUNT
FROM h
LEFT JOIN ANIMAL_OUTS AS a
ON h.hour = HOUR(a.datetime)
GROUP BY h.hour
ORDER BY h.hour

# 방법2) UNION ALL로 서브쿼리 생성
# SELECT
#     h.hour,
#     count(animal_id) AS COUNT
# FROM 
#     (SELECT 0 AS HOUR UNION ALL
#     SELECT 1 UNION ALL
#     SELECT 2 UNION ALL
#     SELECT 3 UNION ALL
#     SELECT 4 UNION ALL
#     SELECT 5 UNION ALL
#     SELECT 6 UNION ALL
#     SELECT 7 UNION ALL
#     SELECT 8 UNION ALL
#     SELECT 9 UNION ALL
#     SELECT 10 UNION ALL
#     SELECT 11 UNION ALL
#     SELECT 12 UNION ALL
#     SELECT 13 UNION ALL
#     SELECT 14 UNION ALL
#     SELECT 15 UNION ALL
#     SELECT 16 UNION ALL
#     SELECT 17 UNION ALL
#     SELECT 18 UNION ALL
#     SELECT 19 UNION ALL
#     SELECT 20 UNION ALL
#     SELECT 21 UNION ALL
#     SELECT 22 UNION ALL
#     SELECT 23) AS h
# LEFT JOIN ANIMAL_OUTS AS a
# ON h.hour = HOUR(a.datetime)
# GROUP BY h.hour
# ORDER BY h.hour