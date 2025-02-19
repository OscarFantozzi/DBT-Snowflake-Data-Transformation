
WITH sales_data AS (
    SELECT
        A.ID_PRODUCT,
        A.ID_SALES_CHANNEL,
        B.STORE_TYPE,
        A.TOTAL_SALES
    FROM {{ ref('fSales') }} A
    INNER JOIN {{ ref('dSalesChannel') }} B
        ON A.ID_SALES_CHANNEL = B.ID_SALES_CHANNEL
    INNER JOIN {{ ref('dProduct') }} C
        ON A.ID_PRODUCT = C.ID_PRODUCT
)

SELECT
    ID_PRODUCT,
    STORE_TYPE,
    SUM(TOTAL_SALES) AS TOTAL_SALES
FROM sales_data
GROUP BY
    ID_PRODUCT,
    STORE_TYPE
ORDER BY
    ID_PRODUCT
