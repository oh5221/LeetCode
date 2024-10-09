-- Delivery: delivery_id, customer_id, order_date, customer_pref_delivery_date
-- 선호날짜 = 배달날짜면 'immediate' 아니면 'shceduled'
-- 첫 번째 주문일 때의 immediate order 비율

WITH first_order AS (
    SELECT customer_id, order_date, customer_pref_delivery_date
    FROM Delivery
    WHERE (customer_id, order_date) IN (SELECT customer_id, MIN(order_date)
                                            FROM Delivery
                                            GROUP BY customer_id)
)
SELECT ROUND(SUM(CASE WHEN order_date = customer_pref_delivery_date THEN 1 ELSE 0 END)
             / COUNT(*) * 100, 2) AS immediate_percentage
FROM first_order
