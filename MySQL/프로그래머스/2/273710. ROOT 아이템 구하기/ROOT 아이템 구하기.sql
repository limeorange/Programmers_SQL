# 250610 화 PM 10:31

WITH root_item_id AS (
    SELECT
        item_id
    FROM item_tree
    WHERE parent_item_id is NULL
)

SELECT
    r.item_id,
    item_name
FROM item_info AS i
JOIN root_item_id AS r
ON i.item_id = r.item_id
ORDER BY item_id