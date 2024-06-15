select p.name from person p
join person_order po on po.person_id = p.id
join (SELECT * from menu where pizza_name like '%pepperoni%' or pizza_name like '%mushroom%') m on po.menu_id = m.id
WHERE gender = 'male' and (address = 'Moscow' or address = 'Samara')
order by 1 DESC;