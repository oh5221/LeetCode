-- 한사람만 LIMIT 1
-- requester_id랑 accepter_id를 union을 해서
-- id별로 count를 해야 할 거 같다
-- 이 count를 desc 정렬했을 때 limit 1

WITH ALL_ID AS (
    SELECT requester_id AS id
    FROM RequestAccepted 

    UNION ALL

    SELECT accepter_id AS id
    FROM RequestAccepted
)
SELECT id, COUNT(id) AS num
FROM ALL_ID
GROUP BY id
ORDER BY num DESC
LIMIT 1