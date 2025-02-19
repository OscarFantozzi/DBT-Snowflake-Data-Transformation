SELECT 
    SKU,
    STOREID,
    ID_PRODUCT,
    ID_SALES_CHANNEL,
    DATE,
    QUANTITY,
    TOTAL_SALES
FROM {{ ref('fSales') }}
WHERE {{ filter_september_2024('DATE') }}
