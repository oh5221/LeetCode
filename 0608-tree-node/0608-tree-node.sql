-- leaf, root, inner 고르는 문제
-- p_id가 null이면 Root
-- id가 p_id 안에 있으면 Inner, 아니면 Leaf

SELECT id, CASE WHEN p_id IS NULL THEN 'Root'
                WHEN id IN (SELECT p_id FROM Tree) THEN 'Inner'
                ELSE 'Leaf'
                END AS type
FROM Tree