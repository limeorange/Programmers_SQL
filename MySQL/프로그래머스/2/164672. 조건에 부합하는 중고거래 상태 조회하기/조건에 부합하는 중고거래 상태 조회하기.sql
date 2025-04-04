# 250404 금 PM 10:28

SELECT
    board_id,
    writer_id,
    title,
    price,
    CASE
        WHEN status = 'SALE' THEN '판매중'
        WHEN status = 'RESERVED' THEN '예약중'
        ELSE '거래완료'
    END AS status
FROM used_goods_board
WHERE created_date LIKE '2022-10-05%'
ORDER BY board_id DESC