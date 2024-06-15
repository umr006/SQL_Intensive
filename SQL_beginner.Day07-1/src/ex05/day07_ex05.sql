SELECT
	name
FROM
	person_order po JOIN person p 
	ON po.person_id = p.id 
GROUP BY name
ORDER BY 1;