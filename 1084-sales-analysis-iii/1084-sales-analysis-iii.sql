-- 1st quarter of 2019 
WITH NOT_1ST AS (
    SELECT DISTINCT p.product_id, product_name
    FROM Product p JOIN Sales s
        ON p.product_id = s.product_id
    WHERE sale_date > '2019-03-31' OR sale_date < '2019-01-01'
)
SELECT DISTINCT p.product_id, product_name
FROM Product p JOIN Sales s
    ON p.product_id = s.product_id
WHERE sale_date BETWEEN '2019-01-01' AND '2019-03-31'
         AND p.product_id NOT IN (SELECT product_id
                                    FROM NOT_1ST)