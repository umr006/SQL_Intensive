insert into person_order 
SELECT generate_series(max(person_order.id + 1),max(person_order.id) + max(person.id)) id, 
	   generate_series(1, max(person_id)) person_id, (SELECT menu.id FROM menu WHERE pizza_name = 'Greek Pizza') menu_id, ('2022-02-25')::date order_date
FROM person_order, person;