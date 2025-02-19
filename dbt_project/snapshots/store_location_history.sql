{% snapshot store_location_history %}

{{
    config(
        target_schema='SCD_HISTORY',
        unique_key='STORE_ID',
        strategy='check',
        check_cols=['ADDRESS']
    )
}}

SELECT * FROM {{ ref('dLocation') }}  

{% endsnapshot %}
