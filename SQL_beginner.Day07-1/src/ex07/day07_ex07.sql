SELECT round(avg(rating), 4) global_rating FROM pizzeria p;
SELECT
	p.address,
	pz.name,
	count(*) count_of_orders
FROM
	person p
JOIN person_order po ON
	p.id = po.person_id
JOIN menu m ON
	m.id = po.menu_id
JOIN pizzeria pz ON
	pz.id = m.pizzeria_id
GROUP BY 1,2
ORDER BY 1,2;