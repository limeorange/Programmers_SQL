# 251031 금 PM 12:01

WITH not_list AS (
    SELECT
        DISTINCT parent_item_id
    FROM ITEM_TREE
    WHERE
        parent_item_id is not null
)

SELECT
    item_id,
    item_name,
    rarity
FROM item_info
WHERE
    ITEM_ID not in (SELECT parent_item_id FROM not_list)
ORDER BY item_id DESC