SELECT m.pizza_name, pz.name from person_order po
join (SELECT * from person where name = 'Anna' or name = 'Denis') ps on ps.id = po.person_id
join menu m on m.id = po.menu_id
join pizzeria pz on m.pizzeria_id = pz.id
order by 1,2;