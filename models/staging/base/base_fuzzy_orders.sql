

select 
parse_json(dishes_names)::array as dishes_names, 
payment_method,
amount,
created_at
from {{source('source','fuzzy_orders')}}