# 240927 금 AM 1:02

# DEVELOPERS 테이블에서 GRADE별 개발자의 정보를 조회하려 합니다.
# GRADE는 다음과 같이 정해집니다.
# A : Front End 스킬과 Python 스킬을 함께 가지고 있는 개발자
# B : C# 스킬을 가진 개발자
# C : 그 외의 Front End 개발자
# GRADE가 존재하는 개발자의 GRADE, ID, EMAIL을 조회하는 SQL 문을 작성해 주세요.
# 결과는 GRADE와 ID를 기준으로 오름차순 정렬해 주세요.

# with절에서 Front End 언어 코드합을 서브쿼리로 저장
# having은 주로 group by 결과에 대해 조건 설정할 때 사용하는데, mysql에서는 select에서 별칭 지정한 것에 대해서도 having으로 조건 설정하는 것을 예외적으로 허용한다고 함
# CASE WHEN THEN 뒤에 ELSE null 설정 안해도 자동으로 null 처리됨

WITH f AS (
    SELECT
        SUM(CODE) AS FRONT
    FROM SKILLCODES
    WHERE CATEGORY = 'Front End'
)

SELECT
    CASE
        WHEN d.skill_code & (SELECT FRONT FROM f)
            and d.skill_code & (SELECT CODE FROM SKILLCODES WHERE NAME = 'Python') THEN 'A'
        WHEN d.skill_code & (SELECT CODE FROM SKILLCODES WHERE NAME = 'C#') THEN 'B'
        WHEN d.skill_code & (SELECT FRONT FROM f) THEN 'C'
    END AS GRADE,
    ID,
    EMAIL
FROM DEVELOPERS AS d
HAVING GRADE is not null
ORDER BY GRADE, ID