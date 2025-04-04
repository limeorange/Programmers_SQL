# 250404 금 PM 10:03

WITH user_list AS (
    SELECT
        writer_id
    FROM used_goods_board
    GROUP BY writer_id
    HAVING COUNT(*) >= 3
)

SELECT
    user_id,
    nickname,
    CONCAT(city, ' ', street_address1, ' ', street_address2) AS 전체주소,
    CONCAT('010-', SUBSTR(tlno, 4, 4), '-', SUBSTR(tlno, 8, 4)) AS 전화번호
FROM used_goods_user
WHERE user_id in (SELECT writer_id FROM user_list)
ORDER BY user_id DESC