-- models/dLocation.sql

WITH source_data AS (
    SELECT
        DISTINCT(STOREID) AS STORE_ID,
        ZIP,
        CITY,
        STATE,
        ADRESS
    FROM {{ source('sales_raw', 'PSP') }}
)

SELECT
    STORE_ID,
    ZIP,
    CITY,
    STATE,
    ADRESS AS ADDRESS
FROM source_data
ORDER BY STORE_ID
