# 251031 금 PM 8:03

# 오답포인트) 월별 5회 이상이 아니라 8~10월 합해서 5회 이상임.
# 오답포인트) t1의 car_id 조건을 외부 테이블에서 이용할 때 8~10월 날짜 조건도 다시 걸어줘야 함.
# 1) 8~10월 동안 5회 이상인 car_list 구하기 => CTE
# 2) 해당 car_list에 대해 월별 자동차 ID별 대여 횟수 구하기

WITH t1 AS (
    SELECT
        car_id,
        COUNT(*) AS records
    FROM car_rental_company_rental_history
    WHERE
        '2022-08-01' <= start_date AND
        start_date <= '2022-10-31'
    GROUP BY car_id
    HAVING COUNT(*) >= 5
)

SELECT
    MONTH(start_date) AS month,
    car_id,
    COUNT(*) AS records
FROM car_rental_company_rental_history
WHERE car_id in (SELECT car_id FROM t1) AND
    '2022-08-01' <= start_date AND
    start_date <= '2022-10-31'
GROUP BY month, car_id
ORDER BY month, car_id DESC