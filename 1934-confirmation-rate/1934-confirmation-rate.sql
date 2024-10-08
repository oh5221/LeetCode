-- Signups LEFT JOIN Confirmations 를 할 거 같습니다
-- 이 상태에서 s.user_id로 group by를 해가지고
-- count(*)를 action='confirmed'인 걸로 나눌 거 같아요 -> round(2)

SELECT s.user_id, 
        ROUND(SUM(CASE WHEN
                    c.action = 'confirmed'
                    THEN 1 ELSE 0 END)/COUNT(*), 2) AS confirmation_rate
FROM Signups s LEFT JOIN Confirmations c
    ON s.user_id = c.user_id
GROUP BY s.user_id