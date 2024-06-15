select *
from 
	person
cross join
	pizzeria
order by 
	person.id asc,
	pizzeria.id asc;