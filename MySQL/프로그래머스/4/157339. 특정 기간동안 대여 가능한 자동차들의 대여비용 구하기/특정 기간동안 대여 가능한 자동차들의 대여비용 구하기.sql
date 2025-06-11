# 250611 수 PM 3:53

/*
car_rental_company_car: (대여 중인 = 전체) 자동차 정보
car_rental_company_rental_history: 자동차 대여 기록 정보
car_rental_company_discount_plan: 자동차 종류 별 대여 기간 종류 별 할인 정책 정보

오답포인트) "대여 이력이 없는" 차량도 고려해야 함.
오답포인트) HAVING는 group by나 집계가 없다면 사용 X. CTE 결과를 where로 걸기.
오답포인트) 대여 기록 정보 상으로 '불가능'한 car_id 구해서 not in으로 구하기!
- car_id에 대해서 한 history_id라도 불가능한 경우가 발견되면 대여가 불가능한 것임.
오답포인트) discount_rate 예시보고 하드코딩하면 안되고, 동적으로 변수화해서 넣어줘야 함. 
*/

WITH 
    not_car_list AS (
    SELECT
        DISTINCT car_id
    FROM car_rental_company_rental_history
    WHERE start_date <= '2022-11-30' AND
          end_date >= '2022-11-01'
    ),
        
    discount_rate AS (
    SELECT car_type, discount_rate
    FROM car_rental_company_discount_plan
    WHERE duration_type = '30일 이상'
    ),
        
    car_list AS (
    SELECT
        c.car_id,
        c.car_type,
        CASE
            WHEN c.car_type = '세단' THEN ROUND(daily_fee * (1-0.01*discount_rate) * 30)
            WHEN c.car_type = 'SUV' THEN ROUND(daily_fee * (1-0.01*discount_rate) * 30)
        END AS fee
    FROM car_rental_company_car AS c
    JOIN discount_rate AS d
    ON c.car_type = d.car_type
    WHERE c.car_type in ('세단', 'SUV') AND
          car_id not in (SELECT car_id FROM not_car_list)
    )
    
SELECT
    car_id,
    car_type,
    fee
FROM car_list
WHERE 500000 <= fee AND fee < 2000000
ORDER BY fee DESC, car_type, car_id DESC