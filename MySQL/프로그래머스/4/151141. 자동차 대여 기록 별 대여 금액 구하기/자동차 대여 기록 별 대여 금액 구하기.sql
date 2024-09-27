# 240928 토 AM 1:35

# 자동차 종류가 '트럭'인 자동차의 대여 기록에 대해서 
# 대여 기록 별로 대여 금액(컬럼명: FEE)을 구하여 
# 대여 기록 ID와 대여 금액 리스트를 출력하는 SQL문을 작성해주세요.
# 결과는 대여 금액을 기준으로 내림차순 정렬하고, 
# 대여 금액이 같은 경우 대여 기록 ID를 기준으로 내림차순 정렬해주세요.

# 1. 특정 열의 null 값 처리 => COALESCE(expr1, expr2, ...) 사용
# 2. 날짜 간 차이는 '-' 사용 불가 !! => DATEDIFF(end_date, start_date) 사용

SELECT
    HISTORY_ID,
    round(sum(daily_fee*(1-0.01*COALESCE(discount_rate, 0))*diff)) AS FEE
FROM
    (SELECT
        h.HISTORY_ID,
        h.CAR_ID,
        start_date,
        end_date,
        DATEDIFF(end_date, start_date) + 1 AS diff,
        CASE
            WHEN DATEDIFF(end_date, start_date) + 1 >= 90 THEN "90일 이상"
            WHEN DATEDIFF(end_date, start_date) + 1 >= 30 THEN "30일 이상"
            WHEN DATEDIFF(end_date, start_date) + 1 >= 7 THEN "7일 이상"
        END AS DURATION_TYPE,
        c.car_type,
        daily_fee
    FROM CAR_RENTAL_COMPANY_RENTAL_HISTORY AS h
    JOIN CAR_RENTAL_COMPANY_CAR AS c
    ON h.CAR_ID = c.CAR_ID
    WHERE c.car_type = '트럭'
    ) AS t
LEFT JOIN CAR_RENTAL_COMPANY_DISCOUNT_PLAN AS p
ON t.DURATION_TYPE = p.DURATION_TYPE and t.CAR_TYPE = p.CAR_TYPE
GROUP BY HISTORY_ID
ORDER BY FEE DESC, HISTORY_ID DESC