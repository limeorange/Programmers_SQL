# 250610 화 PM 2:03

SELECT
    parent.ID,
    count(child.parent_id) AS child_count
FROM ecoli_data as parent
LEFT JOIN ecoli_data as child
ON parent.id = child.parent_id
GROUP BY parent.ID
ORDER BY parent.ID