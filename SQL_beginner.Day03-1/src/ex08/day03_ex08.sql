insert into menu (id, pizzeria_id, pizza_name, price)
values ((select max(id) + 1 max_id from menu), (select id from pizzeria p where name = 'Dominos'), 'sicilian pizza', 900);