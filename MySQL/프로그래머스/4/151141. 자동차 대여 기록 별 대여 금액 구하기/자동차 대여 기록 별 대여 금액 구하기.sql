# 250404 금 PM 9:05
# 오답포인트) 날짜 차이 계산시 '-' 사용하면 부정확 (단순 숫자 계산)
# => DATEDIFF(end_date, start_date) 활용!

WITH 
    his_table AS (
    SELECT
        history_id,
        h.car_id,
        daily_fee,
        car_type,
        DATEDIFF(end_date, start_date)+1 AS days
    FROM CAR_RENTAL_COMPANY_RENTAL_HISTORY as h
    JOIN CAR_RENTAL_COMPANY_CAR as c
    ON h.car_id = c.car_id
    WHERE car_type = '트럭'
    ),
    
    discount AS (
    SELECT
        duration_type,
        discount_rate
    FROM car_rental_company_discount_plan
    WHERE car_type = '트럭'
    ),
    
    fee_table AS (
    SELECT
        history_id,
        daily_fee,
        days,
        CASE
            WHEN (7 <= days AND days < 30) THEN 
            (SELECT discount_rate FROM discount WHERE duration_type = '7일 이상')
            WHEN (30 <= days AND days < 90) THEN 
            (SELECT discount_rate FROM discount WHERE duration_type = '30일 이상')
            WHEN (90 <= days) THEN 
            (SELECT discount_rate FROM discount WHERE duration_type = '90일 이상')
            ELSE 0
        END AS discount
    FROM his_table
    )

SELECT
    HISTORY_ID,
    ROUND(daily_fee * days * (1-0.01*discount)) AS FEE
FROM fee_table
ORDER BY fee DESC, history_id DESC