-- models/dProduct.sql

WITH source_data AS (
    SELECT 
        SKU,
        TITLE,
        BRAND
    FROM {{ source('sales_raw', 'PSP') }}
)

SELECT
    ROW_NUMBER() OVER(ORDER BY SKU, TITLE, BRAND) AS ID_PRODUCT,
    SKU,
    TITLE,
    BRAND
FROM source_data
GROUP BY
    SKU,
    TITLE,
    BRAND
