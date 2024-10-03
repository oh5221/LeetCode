# group by customer_id 했을 때 count(distinct product_key) = count(product_key) 이면 출력?

-- WITH CTE AS (
--     SELECT customer_id, COUNT(DISTINCT product_key) as product_cnt
--     FROM Customer c
--     GROUP BY customer_id
-- )
-- SELECT customer_id
-- FROM CTE
-- WHERE product_cnt = (SELECT COUNT(product_key) FROM Product)

SELECT customer_id
FROM Customer
GROUP BY customer_id
HAVING COUNT(DISTINCT product_key) = (SELECT COUNT(product_key) FROM Product)