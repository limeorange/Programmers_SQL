# 251030 목 PM 9:17

# (fish_type, max_length) 기준으로 해당 물고기 'ID'를 출력해야 함.

WITH t1 AS (
    SELECT 
        fish_type,
        MAX(LENGTH) AS length
    FROM fish_info
    GROUP BY fish_type
)

SELECT
    id,
    fish_name,
    length
FROM fish_info AS j1
JOIN fish_name_info AS j2
ON j1.fish_type = j2.fish_type
WHERE (j1.fish_type, length) in (SELECT fish_type, length FROM t1)
ORDER BY id