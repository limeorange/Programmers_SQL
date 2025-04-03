# 250403 목 PM 4:03

WITH max_info AS(
    SELECT
        FOOD_TYPE,
        MAX(FAVORITES) AS FAVORITES
    FROM REST_INFO
    GROUP BY FOOD_TYPE
)

SELECT
    FOOD_TYPE, REST_ID, REST_NAME, FAVORITES
FROM REST_INFO
WHERE (food_type, favorites) IN (SELECT food_type, favorites FROM max_info)
ORDER BY food_type DESC