# 250402 수 PM 9:11

WITH 
    year_max AS (
    SELECT
        YEAR(differentiation_date) AS year,
        MAX(size_of_colony) AS max_size
    FROM ECOLI_DATA
    GROUP BY year
),
    ecoli AS (
    SELECT
        YEAR(differentiation_date) AS year,
        SIZE_OF_COLONY,
        ID
    FROM ECOLI_DATA
    )

SELECT
    e.YEAR,
    max_size - size_of_colony AS YEAR_DEV,
    ID
FROM ecoli as e
JOIN year_max as y
ON e.year = y.year
ORDER BY e.year, year_dev