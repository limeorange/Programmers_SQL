# 240927 금 AM 2:24

# 천재지변으로 인해 일부 데이터가 유실되었습니다.
# 입양을 간 기록은 있는데, 보호소에 들어온 기록이 없는 동물의 ID와 이름을 ID 순으로 조회하는 SQL문을 작성해주세요.

# WHERE 절에서 서브쿼리 활용해서 NOT IN으로 원하는 조건('보호소에 들어온 기록이 없는') 설정

SELECT
    ANIMAL_ID,
    NAME
FROM ANIMAL_OUTS
WHERE
    ANIMAL_ID NOT IN (
        SELECT
            ANIMAL_ID
        FROM
            ANIMAL_INS
    )
ORDER BY ANIMAL_ID