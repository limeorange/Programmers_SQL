# 251030 목 PM 7:38

SELECT
    e1.id,
    e1.genotype AS genotype,
    e2.genotype AS parent_genotype
FROM ecoli_data AS e1
JOIN ecoli_data AS e2
ON e1.parent_id = e2.id
WHERE e1.genotype & e2.genotype = e2.genotype
ORDER BY id