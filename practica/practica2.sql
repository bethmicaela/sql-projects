SELECT *
--FROM platzi.alumnos
--FETCH FIRST 5 ROWS ONLY;
--LIMIT 5;
FROM (
	SELECT ROW_NUMBER() OVER() AS row_id, *
	FROM platzi.alumnos
) AS alumnos_with_row_num
WHERE row_id <= 5;

