# 250609 월 PM 11:13

SELECT
    i.rest_id,
    rest_name,
    food_type,
    favorites,
    address,
    ROUND(AVG(review_score), 2) AS SCORE
FROM rest_info AS i
JOIN rest_review AS r
ON i.rest_id = r.rest_id
WHERE address LIKE "서울%"
GROUP BY i.rest_id
ORDER BY score DESC, favorites DESC