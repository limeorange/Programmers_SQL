# 250403 목 PM 8:28

WITH
    F AS (
    SELECT SUM(CODE) AS CODE
    FROM SKILLCODES
    WHERE CATEGORY = 'Front End'
    )
    
SELECT
    ID, EMAIL, FIRST_NAME, LAST_NAME
FROM DEVELOPERS
WHERE SKILL_CODE & (SELECT CODE FROM F) > 0
ORDER BY ID