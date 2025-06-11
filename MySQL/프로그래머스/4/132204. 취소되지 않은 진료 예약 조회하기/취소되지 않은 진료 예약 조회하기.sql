# 250611 수 PM 4:58

SELECT
    apnt_no,
    pt_name,
    a.pt_no,
    a.mcdp_cd,
    dr_name,
    apnt_ymd    
FROM appointment AS a
JOIN doctor AS d
ON a.mddr_id = d.dr_id
JOIN patient AS p
ON a.pt_no = p.pt_no
WHERE apnt_cncl_yn = 'N' AND a.mcdp_cd = 'CS' AND
      apnt_ymd LIKE '2022-04-13%'
ORDER BY apnt_ymd 