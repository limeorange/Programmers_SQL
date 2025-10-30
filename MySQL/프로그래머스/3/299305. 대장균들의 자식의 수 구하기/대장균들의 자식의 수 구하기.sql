# 251030 목 PM 8:37

WITH t1 AS (
    SELECT
        parent_id,
        count(*) AS child_count
    FROM ecoli_data
    GROUP BY parent_id
    HAVING parent_id is not null
)

SELECT
    ID,
    IF(child_count is null, 0, child_count) AS child_count
FROM ecoli_data AS j1
LEFT JOIN t1 AS j2
ON j1.ID = j2.parent_id 
ORDER BY id