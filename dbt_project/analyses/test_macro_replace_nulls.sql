SELECT 
    SKU,
    STOREID,
    ID_PRODUCT,
    ID_SALES_CHANNEL,
    DATE,
    QUANTITY,
    {{ replace_nulls('TOTAL_SALES') }} AS TOTAL_SALES_CLEANED
FROM {{ ref('fSales') }}
WHERE   
    TOTAL_SALES_CLEANED = 0
