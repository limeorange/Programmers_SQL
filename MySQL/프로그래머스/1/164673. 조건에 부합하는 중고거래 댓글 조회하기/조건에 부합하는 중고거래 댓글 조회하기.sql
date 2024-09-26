# 240924 TUE PM 6:25

SELECT
    title,
    b.board_id,
    r.reply_id,
    r.writer_id,
    r.contents,
    date_format(r.created_date, '%Y-%m-%d') AS created_date
FROM USED_GOODS_BOARD AS b
JOIN USED_GOODS_REPLY AS r
ON b.board_id = r.board_id
WHERE
    b.created_date LiKE '2022-10%'
ORDER BY r.created_date, title