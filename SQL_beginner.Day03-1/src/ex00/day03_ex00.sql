select pizza_name, price, pz."name" pizzeria_name, visit_date from person_visits pv
join person p on pv.person_id = p.id
join pizzeria pz on pz.id = pv.pizzeria_id 
join menu m on m.pizzeria_id = pz.id
where p.name = 'Kate' and m.price between 800 and 1000
order by 1,2,3;