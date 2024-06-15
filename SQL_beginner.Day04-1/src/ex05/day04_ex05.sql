create view v_price_with_discount as
select p.name, m.pizza_name, m.price, round((m.price - (m.price * 0.1)))::int discount_price from person_order po 
join person p on po.person_id = p.id 
join menu m on po.menu_id = m.id
join pizzeria pz on pz.id = m.pizzeria_id
order by 1,2;