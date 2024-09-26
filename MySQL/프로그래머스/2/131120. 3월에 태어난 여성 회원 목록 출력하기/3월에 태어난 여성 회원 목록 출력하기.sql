# 240924 TUE PM 6:53
# (from) MEMBER_PROFILE 테이블에서
# (where) 생일이 3월인 여성 회원의 ID, 이름, 성별, 생년월일을 조회하는 SQL문을 작성해주세요.
# (where) 이때 전화번호가 NULL인 경우는 출력대상에서 제외시켜 주시고,
# (order by) 결과는 회원ID를 기준으로 오름차순 정렬해주세요.

SELECT
    member_id,
    member_name,
    gender,
    date_format(date_of_birth, '%Y-%m-%d') as date_of_birth
FROM member_profile
WHERE
    tlno is not NULL AND
    gender = 'W' AND
    date_of_birth LIKE '%-03-%'
ORDER BY member_id