create materialized view mv_dmitriy_visits_and_eats as 
SELECT pz.name pizzeria_name from person_visits pv
join (SELECT * from person WHERE name = 'Dmitriy') ps on pv.person_id = ps.id
join pizzeria pz on pz.id = pv.pizzeria_id
join menu m on m.pizzeria_id = pz.id
where visit_date = '2022-01-08' and m.price < 800;