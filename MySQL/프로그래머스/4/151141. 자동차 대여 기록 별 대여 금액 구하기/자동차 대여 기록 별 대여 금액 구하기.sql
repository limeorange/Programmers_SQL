# 250611 수 PM 4:49

WITH
    truck_list AS (
    SELECT
        car_id, daily_fee
    FROM car_rental_company_car
    WHERE car_type = '트럭'
    ),
    truck_discount_rate AS (
    SELECT
        duration_type, discount_rate
    FROM car_rental_company_discount_plan
    WHERE car_type = '트럭'
    ),
    his_table AS (
    SELECT
        history_id,
        daily_fee,
        DATEDIFF(end_date, start_date)+1 AS day
    FROM car_rental_company_rental_history AS a
    JOIN truck_list AS b
    ON a.car_id = b.car_id
    ),
    fee_table AS (
    SELECT
        *,
        CASE
            WHEN day >= 90 THEN (SELECT discount_rate FROM truck_discount_rate WHERE duration_type = '90일 이상')
            WHEN day >= 30 THEN (SELECT discount_rate FROM truck_discount_rate WHERE duration_type = '30일 이상')
            WHEN day >= 7 THEN (SELECT discount_rate FROM truck_discount_rate WHERE duration_type = '7일 이상')
            ELSE 0
        END AS discount_rate
    FROM his_table
    )

SELECT
    history_id,
    ROUND(day * (1-discount_rate*0.01) * daily_fee) AS fee
FROM fee_table
ORDER BY fee DESC, history_id DESC