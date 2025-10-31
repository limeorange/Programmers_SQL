# 251031 금 PM 9:46

WITH t1 AS (
    SELECT
        history_id,
        h.car_id,
        start_date,
        end_date,
        DATEDIFF(end_date, start_date)+1 AS duration,
        daily_fee
    FROM CAR_RENTAL_COMPANY_RENTAL_HISTORY AS h
    LEFT JOIN CAR_RENTAL_COMPANY_CAR AS c
    ON h.car_id = c.car_id
    WHERE car_type = '트럭'
),
truck_plan AS (
    SELECT
        *
    FROM CAR_RENTAL_COMPANY_DISCOUNT_PLAN
    WHERE
        car_type = '트럭'
),
t2 AS (
    SELECT
        *,
        CASE
            WHEN duration >= 90 THEN (SELECT discount_rate FROM truck_plan WHERE duration_type = '90일 이상')
            WHEN duration >= 30 THEN (SELECT discount_rate FROM truck_plan WHERE duration_type = '30일 이상')
            WHEN duration >= 7 THEN (SELECT discount_rate FROM truck_plan WHERE duration_type = '7일 이상')
            ELSE 0
        END AS discount_rate
    FROM t1
)

SELECT
    history_id,
    ROUND(daily_fee * duration * (1-0.01*discount_rate)) AS fee
FROM t2
ORDER BY fee DESC, history_id DESC