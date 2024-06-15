SELECT m.pizza_name, pz.name, m.price from menu m
  join pizzeria pz ON m.pizzeria_id = pz.id
where pizza_name like '%pepperoni%' or pizza_name like '%mushroom%'
order by 1,2,3;