# 250402 수 PM 9:24

WITH
    join_table AS(
    SELECT
        b.author_id,
        author_name,
        category,
        price,
        sales
    FROM BOOK_SALES AS s
    JOIN BOOK AS b
    ON s.book_id = b.book_id
    JOIN AUTHOR AS a
    ON b.author_id = a.author_id
    WHERE sales_date LIKE '2022-01%'
    )

SELECT
    author_id,
    author_name,
    category,
    SUM(price*sales) AS TOTAL_SALES
FROM join_table
GROUP BY
    author_id,
    author_name,
    category
ORDER BY author_id, category DESC