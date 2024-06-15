select COALESCE(ps.name,'-') AS person_name, pv.visit_date AS visit_date, COALESCE(pz.name,'-') AS pizzeria_name
from person ps
FULL JOIN (SELECT * from person_visits where visit_date BETWEEN '2022-01-01' and '2022-01-03') pv on pv.person_id = ps.id
FULL JOIN (SELECT * from pizzeria) pz on pv.pizzeria_id = pz.id
order by 1,2,3;
