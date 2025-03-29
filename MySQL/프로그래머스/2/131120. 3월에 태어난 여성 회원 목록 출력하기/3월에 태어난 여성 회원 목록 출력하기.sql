# 250329 토 PM 9:30
/*
(FROM) MEMBER_PROFILE 테이블에서
(SELECT, WHERE) 생일이 3월인 여성 회원의 ID, 이름, 성별, 생년월일을 조회하는 SQL문을 작성해주세요.
(WHERE) 이때 전화번호가 NULL인 경우는 출력대상에서 제외시켜 주시고,
(ORDER BY) 결과는 회원ID를 기준으로 오름차순 정렬해주세요.
*/

SELECT
    member_id,
    member_name,
    gender,
    date_format(date_of_birth, '%Y-%m-%d') as DATE_OF_BIRTH
FROM MEMBER_PROFILE
WHERE
    date_of_birth LIKE '%-03-%' AND
    gender = 'W' AND
    tlno is not NULL
ORDER BY member_id