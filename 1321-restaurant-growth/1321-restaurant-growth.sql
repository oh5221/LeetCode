-- Customer: customer_id, name, visited_on, amount
-- 손님들이 7일 (오늘+이전6일) 간 지불한 금액의 평균을 average_amount로, ROUND(2)로 계산
-- order by visited_on

-- lag(visited_on, 6)을 해서 기준이 되는 일주일 전 날짜를 찾고? -> 이걸 CTE로 만들고
-- CTE에서 first_day IS NOT NULL 날짜들
-- CTE SELF JOIN을 해서 first_day부터 visited_on까지 SUM을 하면 되지 않을까

WITH DAY_CAL AS (
    SELECT customer_id, name, visited_on, SUM(amount) AS amount, 
            LAG(visited_on, 6) OVER (ORDER BY visited_on ASC) AS first_day
    FROM Customer
    GROUP BY visited_on
    ORDER BY visited_on
),
MOVING_AVG AS (
    SELECT visited_on,
           SUM(amount) OVER (ORDER BY visited_on ROWS BETWEEN 6 PRECEDING AND CURRENT ROW) AS amount,
            ROUND(AVG(amount) OVER (ORDER BY visited_on ROWS BETWEEN 6 PRECEDING AND CURRENT ROW), 2) AS average_amount,
            first_day
    FROM DAY_CAL
)
SELECT visited_on, amount, average_amount
FROM MOVING_AVG
WHERE first_day IS NOT NULL
