-- check if title or brand is null
SELECT * FROM {{ ref('dProduct') }} 
WHERE TITLE IS NULL OR BRAND IS NULL