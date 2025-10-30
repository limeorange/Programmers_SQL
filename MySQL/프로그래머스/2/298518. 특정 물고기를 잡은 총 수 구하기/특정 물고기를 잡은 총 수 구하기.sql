# 251030 목 PM 6:59

WITH type_list AS (
    SELECT
        fish_type
    FROM fish_name_info
    WHERE 
        fish_name in ('BASS', 'SNAPPER')
)

SELECT
    COUNT(*) AS FISH_COUNT
FROM fish_info
WHERE fish_type in (SELECT fish_type FROM type_list)