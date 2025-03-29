# 250330 일 AM 12:11
/*
조건) 아기 대장균이 부모의 형질을 모두 가지고 있어야 함
=> 한 숫자(GENOTYPE)에 여러 형질(유전자 정보)이 들어있음
=> 하나의 숫자에 여러 형질이 비트 단위로 압축되어 있는 것!
=> A & B = A와 B의 비트 단위 AND 연산 활용
*/

SELECT
    child.ID,
    child.GENOTYPE,
    parent.GENOTYPE AS PARENT_GENOTYPE
FROM ECOLI_DATA AS child
JOIN ECOLI_DATA AS parent
ON child.parent_id = parent.id
WHERE child.GENOTYPE & parent.GENOTYPE = parent.GENOTYPE
ORDER BY child.ID