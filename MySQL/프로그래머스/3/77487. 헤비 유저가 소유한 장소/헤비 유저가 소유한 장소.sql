# 250406 일 AM 12:44

WITH
    heavy_list AS (
    SELECT
        host_id
    FROM places
    GROUP BY host_id
    HAVING count(*) >= 2
    )

SELECT
    *
FROM places
WHERE host_id in (SELECT host_id FROM heavy_list)
ORDER BY id