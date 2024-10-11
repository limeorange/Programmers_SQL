# 241012 토 AM 12:51

SELECT
    car_type,
    COUNT(*) AS CARS
FROM CAR_RENTAL_COMPANY_CAR
WHERE(
    (CASE WHEN options LIKE '%통풍시트%' THEN 1 ELSE 0 END)+
    (CASE WHEN options LIKE '%열선시트%' THEN 1 ELSE 0 END)+
    (CASE WHEN options LIKE '%가죽시트%' THEN 1 ELSE 0 END)
) >= 1
GROUP BY car_type
ORDER BY car_type