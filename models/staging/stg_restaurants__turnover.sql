select r.name as name, sum(o.amount) as amount, address
from {{ref('base_restaurants')}} as r 
inner join {{ref('base_orders')}} as o 
on r.identifier = o.restaurant_identifier
group by name, address
