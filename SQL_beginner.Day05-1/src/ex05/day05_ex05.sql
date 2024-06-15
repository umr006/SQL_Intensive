set enable_seqscan = off;


create unique index idx_person_order_order_date on person_order(person_id, menu_id)
where order_date = '2022-01-01';

explain analyze select * from person_order po where person_id = 1 and menu_id = 2 and order_date = '2022-01-01';
