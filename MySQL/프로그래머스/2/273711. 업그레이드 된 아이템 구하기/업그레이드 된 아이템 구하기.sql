# 250329 토 AM 11:06 / CTE 사용

/*
아이템의 희귀도가 'RARE'인 아이템들의 모든 다음 업그레이드 아이템의 
ITEM_ID, ITEM_NAME, RARITY를 출력하는 SQL 문을 작성해 주세요.
이때 결과는 아이템 ID를 기준으로 내림차순 정렬주세요.

1) 희귀도가 rare인 item_id 목록 구하기
2) ITEM_TREE 테이블에서 1)에서 구한 item_id에 해당되는 parent_item_id만 추출해서 WHERE 조건으로 추가
3) ITEM_INFO 테이블, ITEM_TREE 테이블을 item_id 기준으로 JOIN 하기
4) item_id, item_name, rarity 출력하기
5) item_id 기준으로 내림차순 정렬하기
*/

WITH RARE_ITEMS AS (
    SELECT ITEM_ID
    FROM ITEM_INFO
    WHERE RARITY = 'RARE'
)

SELECT
    i.item_id, item_name, rarity
FROM ITEM_INFO as i
JOIN ITEM_TREE as t
ON i.item_id = t.item_id
WHERE t.parent_item_id IN (SELECT ITEM_ID FROM RARE_ITEMS)
ORDER BY i.item_id DESC