-- macros/merge_fSales.sql

{% macro merge_and_update(target_table, source_table) %}

MERGE INTO {{target_table}} AS target
USING {{source_table}} AS source
ON target.STOREID = source.STOREID
   AND target.DATE = source.DATE
   AND target.SKU = source.SKU
WHEN MATCHED AND (
   target.QUANTITY != source.SALES OR target.TOTAL_SALES != source.REVENUEUSD
) THEN
   UPDATE SET
       target.QUANTITY = source.SALES,
       target.TOTAL_SALES = source.REVENUEUSD
{% endmacro %}
