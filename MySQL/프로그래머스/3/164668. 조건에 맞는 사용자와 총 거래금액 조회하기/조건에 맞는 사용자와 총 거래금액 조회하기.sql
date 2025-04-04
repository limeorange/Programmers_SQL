# 250403 목 PM 3:50

SELECT
    b.writer_id,
    NICKNAME,
    SUM(PRICE) AS TOTAL_SALES
FROM USED_GOODS_BOARD AS b
JOIN USED_GOODS_USER AS u
ON b.writer_id = u.user_id
WHERE STATUS = 'DONE'
GROUP BY
    b.writer_id,
    NICKNAME
HAVING TOTAL_SALES >= 700000
ORDER BY TOTAL_SALES