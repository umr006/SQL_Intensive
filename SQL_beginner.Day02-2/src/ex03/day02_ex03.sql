with missing_date as (SELECT missing_date
FROM generate_series ('2022-01-01','2022-01-10', interval '1 day') AS date(missing_date))
SELECT missing_date::date from missing_date
LEFT JOIN (SELECT visit_date FROM person_visits WHERE person_visits.person_id in (1,2)) AS visit
ON visit.visit_date = missing_date
WHERE visit.visit_date is null;