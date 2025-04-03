# 250403 목 PM 7:02

WITH
    max_cnt AS(
    SELECT
        MEMBER_ID,
        COUNT(*) AS CNT
    FROM REST_REVIEW
    GROUP BY MEMBER_ID
    ORDER BY CNT DESC
    ),
    
    max_member_id AS (
    SELECT
        member_id
    FROM max_cnt
    WHERE cnt = (SELECT cnt FROM max_cnt LIMIT 1)
    )

SELECT
    member_name,
    review_text,
    DATE_FORMAT(review_date, '%Y-%m-%d') AS review_date
FROM REST_REVIEW AS r
JOIN MEMBER_PROFILE AS p
ON r.member_id = p.member_id
WHERE r.member_id in (SELECT member_id FROM max_member_id)
ORDER BY review_date, review_text