# 250611 수 AM 9:41

/*
1) 10cm 이하 물고기 10cm로 전처리
2) 종류별 평균 길이가 33cm 이상인 물고기 분류
3) 종류별 잡은 수, 최대길이, 종류 출력
*/

WITH fish_33 AS (
    SELECT
        fish_type,
        AVG(IFNULL(length, 10)) AS length
    FROM fish_info
    GROUP BY fish_type
    HAVING length >= 33
)

SELECT
    COUNT(*) AS fish_count,
    MAX(length) AS max_length,
    fish_type
FROM fish_info
WHERE fish_type in (SELECT fish_type FROM fish_33)
GROUP BY fish_type
ORDER BY fish_type