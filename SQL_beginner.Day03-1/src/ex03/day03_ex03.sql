WITH
male as (
SELECT pz.name pizzeria_name
from person_visits pv
JOIN (SELECT * from person where gender = 'male') p on p.id = pv.person_id
JOIN pizzeria pz on pv.pizzeria_id = pz.id 
order by 1),

female as (
SELECT pz.name pizzeria_name
from person_visits pv
JOIN (SELECT * from person where gender = 'female') p on p.id = pv.person_id
JOIN pizzeria pz on pv.pizzeria_id = pz.id
order by 1),

pizzeria_male AS (SELECT * from male
EXCEPT all
SELECT * from female),

pizzeria_female as (SELECT * from female
EXCEPT all
SELECT * from male)

SELECT * from pizzeria_male
UNION
SELECT * FROM pizzeria_female
order by 1;