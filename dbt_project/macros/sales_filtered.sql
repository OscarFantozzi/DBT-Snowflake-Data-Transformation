{% macro filter_september_2024(column_name) %}
    {{ column_name }} BETWEEN '2024-09-01' AND '2024-09-15'
{% endmacro %}