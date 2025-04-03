# 250403 목 PM 8:25

WITH
    i AS (
    SELECT ANIMAL_ID
    FROM ANIMAL_INS
    WHERE SEX_UPON_INTAKE LIKE 'Intact%' 
    )
    
SELECT
    o.ANIMAL_ID,
    o.ANIMAL_TYPE,
    o.NAME
FROM ANIMAL_OUTS as o
JOIN i
ON o.animal_id = i.animal_id
WHERE SEX_UPON_OUTCOME NOT LIKE 'Intact%'