# 250402 수 AM 12:09
/* 
1) CTE 이용 => 업그레이드 가능한 아이템 목록 구함 (not_item)
2) WHERE절의 'not in'으로 not_item에 속하지 않은 아이템 정보 출력
*/

WITH not_item AS (
    SELECT
    DISTINCT ITEM_NAME
    FROM ITEM_TREE AS t
    JOIN ITEM_INFO AS i
    ON t.parent_item_id = i.item_id
)

SELECT
    ITEM_ID,
    ITEM_NAME,
    RARITY
FROM ITEM_INFO
WHERE ITEM_NAME not in (SELECT ITEM_NAME FROM not_item)
ORDER BY ITEM_ID DESC