select t1.name person_name_1, t2.name person_name_2, t2.address common_address from (select * from person) t1
join
(select * from person) t2 on t1.id > t2.id
where t1.address = t2.address;

SELECT t1.name AS person_name1, t2.name AS person_name2, t1.address AS common_address
FROM (SELECT name, address, id FROM person) AS t1
JOIN (SELECT name, address, id FROM person) AS t2 ON t1.id > t2.id
WHERE t1.address = t2.address AND t1.name != t2.name;