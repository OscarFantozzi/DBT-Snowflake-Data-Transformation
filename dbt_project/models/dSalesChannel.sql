-- models/dSalesChannel.sql

WITH dSalesChannel AS (
    SELECT DISTINCT
        CASE 
            WHEN SKU = URL THEN 'OFFLINE' 
            ELSE 'ONLINE' 
        END AS STORE_TYPE
    FROM {{ source('sales_raw', 'PSP') }}
)
SELECT 
    ROW_NUMBER() OVER(ORDER BY STORE_TYPE ASC) AS ID_SALES_CHANNEL,
    STORE_TYPE
FROM dSalesChannel
