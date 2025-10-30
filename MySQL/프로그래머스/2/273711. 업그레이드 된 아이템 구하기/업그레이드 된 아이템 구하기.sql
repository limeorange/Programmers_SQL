# 251030 목 PM 6:39

# 업그레이드가 가능하려면 그 자신이 parent_item_id가 되어야 함.
# rare_item 0, 1, 3, 4 중에서 3, 4는 업그레이드 정보가 없음.(불가능)

WITH rare_list AS (
    SELECT
        item_id
    FROM item_info
    WHERE rarity = 'RARE'
),
upgrade_list AS (
    SELECT
        *
    FROM item_tree
    WHERE
        parent_item_id in (SELECT item_id FROM rare_list)
    )

SELECT
    t1.item_id,
    item_name,
    rarity
FROM item_info AS t1
RIGHT JOIN upgrade_list AS t2
ON t1.item_id = t2.item_id
ORDER BY item_id DESC