# 251031 금 PM 8:26

# 1) NULL값 10으로 채워넣기
# 2) 평균 길이가 33cm 이상인 fish_type 구하기
# 3) 종류별로 분류하여 잡은 수, 최대 길이, 물고기 종류 출력하기

WITH t1 AS (
    SELECT
        fish_type,
        IFNULL(length, 10) AS length
    FROM fish_info
),
fish_33 AS (
    SELECT
        fish_type,
        AVG(length) AS avg_len
    FROM t1
    GROUP BY fish_type
    HAVING avg_len >= 33
)

SELECT
    count(*) AS fish_count,
    max(length) AS max_length,
    fish_type
FROM fish_info
WHERE fish_type in (SELECT fish_type FROM fish_33)
GROUP BY fish_type
ORDER BY fish_type