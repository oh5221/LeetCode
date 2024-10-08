-- NOT UNIQUE tiv_2015 & UNIQUE (lat, lon)
-- ROUND(SUM(tiv_2016), 2)
-- 먼저 2015의 개수를 센다
-- (lat, lon)의 개수가 1인 것만 

WITH CNT AS (
    SELECT tiv_2015, COUNT(tiv_2015) as cnt_2015
    FROM Insurance
    GROUP BY tiv_2015
    HAVING COUNT(*) > 1
),
LOCATION AS (
    SELECT lat, lon
    FROM Insurance
    GROUP BY lat, lon
    HAVING COUNT(*) > 1
)
SELECT ROUND(SUM(tiv_2016), 2) AS tiv_2016
FROM Insurance i 
WHERE tiv_2015 IN (SELECT tiv_2015 FROM CNT)
        AND (lat, lon) NOT IN (SELECT lat, lon FROM LOCATION)
