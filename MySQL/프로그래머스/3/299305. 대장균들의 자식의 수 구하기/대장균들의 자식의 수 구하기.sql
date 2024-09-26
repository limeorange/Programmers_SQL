# 240924 TUE PM 7:05
# 대장균 개체의 ID(ID)와 자식의 수(CHILD_COUNT)를 출력하는 SQL 문을 작성해주세요.
# 자식이 없다면 자식의 수는 0으로 출력해주세요.
# (order by) 이때 결과는 개체의 ID 에 대해 오름차순 정렬해주세요.

SELECT
    e1.id,
    COUNT(e2.parent_id) AS CHILD_COUNT
    # *
FROM ECOLI_DATA as e1
LEFT JOIN ECOLI_DATA as e2
ON e1.id = e2.parent_id
GROUP BY e1.id
ORDER BY e1.id