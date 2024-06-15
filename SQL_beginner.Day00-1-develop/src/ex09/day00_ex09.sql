select 
	(select name from person where person.id = pv.person_id) as person_name,
	(select name from pizzeria where pizzeria.id = pv.pizzeria_id) as pizzaria_name
from (select * from person_visits  where visit_date >= '2022-01-07' and visit_date <= '2022-01-09') as pv
order by person_name, pizzaria_name desc;