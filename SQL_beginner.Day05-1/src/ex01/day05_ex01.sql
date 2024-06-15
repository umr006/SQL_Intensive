set enable_seqscan = off;

explain analyze select m.pizza_name, p."name" 
from menu m, pizzeria p
where m.pizzeria_id = p.id;
