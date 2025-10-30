# 251030 목 PM 6:02

# COUNT(*)을 출력했을 때 데이터가 많아서 노출이 안되는 것이었음.
# CTE로 만들어서 WHERE로 조회해보니 뜸.

# 1) group by만 사용: 고유 조합(그룹 단위) 나열
# 2) group by + 집계함수: 그룹별 요약 통계
# 3) group by + having: 그룹에 조건 걸 때 사용 (중복횟수 필터링 등)

SELECT
    user_id,
    product_id
FROM online_sale
GROUP BY user_id, product_id
HAVING count(*) >= 2
ORDER BY user_id, product_id DESC