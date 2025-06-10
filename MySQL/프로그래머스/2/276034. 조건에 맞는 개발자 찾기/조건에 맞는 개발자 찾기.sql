# 250610 화 PM 4:00

WITH
    p_code AS (
        SELECT CODE
        FROM skillcodes
        WHERE name = 'Python'
    ),
    c_code AS (
        SELECT CODE
        FROM skillcodes
        WHERE name = 'C#'
    )

SELECT
    id,
    email,
    first_name,
    last_name
FROM developers
WHERE
    skill_code & (SELECT code FROM p_code)
    or
    skill_code & (SELECT code FROM c_code)
ORDER BY id