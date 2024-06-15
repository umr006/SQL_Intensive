drop function if exists fnc_persons_female();
drop function if exists fnc_persons_male();

CREATE OR REPLACE FUNCTION fnc_persons(pgender varchar DEFAULT 'female') 
RETURNS SETOF person AS $$
SELECT * FROM person WHERE gender = pgender;
$$ LANGUAGE SQL;

SELECT * FROM fnc_persons(pgender := 'male');

SELECT * FROM fnc_persons();
