WITH res AS (
SELECT
	person_id,
	count(*) count_of_visits
FROM
	person_visits pv
GROUP BY
	person_id
)

SELECT
	p."name",
	count_of_visits
FROM
	res
JOIN person p ON
	p.id = res.person_id
WHERE
	count_of_visits > 3;