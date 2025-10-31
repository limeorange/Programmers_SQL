# 251031 금 PM 4:28

WITH t1 AS (
    SELECT
        author_id,
        category,
        price,
        sales
    FROM book AS b
    JOIN book_sales AS bs
    ON b.book_id = bs.book_id
    WHERE
        YEAR(sales_date) = 2022 AND
        MONTH(sales_date) = 1
)

SELECT
    t1.author_id,
    author_name,
    category,
    sum(price*sales) AS total_sales
FROM t1 AS t1
LEFT JOIN author AS t2
ON t1.author_id = t2.author_id
GROUP BY
    author_id,
    author_name,
    category
ORDER BY author_id, category DESC