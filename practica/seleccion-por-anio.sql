-- Con el metodo EXTRACT para extraer el año que se especifica
SELECT *
FROM platzi.alumnos
WHERE (EXTRACT(YEAR FROM fecha_incorporacion)) = 2018; 
-- Con el metodo DATE_PART
SELECT *
FROM platzi.alumnos
WHERE (DATE_PART('YEAR', fecha_incorporacion)) = 2019;
-- Con el SUBQUERY
SELECT
FROM (
	SELECT *,
			DATE_PART('YEAR', fecha_incorporacion) AS anio_incorporacion
	FROM platzi.alumnos
) AS alumnos_con_anio
WHERE anio_incorporacion = 2020;

/*
RETO: 
Seleccionar los alumnos que se incorporaron en el año 2018 y en el mes de mayo.
*/

-- Solución 1:
SELECT *
FROM platzi.alumnos
WHERE EXTRACT(YEAR FROM fecha_incorporacion) =2018
AND EXTRACT(MONTH FROM fecha_incorporacion) =5;

-- Solución 2:
SELECT *
FROM platzi.alumnos
WHERE DATE_PART('YEAR', fecha_incorporacion) = 2018
AND DATE_PART('MONTH', fecha_incorporacion) = 5;

-- Solución 3:
SELECT*
FROM(
	SELECT*, 
		EXTRACT(YEAR FROM fecha_incorporacion) anio_incorporacion, 
		EXTRACT(MONTH FROM fecha_incorporacion) mes_incorporacion
	FROM platzi.alumnos
) alumnos_anio
WHERE anio_incorporacion =2018
AND mes_incorporacion =5;

-- Solución 4:
SELECT * 
FROM platzi.alumnos
WHERE TO_CHAR(fecha_incorporacion, 'YYYYMM') = '201805';
