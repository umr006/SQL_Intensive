CREATE TABLE IF NOT EXISTS person_audit(
	created timestamp WITH time ZONE DEFAULT current_timestamp NOT NULL,
	type_event char(1) DEFAULT 'I' NOT NULL,
	row_id bigint NOT NULL,
	name varchar,
	age integer,
	gender varchar,
	address varchar,
	CONSTRAINT ch_type_event CHECK (type_event IN ('I', 'U', 'D'))
);


CREATE OR REPLACE FUNCTION fnc_trg_person_insert_audit()
RETURNS TRIGGER AS $$
BEGIN
	IF TG_OP = 'INSERT' THEN 
		INSERT INTO person_audit SELECT 
										now(), 
										'I',
                                        NEW.id,
                                        NEW.name, 
                                        NEW.age, 
	                                    NEW.gender, 
	                                    NEW.address;
	END IF;
	RETURN NULL;                           
END;
$$ LANGUAGE 'plpgsql';


CREATE TRIGGER trg_person_insert_audit
	AFTER INSERT ON person
	FOR EACH 
	ROW EXECUTE FUNCTION fnc_trg_person_insert_audit();

INSERT INTO person(id, name, age, gender, address) VALUES (10,'Damir', 22, 'male', 'Irkutsk');