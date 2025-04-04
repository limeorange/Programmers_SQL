# 250404 금 PM 10:08

SELECT
    DISTINCT h.car_id
FROM car_rental_company_rental_history as h
JOIN car_rental_company_car as c
ON h.car_id = c.car_id
WHERE
    start_date LIKE '%-10-%' AND
    car_type = '세단'
ORDER BY car_id DESC