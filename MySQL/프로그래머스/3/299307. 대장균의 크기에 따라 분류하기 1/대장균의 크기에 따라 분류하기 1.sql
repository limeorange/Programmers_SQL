# 251030 목 PM 8:45

SELECT
    id,
    CASE
        WHEN size_of_colony > 1000 THEN 'HIGH'
        WHEN (100 < size_of_colony AND size_of_colony <= 1000) THEN 'MEDIUM'
        ELSE 'LOW'
    END AS size
FROM ecoli_data
ORDER BY id