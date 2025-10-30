# 251030 목 PM 6:51

WITH p_code AS (
    SELECT
        code
    FROM skillcodes
    WHERE name = 'Python'
), 
    c_code AS (
    SELECT
        code
    FROM skillcodes
    WHERE name = 'C#'
)

SELECT
    id,
    email,
    first_name,
    last_name
FROM developers
WHERE (skill_code & (SELECT code FROM p_code)) OR
       (skill_code & (SELECT code FROM c_code))
ORDER BY id