# 250403 목 PM 3:57

SELECT
    CATEGORY,
    SUM(SALES) AS TOTAL_SALES
FROM BOOK_SALES AS s
JOIN BOOK AS b
ON s.book_id = b.book_id
WHERE SALES_DATE LIKE '2022-01%'
GROUP BY CATEGORY
ORDER BY CATEGORY