{# 
{% macro mackable_source(table_name,seed_name) %}
    {% if target.name == 'ci' %}
    from {{ref( {{seed_name}} )}}
    {% else %}
    from {{ref( {{table_name}} )}}
    {% endif %}
{% endmacro %} #}