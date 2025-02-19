{% macro replace_nulls(column_name, default_value=0) %}
    COALESCE({{ column_name }}, {{ default_value }})
{% endmacro %}
