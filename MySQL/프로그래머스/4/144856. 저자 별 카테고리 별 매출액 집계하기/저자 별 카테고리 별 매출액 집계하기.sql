# 240926 목 PM 7:54
# 2022년 1월의 도서 판매 데이터를 기준으로
# 저자 별, 카테고리 별 매출액(TOTAL_SALES = 판매량 * 판매가) 을 구하여,
# 저자 ID(AUTHOR_ID), 저자명(AUTHOR_NAME), 카테고리(CATEGORY), 매출액(SALES) 리스트를 출력하는 SQL문을 작성해주세요.
# 결과는 저자 ID를 오름차순으로, 저자 ID가 같다면 카테고리를 내림차순 정렬해주세요.

SELECT
    a.author_id,
    a.author_name,
    b.category,
    SUM(s.sales * b.price) AS SALES
FROM BOOK_SALES AS s
LEFT JOIN BOOK AS b
ON b.book_id = s.book_id
LEFT JOIN AUTHOR AS a
ON b.author_id = a.author_id
WHERE
    s.sales_date LIKE '2022-01%'
GROUP BY
    a.author_id,
    b.category
ORDER BY a.author_id, category DESC