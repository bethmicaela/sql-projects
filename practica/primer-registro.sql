/*
SELECT *
FROM platzi.alumnos AS alumnos
FETCH FIRST 1 ROWS ONLY;


SELECT *
FROM platzi.alumnos
LIMIT 1;
*/

SELECT *
FROM (
  SELECT ROW_NUMBER() OVER() AS row_id, *
  FROM platzi.alumnos
) AS alumnos_with_row_num
WHERE row_id = 5
;

