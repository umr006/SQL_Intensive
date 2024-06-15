select 
	CONCAT(name, ' (age:', age, ', gender:', QUOTE_LITERAL(gender), ', address:', QUOTE_LITERAL(address), ')') AS person_information
from person
order by name;