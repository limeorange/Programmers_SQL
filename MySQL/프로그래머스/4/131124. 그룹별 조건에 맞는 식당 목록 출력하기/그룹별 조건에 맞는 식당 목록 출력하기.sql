# 250611 수 PM 4:17

WITH 
    cnt_table AS (
        SELECT
            member_id,
            COUNT(*) AS cnt
        FROM rest_review
        GROUP BY member_id
        ORDER BY cnt DESC
    ),
    
    member_list AS (
        SELECT
            member_id
        FROM rest_review
        GROUP BY member_id
        HAVING COUNT(*) = (SELECT cnt FROM cnt_table limit 1)
    )

SELECT
    member_name,
    review_text,
    DATE_FORMAT(review_date, '%Y-%m-%d') AS review_date
FROM rest_review AS r
JOIN member_profile AS m
ON r.member_id = m.member_id
WHERE r.member_id in (SELECT member_id FROM member_list)
ORDER BY review_date, review_text