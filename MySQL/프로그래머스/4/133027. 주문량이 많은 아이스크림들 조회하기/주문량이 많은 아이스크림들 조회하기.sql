# 240927 금 AM 1:58

# 7월 아이스크림 총 주문량과 상반기의 아이스크림 총 주문량을 더한 값이 큰 순서대로 상위 3개의 맛을 조회하는 SQL 문을 작성해주세요.

# 같은 FLAVOR여도 SHIPMENT_ID가 달라질 수 있음 => 두 테이블은 1~6월, 7월로 TOTAL_ORDER가 겹치지 않으므로 FLAVOR, TOTAL_ORDER 기준으로 UNION ALL(중복포함)해서 한 테이블로 만들기
# 통합된 테이블에서 FLAVOR별로 group by해서 SUM(TOTAL_ORDER) 내림차순으로 top3 추출

SELECT
    t.FLAVOR
FROM
    (SELECT
        FLAVOR,
        TOTAL_ORDER
    FROM FIRST_HALF
    UNION ALL
    SELECT
        FLAVOR,
        TOTAL_ORDER
    FROM JULY) AS t
GROUP BY t.FLAVOR
ORDER BY SUM(TOTAL_ORDER) DESC
LIMIT 3