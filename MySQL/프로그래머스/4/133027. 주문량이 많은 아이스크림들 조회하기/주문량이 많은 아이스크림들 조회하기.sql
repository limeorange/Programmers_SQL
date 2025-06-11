# 250611 수 PM 2:44

WITH total AS (
    SELECT
        *
    FROM first_half
    UNION ALL
    SELECT
        *
    FROM july
)

SELECT
    flavor
FROM total
GROUP BY flavor
ORDER BY SUM(total_order) DESC
LIMIT 3