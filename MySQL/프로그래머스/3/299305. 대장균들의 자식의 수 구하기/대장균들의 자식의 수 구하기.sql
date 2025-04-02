# 250402 수 PM 4:01

SELECT
    parent.ID,
    count(child.parent_id) AS CHILD_COUNT
FROM ECOLI_DATA as parent
LEFT JOIN ECOLI_DATA as child
ON parent.id = child.parent_id
GROUP BY parent.ID
ORDER BY parent.ID