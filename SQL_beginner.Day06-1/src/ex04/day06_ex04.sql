ALTER TABLE person_discounts add CONSTRAINT ch_nn_person_id CHECK (person_id IS NOT NULL);
alter table person_discounts add CONSTRAINT ch_nn_pizzeria_id CHECK (pizzeria_id is NOT NULL);
alter table person_discounts add constraint ch_nn_discount CHECK (discount is not NULL);
ALTER TABLE person_discounts ALTER COLUMN discount set DEFAULT 0;
ALTER TABLE person_discounts ADD CONSTRAINT discount CHECK (discount BETWEEN 0 and 100);

