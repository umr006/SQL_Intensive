WITH order_query AS (
SELECT
	p.name, count(*), 'order' action_type
FROM
	person_order po
JOIN menu m ON
	po.menu_id = m.id
JOIN pizzeria p ON
	m.pizzeria_id = p.id
GROUP BY p.name
ORDER BY 2 DESC
),

visit_query AS (
SELECT
	name, count(*), 'visit' action_type
FROM
	person_visits pv
JOIN pizzeria p ON
	pv.pizzeria_id = p.id
GROUP BY name
ORDER BY 2 DESC
),

union_tab AS (
SELECT * FROM order_query
UNION ALL
SELECT * FROM visit_query
)

SELECT name, sum(count) total_count
FROM union_tab
GROUP BY  name
ORDER BY 2 DESC, 1;