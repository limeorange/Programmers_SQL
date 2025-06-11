# 250611 수 PM 4:15

WITH 
    cnt_table AS (
        SELECT
            member_id,
            COUNT(*) AS cnt
        FROM rest_review
        GROUP BY member_id
        ORDER BY cnt DESC
    ),
    
    max_cnt AS (
        SELECT
            MAX(cnt) AS max_cnt
        FROM cnt_table
    ),
    
    member_list AS (
        SELECT
            member_id
        FROM rest_review
        GROUP BY member_id
        HAVING COUNT(*) = (SELECT max_cnt FROM max_cnt)
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