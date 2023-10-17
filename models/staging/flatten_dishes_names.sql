{{config(materialized='table')}}

with sub as
(
    select *
    from {{ref('base_fuzzy_orders')}}
),
sub2 as 
( 
    select row_number() over (order by 1) as fake_id, *
    from sub
)
select 
    sub2.fake_id,
    n.value as dishes_names,
    payment_method
    , amount
    , created_at
from 
    sub2,
    lateral flatten( input => sub2.dishes_names) as n