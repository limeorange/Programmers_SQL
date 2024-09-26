# 240926 목 PM 8:19

# FOOD_PRODUCT 테이블에서
# 식품분류별로 가격이 제일 비싼 식품의 분류, 가격, 이름을 조회하는 SQL문을 작성해주세요.
# 이때 식품분류가 '과자', '국', '김치', '식용유'인 경우만 출력시켜 주시고
# 결과는 식품 가격을 기준으로 내림차순 정렬해주세요.

# 문제) CATEGORY별로 그룹핑해서 MAX_PRICE 구할 때, PRODUCT_NAME도 select하면 PRODUCT_NAME은 그룹핑한 해당 product_name을 정확하게 반영하지 않을 수도 있음
# GROUP BY를 사용하면서 비그룹화된 컬럼(여기서는 PRODUCT_NAME)을 SELECT 문에 포함시키면, SQL은 어떤 PRODUCT_NAME을 반환해야 할지 알 수 없음 <= 여러 개의 PRODUCT_NAME이 있을 수 있기 때문
# 해결) 서브쿼리로 (CATEGORY, MAX_PRICE) 미리 구해놓고 매칭

SELECT
    CATEGORY,
    PRICE,
    PRODUCT_NAME
FROM FOOD_PRODUCT
WHERE
    (CATEGORY, PRICE) IN (
    SELECT
        CATEGORY,
        MAX(PRICE) AS MAX_PRICE
    FROM FOOD_PRODUCT
    WHERE
        CATEGORY IN ('과자', '국', '김치', '식용유')
    GROUP BY
        CATEGORY
    )
ORDER BY PRICE DESC