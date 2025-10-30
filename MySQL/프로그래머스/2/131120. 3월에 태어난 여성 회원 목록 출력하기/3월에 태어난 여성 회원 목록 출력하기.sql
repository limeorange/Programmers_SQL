# 251030 목 PM 6:12

SELECT
    member_id,
    member_name,
    gender,
    DATE_FORMAT(date_of_birth, '%Y-%m-%d') AS DATE_OF_BIRTH
FROM member_profile
WHERE
    gender = 'W' AND
    date_of_birth LIKE '%-03-%' AND
    tlno is not null
ORDER BY member_id