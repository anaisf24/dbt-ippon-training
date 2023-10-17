{% set payment_methods = dbt_utils.get_column_values(table=ref('base_orders'), column='payment_method') %}

select r.name,
    {% for payment_method in payment_methods %}
    sum(case when o.payment_method ='{{payment_method}}' then o.amount end) as {{payment_method}}_amount,
        --{{',' if not loop.last}}
    {% endfor %}
    sum(amount) as total
from {{ref('base_restaurants')}} as r 
inner join {{ref('base_orders')}} as o 
on r.identifier = o.restaurant_identifier
group by 1