# 240924 TUE PM 7:19
# REST_INFO와 REST_REVIEW 테이블에서 
# 서울에 위치한 식당들의
# 식당 ID, 식당 이름, 음식 종류, 즐겨찾기수, 주소, 리뷰 평균 점수를 조회하는 SQL문을 작성해주세요.
# 이때 리뷰 평균점수는 소수점 세 번째 자리에서 반올림 해주시고
# 결과는 평균점수를 기준으로 내림차순 정렬해주시고, 평균점수가 같다면 즐겨찾기수를 기준으로 내림차순 정렬해주세요.

SELECT
    i.rest_id,
    rest_name,
    food_type,
    favorites,
    address,
    round(avg(review_score), 2) AS SCORE
FROM rest_info as i
JOIN rest_review as r
ON i.rest_id = r.rest_id
WHERE
    i.address LIKE '서울%'
GROUP BY
    i.rest_id,
    rest_name,
    food_type,
    favorites,
    address
ORDER BY SCORE DESC, FAVORITES DESC