{{config(materialized='table')}}

select distinct * 
from {{mockable_source('source','orders','sample_orders')}}