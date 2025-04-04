# 250404 금 PM 11:41

SELECT
    YEAR(YM) AS year,
    ROUND(AVG(pm_val1), 2) AS PM10,
    ROUND(AVG(pm_val2), 2) AS 'PM2.5'
FROM air_pollution
WHERE location2 = '수원'
GROUP BY year
ORDER BY year