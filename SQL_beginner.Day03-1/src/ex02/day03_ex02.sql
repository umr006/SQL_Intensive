select pizza_name, price, p."name" pizza_name from menu m 
left join person_order po on m.id = po.menu_id
join pizzeria p on m.pizzeria_id = p.id
where po.menu_id is null
order by 1, 2;