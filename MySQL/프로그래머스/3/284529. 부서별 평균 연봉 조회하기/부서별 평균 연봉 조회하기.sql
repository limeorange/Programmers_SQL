# 250403 목 PM 5:40

SELECT
    e.dept_id,
    dept_name_en,
    ROUND(AVG(SAL)) AS AVG_SAL
FROM HR_EMPLOYEES AS e
JOIN HR_DEPARTMENT AS d
ON e.dept_id = d.dept_id
GROUP BY
    e.dept_id,
    dept_name_en
ORDER BY AVG_SAL DESC