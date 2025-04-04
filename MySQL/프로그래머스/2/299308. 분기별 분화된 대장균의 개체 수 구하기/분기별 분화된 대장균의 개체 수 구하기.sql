# 250404 금 PM 11:47

WITH
    month_data AS (
    SELECT
        MONTH(differentiation_date) AS MONTH
    FROM ecoli_data
    )

SELECT
    CASE
        WHEN month in (1, 2, 3) THEN '1Q'
        WHEN month in (4, 5, 6) THEN '2Q'
        WHEN month in (7, 8, 9) THEN '3Q'
        ELSE '4Q'
    END AS quarter,
    COUNT(*) AS ecoli_count
FROM month_data
GROUP BY quarter
ORDER BY quarter