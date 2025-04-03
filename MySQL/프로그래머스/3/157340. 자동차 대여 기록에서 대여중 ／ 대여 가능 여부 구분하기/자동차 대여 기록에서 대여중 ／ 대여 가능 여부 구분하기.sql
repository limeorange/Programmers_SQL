# 250403 목 PM 4:20

WITH car_table AS (
    SELECT
        car_id,
        MAX(CASE
            WHEN start_date <= '2022-10-16' AND
            DATE_FORMAT('2022-10-16', '%Y-%m-%d') <= end_date THEN 1
            ELSE 0
        END) AS AVAILABILITY
    FROM CAR_RENTAL_COMPANY_RENTAL_HISTORY
    GROUP BY car_id
    ORDER BY car_id
)

SELECT
    CAR_ID,
    IF(availability = 1, '대여중', '대여 가능') AS AVAILABILITY
FROM car_table
ORDER BY CAR_ID DESC