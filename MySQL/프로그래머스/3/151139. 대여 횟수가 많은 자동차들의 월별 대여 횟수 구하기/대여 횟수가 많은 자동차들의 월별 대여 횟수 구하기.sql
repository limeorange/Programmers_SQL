# 241012 토 AM 12:15

# 2022년 8월부터 2022년 10월까지 총 대여 횟수가 5회 이상인 자동차들에 대해서
    # 서브쿼리 활용 => 조건 충족하는 CAR_ID 선별
    # 메인쿼리에서 '2022년 8월부터 2022년 10월' 조건 다시 설정해 줘야 함
# 해당 기간 동안의 월별 자동차 ID 별 총 대여 횟수(컬럼명: RECORDS) 리스트를 출력
    # group by 월, 자동차 ID
# 특정 월의 총 대여 횟수가 0인 경우 결과에서 제외
# 정렬: 월 오름차순, 자동차 ID 내림차순

SELECT
    MONTH(START_DATE) AS MONTH,
    CAR_ID,
    COUNT(*) AS RECORDS
FROM CAR_RENTAL_COMPANY_RENTAL_HISTORY
WHERE CAR_ID IN
                (SELECT
                    CAR_ID
                FROM CAR_RENTAL_COMPANY_RENTAL_HISTORY
                WHERE
                    DATE_FORMAT(START_DATE, '%Y-%m') BETWEEN '2022-08' AND '2022-10'
                GROUP BY CAR_ID
                HAVING COUNT(*) >= 5)
    AND DATE_FORMAT(START_DATE, '%Y-%m') BETWEEN '2022-08' AND '2022-10'
GROUP BY MONTH, CAR_ID
HAVING RECORDS >= 1
ORDER BY MONTH, CAR_ID DESC