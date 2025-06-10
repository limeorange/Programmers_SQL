# 250610 화 PM 1:46

/*
- g1: 1세대 대장균 ID (1, 2) => 부모 ID가 NULL
- g2: 2세대 대장균 ID (3, 4, 5) => 부모 ID가 1, 2 (SELECT ID FROM g1)
- g3: 3세대 대장균 ID (6, 7) => 부모 ID가 3, 4, 5 (SELECT ID FROM g2)
*/

WITH
    g1 AS (
    SELECT ID
    FROM ecoli_data
    WHERE parent_id is NULL
    ),
    g2 AS (
    SELECT ID
    FROM ecoli_data
    WHERE parent_id in (SELECT ID FROM g1)
    ),
    g3 AS (
    SELECT ID
    FROM ecoli_data
    WHERE parent_id in (SELECT ID FROM g2)
    )

SELECT
    *
FROM g3
ORDER BY ID