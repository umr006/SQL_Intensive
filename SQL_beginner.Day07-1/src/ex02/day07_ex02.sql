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
LIMIT 3
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
LIMIT 3
)

SELECT * FROM order_query
UNION
SELECT * FROM visit_query
ORDER BY 3, 2 DESC;