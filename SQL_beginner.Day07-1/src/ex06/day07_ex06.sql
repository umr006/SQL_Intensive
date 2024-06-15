SELECT
	p."name",
	count(po.menu_id) count_of_orders,
	round(avg(price), 2) average_price,
	max(price) max_price,
	min(price) min_price
FROM
	person_order po
JOIN menu m ON
	m.id = po.menu_id
JOIN pizzeria p ON
	p.id = m.pizzeria_id
GROUP BY
	p."name"
ORDER BY
	1;