# 250610 화 PM 3:42

/*
1) 아이템의 희귀도가 'RARE'인 아이템 찾기: item_id 0, 1, 3, 4
2) 업그레이드된 아이템: 0 -> 1, 2 / 1 -> 3, 4
3) 업그레이드된 아이템 ID(1, 2, 3, 4)까지 CTE로 구해서 item_info에서 정보 출력하기
*/

WITH
    rare_item AS (
        SELECT item_id
        FROM item_info
        WHERE rarity = 'RARE'
    ),
    upgraded_item AS (
        SELECT item_id
        FROM item_tree
        WHERE parent_item_id in (SELECT item_id FROM rare_item)
    )

SELECT
    item_id,
    item_name,
    rarity
FROM item_info
WHERE item_id in (SELECT item_id FROM upgraded_item)
ORDER BY item_id DESC