select * 
from  {{source('source', 'restaurants')}}
where open_on_sunday::boolean