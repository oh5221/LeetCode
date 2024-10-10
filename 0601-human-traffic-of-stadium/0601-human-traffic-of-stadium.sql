-- visit_date ASC 정렬
-- 3개 이상 연속되는 행이 방문자수 100명 이상이면 출력
-- 다음, 다다음을 기록
WITH PPL AS (
    SELECT id, visit_date, people,
            LEAD(people) OVER (ORDER BY id) AS next_ppl,
            LAG(people) OVER (ORDER BY id) AS prev_ppl,
            LEAD(people, 2) OVER (ORDER BY id) AS nnext_ppl,
            LAG(people, 2) OVER (ORDER BY id) AS pprev_ppl
    FROM Stadium
)
-- SELECT * FROM PPL
SELECT id, visit_date, people
FROM PPL
WHERE people >= 100 AND ((next_ppl >= 100 AND prev_ppl >= 100)
                        OR (next_ppl >= 100 AND nnext_ppl >= 100)
                        OR (prev_ppl >= 100 AND pprev_ppl >= 100))