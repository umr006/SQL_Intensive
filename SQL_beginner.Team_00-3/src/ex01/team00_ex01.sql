with recursive nodes as (
	select concat('{', point1) as tour, point1, point2, cost
	from price 
	where point1 = 'a'
	union 
	select concat(nodes.tour, ',', price.point1) as tour, price.point1, price.point2, price.cost + nodes.cost
	from nodes
		join price on nodes.point2 = price.point1
	where tour not like concat('%', price.point1, '%')  
)
select nodes.cost total_cost, concat(tour, ',', point2, '}') tour
from nodes 
where point2 = 'a' and 
	length(tour) in (select max(length(tour)) from nodes) 
order by 1,2;