# 241012 토 AM 12:37

# 1) 평균 길이가 33cm 이상인 물고기 타입 구하기 => 서브쿼리
# 2) 메인쿼리에서 종류별로 분류하여 잡은 수, 최대 길이, 물고기의 종류 출력

SELECT
    COUNT(*) AS FISH_COUNT,
    MAX(LENGTH) AS MAX_LENGTH,  
    FISH_TYPE
FROM FISH_INFO
WHERE
    FISH_TYPE IN
                (SELECT
                    FISH_TYPE
                FROM
                    (SELECT
                        FISH_TYPE,
                        CASE
                            WHEN LENGTH is null THEN 10
                            ELSE LENGTH
                        END AS LENGTH
                    FROM FISH_INFO
                    ) AS T
                GROUP BY FISH_TYPE
                HAVING AVG(LENGTH) >= 33)
GROUP BY FISH_TYPE
ORDER BY FISH_TYPE