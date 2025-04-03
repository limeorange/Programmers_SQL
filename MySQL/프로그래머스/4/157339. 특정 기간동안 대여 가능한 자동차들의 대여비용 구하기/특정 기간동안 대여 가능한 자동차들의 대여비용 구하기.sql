# 250403 목 PM 6:47
/*
오답포인트) 처음에 car_table 만들 때 대여 가능한 차량 선별하는 부분에서
불가능한 차량 목록을 뽑아서 NOT IN으로 걸러야 함
=> 현재 로직에서는 한 차량에 대해 가능한 날짜 history_id가 있으면 그 차량이 가능한 것으로 간주됨
=> 불가능한 history_id가 하나라도 있으면 그 차량은 안되는 것으로 판단해야 함
*/

WITH
    car_list AS (
    SELECT
        car_id
    FROM CAR_RENTAL_COMPANY_RENTAL_HISTORY
    WHERE start_date <= '2022-11-30' AND end_date >= '2022-11-01'
    ),
    
    car_table AS (
    SELECT
        h.car_id,
        car_type,
        daily_fee,
        start_date,
        end_date
    FROM CAR_RENTAL_COMPANY_RENTAL_HISTORY as h
    JOIN CAR_RENTAL_COMPANY_CAR as c
    ON h.car_id = c.car_id
    WHERE car_type in ('세단', 'SUV') AND
          h.car_id not in (SELECT car_id FROM car_list)
    ),
    
    plan_30 AS (
    SELECT
        *
    FROM car_rental_company_discount_plan
    WHERE DURATION_TYPE = '30일 이상'
    )

SELECT
    car_id,
    c.car_type,
    ROUND(daily_fee * (1-0.01*MAX(discount_rate)) * 30) AS FEE
FROM car_table as c
JOIN plan_30 as p
ON c.car_type = p.car_type
GROUP BY
    car_id,
    c.car_type
HAVING 500000 <= FEE AND FEE < 2000000
ORDER BY fee DESC, car_type, car_id DESC