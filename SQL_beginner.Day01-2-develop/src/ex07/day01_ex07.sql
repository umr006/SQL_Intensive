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
join
	person on person_order.person_id = person.id
order by 
	order_date asc,
	person_information asc;