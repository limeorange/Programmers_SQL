# 251031 금 PM 11:26

WITH max_cnt AS (
    SELECT
        member_id,
        COUNT(*) AS cnt
    FROM REST_REVIEW
    GROUP BY member_id
    ORDER BY cnt DESC
    LIMIT 1
), 
max_list AS (
    SELECT
        member_id,
        COUNT(*) AS cnt
    FROM REST_REVIEW
    GROUP BY member_id
    HAVING cnt = (SELECT cnt FROM max_cnt)
)

SELECT
    MEMBER_NAME,
    review_text,
    DATE_FORMAT(review_date, '%Y-%m-%d') AS review_date
FROM REST_REVIEW AS r
LEFT JOIN MEMBER_PROFILE AS m
ON r.member_id = m.member_id
WHERE r.member_id in (SELECT member_id FROM max_list)
ORDER BY review_date, review_text