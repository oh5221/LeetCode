-- CTE로 Accounts 테이블에 category를 추가함
-- count(case when category IS NOT NULL 1 else 0) 으로 
-- group by cateogry

# WITH CTE AS (
#     SELECT *, 
#             CASE WHEN 
#                 income < 20000 THEN 'Low Salary'
#                 WHEN income BETWEEN 20000 AND 50000 THEN 'Average Salary'
#                 ELSE 'High Salary'
#             END AS category
#     FROM Accounts
# )
# SELECT category,
#         SUM(CASE WHEN category IS NOT NULL THEN 1 ELSE 0 END) AS accounts_count
# FROM CTE
# GROUP BY category

-- 안 됐으니까 LOW AVERAGE HIGH로 UNION

-- LOW부터
SELECT 'Low Salary' AS category,
        COUNT(*) AS accounts_count
FROM Accounts
WHERE income < 20000

UNION 

SELECT 'Average Salary' AS category,
        COUNT(*) AS accounts_count
FROM Accounts
WHERE income BETWEEN 20000 AND 50000

UNION

SELECT 'High Salary' AS category,
        COUNT(*) AS accounts_count
FROM Accounts
WHERE income > 50000