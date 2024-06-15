CREATE OR REPLACE FUNCTION 
fnc_person_visits_and_eats_on_date (pperson varchar DEFAULT 'Dmitriy', pprice int DEFAULT 500, pdate date DEFAULT '2022-01-08')
RETURNS SETOF varchar AS $$
BEGIN 
	RETURN QUERY 
		SELECT DISTINCT pz."name" FROM person_visits pv 
		JOIN person p ON p.id = pv.person_id AND p."name" = pperson AND pv.visit_date = pdate
		JOIN menu m ON pv.pizzeria_id = m.pizzeria_id AND price < pprice
		JOIN pizzeria pz ON pz.id = m.pizzeria_id;
END;
$$ LANGUAGE 'plpgsql';


select *
from fnc_person_visits_and_eats_on_date(pprice := 800);


select *
from fnc_person_visits_and_eats_on_date(pperson := 'Anna',pprice := 1300,pdate := '2022-01-01');