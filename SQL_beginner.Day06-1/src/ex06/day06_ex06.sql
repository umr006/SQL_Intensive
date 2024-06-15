CREATE SEQUENCE seq_person_discounts INCREMENT BY 1 START 1;
SELECT setval ('seq_person_discounts', (SELECT count(*) FROM person_discounts));
ALTER TABLE person_discounts ALTER COLUMN id SET DEFAULT NEXTVAL('seq_person_discounts');
