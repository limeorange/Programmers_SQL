# 251030 목 PM 8:22

# 1세대: 1, 2 (P_ID = NULL)
# 2세대: 3, 4, 5 (P_ID in (1, 2))
# 3세대: 6, 7 (P_ID in (3, 4, 5))

WITH g1 AS (
    SELECT
        id
    FROM ecoli_data
    WHERE parent_id is NULL
), g2 AS (
    SELECT
        *
    FROM ecoli_data
    WHERE parent_id in (SELECT id FROM g1)
)

SELECT
    id
FROM ecoli_data
WHERE parent_id in (SELECT id FROM g2)
ORDER BY id