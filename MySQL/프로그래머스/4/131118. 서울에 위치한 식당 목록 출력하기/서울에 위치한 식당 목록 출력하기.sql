# 251030 목 PM 7:51

WITH seoul_list AS (
    SELECT
        rest_id,
        rest_name,
        food_type,
        favorites,
        address
    FROM rest_info
    WHERE address LIKE '서울%'
)

SELECT
    t1.rest_id,
    rest_name,
    food_type,
    favorites,
    address,
    ROUND(AVG(review_score), 2) AS score
FROM seoul_list AS t1
JOIN rest_review AS t2
ON t1.rest_id = t2.rest_id
GROUP BY
    t1.rest_id,
    rest_name,
    food_type,
    favorites,
    address
ORDER BY score DESC, favorites DESC