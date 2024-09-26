# 240926 목 PM 8:35

# USER_INFO 테이블과 ONLINE_SALE 테이블에서 //
# 년, 월, 성별 별로 상품을 구매한 회원수를 집계하는 SQL문을 작성해주세요. //*
# 결과는 년, 월, 성별을 기준으로 오름차순 정렬해주세요. //
# 이때, 성별 정보가 없는 경우 결과에서 제외해주세요. //

# 회원 수 집계 시 중복 아이디 제외하기 위해 DISTINCT 사용

SELECT
    YEAR(sales_date) AS YEAR,
    MONTH(sales_date) AS MONTH,
    GENDER AS GENDER,
    COUNT(DISTINCT s.USER_ID) AS USERS
FROM ONLINE_SALE AS s
LEFT JOIN USER_INFO AS u
ON s.USER_ID = u.USER_ID
WHERE
    GENDER is not null
GROUP BY
    YEAR,
    MONTH,
    GENDER
ORDER BY YEAR, MONTH, GENDER