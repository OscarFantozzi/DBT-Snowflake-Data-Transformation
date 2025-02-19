

WITH ranked_sales AS (
    SELECT
        B.STATE,
        B.CITY,
        C.ID_PRODUCT,
        SUM(A.TOTAL_SALES) AS TOTAL_SALES,
        DENSE_RANK() OVER( PARTITION BY B.STATE, B.CITY ORDER BY SUM(A.TOTAL_SALES) DESC ) AS RANKING
    FROM {{ ref('fSales') }} A
    LEFT JOIN {{ ref('dLocation') }} B
        ON A.STOREID = B.STORE_ID
    LEFT JOIN {{ ref('dProduct') }} C
        ON C.ID_PRODUCT = A.ID_PRODUCT
    GROUP BY
        C.ID_PRODUCT,
        B.STATE,
        B.CITY
)

SELECT
    STATE,
    CITY,
    ID_PRODUCT,
    TOTAL_SALES,
    RANKING
FROM ranked_sales
WHERE RANKING <= 10
ORDER BY
    STATE,
    CITY,
    RANKING
