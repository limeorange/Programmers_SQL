# 250611 수 AM 9:25

/*
1) 8~10월 누적 5회 이상 차량만 필터링
2) 누적 기준 필터 후 월별 집계
오답포인트) 월별 집계에 대해 '5회 이상' 기준 적용하고 있었음.
*/

WITH car_table AS (
    SELECT
        car_id
    FROM car_rental_company_rental_history
    WHERE start_date LIKE '2022-08%' OR
          start_date LIKE '2022-09%' OR
          start_date LIKE '2022-10%'
    GROUP BY car_id
    HAVING COUNT(*) >= 5
)

SELECT
    MONTH(start_date) AS month,
    car_id,
    COUNT(*) AS records
FROM car_rental_company_rental_history
WHERE car_id in (SELECT car_id FROM car_table) AND
      (start_date LIKE '2022-08%' OR
      start_date LIKE '2022-09%' OR
      start_date LIKE '2022-10%')
GROUP BY month, car_id
ORDER BY month, car_id DESC