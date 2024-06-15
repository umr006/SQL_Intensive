WITH res AS (
SELECT
	address,
	round(max(age) - (min(age)::decimal / max(age)), 2) formula,
	round(avg(age),2) average
FROM
	person p
GROUP BY 1
ORDER BY 1
)
SELECT
	*,
CASE
    WHEN res.formula > res.average
        THEN 'true'
    ELSE 'false'
    END AS comparison
FROM
	res
ORDER BY 1;