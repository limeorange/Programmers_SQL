# 251031 금 PM 5:48

# 1) 대여 가능 여부 판별 기준 => 부등호로 체크.
# 2) 하나의 차량 id에 대해 여러 기록이 존재할 수 있음. => 한 경우라도 '대여 중'이 있으면 해당 차량은 '대여 가능'이 아닌 '대여 중'으로 표시해야 함. => 0, 1로 할당 후 MAX로 합집합 논리 적용.

WITH t1 AS (
    SELECT
        car_id,
        start_date,
        end_date,
        CASE
            WHEN end_date < '2022-10-16' OR start_date > '2022-10-16' THEN 0
            ELSE 1
        END AS availability
    FROM car_rental_company_rental_history
)

SELECT
    car_id,
    IF(MAX(availability)=1, '대여중', '대여 가능') AS avalability
FROM t1
GROUP BY car_id
ORDER BY car_id DESC