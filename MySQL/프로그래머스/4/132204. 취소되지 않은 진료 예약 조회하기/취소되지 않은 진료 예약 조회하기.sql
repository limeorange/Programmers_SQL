# 250404 금 PM 9:29

WITH ap_table AS (
    SELECT
        apnt_no,
        pt_no,
        mcdp_cd,
        mddr_id,
        apnt_ymd
    FROM appointment
    WHERE
        apnt_ymd LIKE '2022-04-13%' AND
        apnt_cncl_yn = 'N' AND
        mcdp_cd = 'CS'
)

SELECT
    apnt_no,
    pt_name,
    a.pt_no,
    a.mcdp_cd,
    dr_name,
    apnt_ymd
FROM ap_table as a
JOIN patient as p
ON a.pt_no = p.pt_no
JOIN doctor as d
ON a.mddr_id = d.dr_id
ORDER BY apnt_ymd