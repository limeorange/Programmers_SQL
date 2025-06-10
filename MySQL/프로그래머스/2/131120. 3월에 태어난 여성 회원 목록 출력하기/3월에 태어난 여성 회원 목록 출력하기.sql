# 250610 화 PM 3:05

SELECT
    member_id,
    member_name,
    gender,
    date_format(date_of_birth, '%Y-%m-%d') AS date_of_birth
FROM member_profile
WHERE
    MONTH(date_of_birth) = 3 AND
    gender = 'W' AND
    TLNO is not NULL
ORDER BY member_id