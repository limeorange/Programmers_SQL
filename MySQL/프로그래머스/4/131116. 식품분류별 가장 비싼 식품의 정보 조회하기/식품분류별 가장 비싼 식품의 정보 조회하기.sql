# 250610 화 PM 5:14

/*
(카테고리, 최고가) 정보를 CTE로 먼저 구한 뒤, WHERE 조건으로 식품 정보(product_name)를 추출해야 함.
처음에 GROUP BY로 카테고리별 최고가 정보 구할 때 SELECT 문에 product_name 적어줘도
이는 최고가에 대한 product_name이 아닐 수 있음.
*/

WITH food_info AS (
    SELECT
        category,
        MAX(price) AS max_price
    FROM food_product
    GROUP BY category
    HAVING category in ('과자', '국', '김치', '식용유')
)

SELECT
    category, price AS max_price, product_name
FROM food_product
WHERE (category, price) in (SELECT category, max_price FROM food_info)
ORDER BY max_price DESC