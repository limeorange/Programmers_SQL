# 250404 금 PM 10:15

SELECT
    o.animal_id,
    o.name
FROM animal_outs as o
JOIN animal_ins as i
ON o.animal_id = i.animal_id
ORDER BY DATEDIFF(o.datetime, i.datetime) DESC
LIMIT 2