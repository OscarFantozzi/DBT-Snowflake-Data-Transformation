SELECT * 
FROM {{ ref('fSales') }} 
WHERE TOTAL_SALES = 0
