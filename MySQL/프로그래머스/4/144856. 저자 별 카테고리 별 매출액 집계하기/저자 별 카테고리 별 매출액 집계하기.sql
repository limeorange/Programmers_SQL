# 250610 화 PM 4:58

WITH t1 AS (
    SELECT
        s.book_id, author_id, category, sales, price
    FROM book_sales AS s
    JOIN book AS b
    ON s.book_id = b.book_id
    WHERE YEAR(sales_date) = 2022 and MONTH(sales_date) = 1
)

SELECT
    t.author_id, author_name, category,
    SUM(sales*price) AS total_sales
FROM t1 AS t
JOIN author AS a
ON t.author_id = a.author_id
GROUP BY t.author_id, author_name, category
ORDER BY author_id, category DESC