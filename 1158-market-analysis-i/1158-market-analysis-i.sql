-- Users: user_id, join_date, favorite_brand
-- Orders: order_id, order_date, item_id, buyer_id, seller_id
-- Items: item_id, item_brand

-- 유저 각각의 2019년 구매한 order 수를 구하시오
-- join date도 같이 출력

SELECT user_id AS buyer_id, join_date, 
        SUM(CASE WHEN order_date LIKE '2019%'
                THEN 1
                ELSE 0
                END) AS orders_in_2019
FROM Users u LEFT JOIN Orders o
        ON u.user_id = o.buyer_id
GROUP BY user_id, join_date