# 250404 금 PM 9:45

WITH top_board_id AS (
    SELECT
        BOARD_ID
    FROM USED_GOODS_BOARD
    ORDER BY VIEWS DESC
    LIMIT 1
)

SELECT
    CONCAT('/home/grep/src/', board_id, '/', file_id, file_name, file_ext) AS file_path
FROM USED_GOODS_FILE
WHERE
    board_id in (SELECT board_id FROM top_board_id)
ORDER BY file_id DESC