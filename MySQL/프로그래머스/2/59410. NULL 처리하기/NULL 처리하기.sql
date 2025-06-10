# 250610 화 PM 10:26 / IFNULL(col, 대체값)

SELECT
    animal_type,
    IFNULL(name, 'No name') AS name,
    sex_upon_intake
FROM animal_ins