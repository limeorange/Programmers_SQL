# 250610 화 PM 10:35 / IF(조건, A, B)

SELECT
    ROUND(SUM(IF(length is null, 10, length))/COUNT(*), 2) AS average_length 
FROM fish_info