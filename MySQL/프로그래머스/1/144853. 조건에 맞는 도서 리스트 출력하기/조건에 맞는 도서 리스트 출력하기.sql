# 251030 목 PM 5:38

SELECT
    book_id,
    DATE_FORMAT(published_date, '%Y-%m-%d') AS published_date
FROM BOOK
WHERE
    category = '인문' AND
    YEAR(published_date) = 2021
ORDER BY published_date