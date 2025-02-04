/* 
*Campos de fecha: Conocemos las funciones para anio, mes y dia
*Para extraer una parte de un datetime o fecha usamos EXTRACT() 
*Dentro del parentesis especificamos que queremos extraer y de que campo/columna
*/

SELECT EXTRACT(YEAR FROM fecha_incorporacion) AS anio_incorporacion
FROM platzi.alumnos;

/*
*Hay otra forma de extraer partes de la fecha, con DATE_PART()
*Dentro del parentesis especificamos que queremos traer entre comillas, luego de la coma el campo/columna
*/

SELECT DATE_PART('YEAR', fecha_incorporacion) AS anio_incorporacion
FROM platzi.alumnos;

SELECT DATE_PART('YEAR', fecha_incorporacion) AS anio_incorporacion,
		DATE_PART('MONTH', fecha_incorporacion) AS month_incorporacion,
		DATE_PART('DAY', fecha_incorporacion) AS day_incorporacion
FROM platzi.alumnos

/* RETO: Sacar los campos de la hora, ver documentacion.
*/

-- Con EXTRACT
SELECT EXTRACT(HOUR FROM fecha_incorporacion) AS hora_incorporcion,
		EXTRACT(MINUTE FROM fecha_incorporacion) AS minuto_incorporcion,
		EXTRACT(SECOND FROM fecha_incorporacion) AS segundo_incorporcion
FROM platzi.alumnos;

-- Con DATE_PART
SELECT DATE_PART('HOUR', fecha_incorporacion) AS hora_incorporcion,
		DATE_PART('MINUTE', fecha_incorporacion) AS minuto_incorporcion,
		DATE_PART('SECOND', fecha_incorporacion) AS segundo_incorporcion
FROM platzi.alumnos;







