
{% macro mockable_source(source_name,table_name,seed_name) %}
    {% if target.name.lower() == 'ci' %}
    from {{ref( seed_name )}}
    {% else %}
    from {{source(source_name, table_name)}}
    {% endif %}
{% endmacro %}