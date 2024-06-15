select m.id from person_order po 
right join menu m ON po.menu_id = m.id
where po.id is null
order by 1;