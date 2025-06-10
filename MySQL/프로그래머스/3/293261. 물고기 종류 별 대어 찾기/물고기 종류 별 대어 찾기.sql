# 250610 화 PM 10:20

WITH max_info AS (
    SELECT
        fish_type,
        max(length) AS length
    FROM fish_info
    GROUP BY fish_type
)

SELECT
    id,
    fish_name,
    length
FROM fish_info AS f
JOIN fish_name_info AS n
ON f.fish_type = n.fish_type
WHERE (f.fish_type, f.length) in (SELECT fish_type, length FROM max_info)
ORDER BY id