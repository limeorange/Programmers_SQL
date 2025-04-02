# 250402 수 PM 6:14
/*
- g1: 1세대 대장균 ID (1, 2) => 부모 ID가 NULL
- g2: 2세대 대장균 ID (3, 4, 5) => 부모 ID가 1, 2
- g3: 3세대 대장균 ID (6, 7) => 부모 ID가 3, 4, 5
*/

WITH 
    g1 AS (
    SELECT ID
    FROM ECOLI_DATA
    WHERE PARENT_ID is NULL
    ),
    g2 AS (
    SELECT ID
    FROM ECOLI_DATA
    WHERE PARENT_ID IN (SELECT ID FROM g1)
    ),
    g3 AS (
    SELECT ID
    FROM ECOLI_DATA
    WHERE PARENT_ID IN (SELECT ID FROM g2)
    )

SELECT
    ID
FROM g3
ORDER BY ID