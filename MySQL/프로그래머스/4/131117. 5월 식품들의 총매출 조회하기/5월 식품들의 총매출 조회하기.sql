# 240927 금 AM 2:15

# FOOD_PRODUCT와 FOOD_ORDER 테이블에서
# 생산일자가 2022년 5월인 식품들의
# 식품 ID, 식품 이름, 총매출을 조회하는 SQL문을 작성해주세요.
# 이때 결과는 총매출을 기준으로 내림차순 정렬해주시고 총매출이 같다면 식품 ID를 기준으로 오름차순 정렬해주세요.

# 동일한 PRODUCT_ID에 대해 여러 row가 있을 수 있음 (PRODUCT_ID별로 여러 시간대의 주문이 있을 수 있기 때문)
# => PRODUCT_ID, PRODUCT_NAME 기준으로 group by해서 SUM(AMOUNT * PRICE)을 해줘야 함

SELECT
    o.PRODUCT_ID,
    PRODUCT_NAME,
    SUM(AMOUNT * PRICE) AS TOTAL_SALES
FROM FOOD_ORDER AS o
JOIN FOOD_PRODUCT AS p
ON o.PRODUCT_ID = p.PRODUCT_ID
WHERE o.PRODUCE_DATE LIKE '2022-05%'
GROUP BY
    o.PRODUCT_ID,
    PRODUCT_NAME
ORDER BY TOTAL_SALES DESC, o.PRODUCT_ID