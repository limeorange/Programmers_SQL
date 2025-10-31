# 251031 금 PM 10:30

# 1) 22/11/1 ~ 22/11/30까지 대여 불가능한 차량 구해서 ('세단', 'SUV') 차량 목록에서 빼주기 => 대여 가능한 '세단' or 'SUV' 차량 구함.
# 하나의 car_id에 대해 여러 his가 존재하기 때문에 불가능한 경우가 1가지라도 존재하면 그 차량은 대여가 불가능한 것임.

WITH car_not_list AS (
    SELECT
        h.car_id
    FROM CAR_RENTAL_COMPANY_RENTAL_HISTORY AS h
    JOIN CAR_RENTAL_COMPANY_CAR AS c
    ON h.car_id = c.car_id
    WHERE
        car_type in ('세단', 'SUV') AND
        ('2022-11-01' <= start_date AND start_date <= '2022-11-30') OR
        ('2022-11-01' <= end_date AND end_date <= '2022-11-30') OR
        (start_date < '2022-11-01' AND '2022-11-30' < end_date)
),
discount_list AS (
SELECT
    car_type,
    discount_rate
FROM CAR_RENTAL_COMPANY_DISCOUNT_PLAN
WHERE
    car_type in ('세단', 'SUV') AND
    duration_type = '30일 이상'
),
t1 AS (
    SELECT
        car_id,
        car_type,
        daily_fee,
        CASE
            WHEN car_type = '세단' 
            THEN (SELECT discount_rate FROM discount_list WHERE car_type = '세단')
            WHEN car_type = 'SUV' 
            THEN (SELECT discount_rate FROM discount_list WHERE car_type = 'SUV')
            ELSE 0
        END AS discount_rate
    FROM CAR_RENTAL_COMPANY_CAR
    WHERE
        car_type in ('세단', 'SUV') AND
        car_id not in (SELECT car_id FROM car_not_list)
)

SELECT
    car_id,
    car_type,
    ROUND(daily_fee * 30 * (1-0.01*discount_rate)) AS fee
FROM t1
WHERE
    500000 <= daily_fee * 30 * (1-0.01*discount_rate) AND
    daily_fee * 30 * (1-0.01*discount_rate) < 2000000
ORDER BY fee DESC, car_type, car_id DESC