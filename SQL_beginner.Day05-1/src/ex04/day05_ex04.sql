set enable_seqscan = off;

create unique index if not exists idx_menu_unique on menu(pizzeria_id, pizza_name);

explain analyze select *
from menu 
where pizzeria_id = 2 and pizza_name = 'cheese pizza';
