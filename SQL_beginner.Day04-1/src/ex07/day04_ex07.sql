with
id_max as (select max(id) + 1 from person_visits pv),

per_id as (select p.id person_id from person p 
join person_visits pv on p.id = pv.person_id 
where p."name" = 'Dmitriy' and pv.visit_date = '2022-01-08'),

pz_id as (select p.id from pizzeria p 
join menu m on m.pizzeria_id = p.id
where p."name" != (select * from mv_dmitriy_visits_and_eats) and price < 800
limit 1)

insert into person_visits
select *, '2022-01-08'::date visit_date from id_max, per_id, pz_id 

REFRESH MATERIALIZED VIEW mv_dmitriy_visits_and_eats;