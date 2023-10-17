select * 
from {{ref('stg_restaurants__turnover')}}
order by amount desc
limit {{var('nb_restaurants_to_show')}}