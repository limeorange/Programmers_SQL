# 250610 화 PM 4:08

SELECT
    COUNT(*) AS FISH_COUNT
FROM fish_info AS f
LEFT JOIN fish_name_info AS i
ON f.FISH_TYPE = i.FISH_TYPE
WHERE fish_name in ('BASS', 'SNAPPER')