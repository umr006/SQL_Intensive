select 
	order_date,
	concat(
		person.name,
		' (age:',
		cast(person.age as varchar),
		')'
	) as person_information
from 
	person_order
natural join
	person
order by 
	order_date asc,
	person_information asc;

select order_date,
          name || ' (age:'||age||')' as person_information
      from person_order natural join (select p.id as person_id,name, age from person p ) as p
      order by 1,2