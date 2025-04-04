# 250404 금 PM 11:25

SELECT
    animal_id,
    name
FROM animal_ins
WHERE
    name LIKE '%el%' AND
    animal_type = 'Dog'
ORDER BY name