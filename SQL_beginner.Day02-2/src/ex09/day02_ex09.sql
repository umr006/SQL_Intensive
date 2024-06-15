select p.name from person p
join person_order po on po.person_id = p.id
join (select * from menu where pizza_name like '%pepperoni%' or pizza_name like '%cheese %') m on po.menu_id = m.id
where gender = 'female'
group by p.name
having count(name)>1;