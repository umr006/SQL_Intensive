select t1.name person_name_1, t2.name person_name_2, t2.address common_address from (select * from person) t1
join
(select * from person) t2 on t1.id > t2.id
where t1.address = t2.address;