select m.pizza_name, p.name pizzeria_name_1, p2.name pizzeria_name_2, m.price from menu m 
join menu m2 on m.price = m2.price and m.pizza_name = m2.pizza_name and m.id > m2.id
join pizzeria p on m.pizzeria_id = p.id
join pizzeria p2 on m2.pizzeria_id = p2.id
order by 1;