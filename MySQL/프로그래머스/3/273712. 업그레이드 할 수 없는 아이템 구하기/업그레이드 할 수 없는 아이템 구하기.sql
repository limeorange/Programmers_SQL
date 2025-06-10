# 250610 화 PM 10:07

/*
1. 업그레이드 가능한 item_id 구하기
2. not in 으로 업그레이드 불가능한 item_id 구하기
*/

WITH upgrade_item_id AS (
    SELECT
        DISTINCT parent_item_id AS item_id
    FROM item_tree
    WHERE parent_item_id is not null
)

SELECT
    item_id, item_name, rarity
FROM item_info
WHERE item_id not in (SELECT item_id FROM upgrade_item_id)
ORDER BY item_id DESC