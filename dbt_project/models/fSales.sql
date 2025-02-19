-- models/fSales.sql

{{

    config(
        materialized='incremental',
        unique_key=['SKU', 'STOREID', 'DATE','TOTAL_SALES']
       
        )
}}

WITH fSales AS
(
    SELECT
        A.SKU,
        A.STOREID,
        C.ID_PRODUCT,
        A.DATE,
        A.SALES AS QUANTITY,
        A.REVENUEUSD AS TOTAL_SALES,
        CASE WHEN 
            A.SKU= A.URL THEN 'OFFLINE' ELSE 'ONLINE'
            END AS STORE_TYPE
    FROM 
        {{ source('sales_raw', 'PSP') }} A
    INNER JOIN
        {{ ref('dProduct') }} C ON A.SKU = C.SKU AND A.TITLE = C.TITLE AND A.BRAND = C.BRAND
)

SELECT
    A.*,
    B.ID_SALES_CHANNEL AS ID_SALES_CHANNEL
FROM fSales A
INNER JOIN
{{ ref( 'dSalesChannel' ) }} B ON A.STORE_TYPE = B.STORE_TYPE

 

{% if is_incremental() %}
WHERE DATE > (SELECT MAX(DATE) FROM {{ this }})

{% endif %}
