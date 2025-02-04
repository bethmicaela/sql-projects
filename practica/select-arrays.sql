/*-- EJEMPLO 1: COMO HACER SELECT EN ARRAYS(LISTAS)
-- este Query ya lo hemos corrido anteriormente, basicamente lo que nos esta regresando es la misma tabla platzi_alumnos, solo le esta agregando un row_id al principio
SELECT *
FROM(
	SELECT ROW_NUMBER() OVER() AS row_id, *
	FROM platzi.alumnos
)AS alumnos_with_row_num

-- Lo que ahora queremos hacer traer una serie de registros, por ejemplo el alumno que tiene row_id 1, 5, 10, 15
-- Para hacer esto cuando tenemos un SUBSET muy especifico de registros que quiero extraer, no puedo usar un LIMIT o WHERE>5,<5 porque son variables
-- Lo que recibe IN es una serie de valores separados por coma
WHERE row_id IN(1,5,10,12,15,20); -- Todos estos son los row_id que me va a traer*/

/*-- EJEMPLO 2
SELECT *
FROM platzi.alumnos
-- Hacemos IN del id porque no tenemos una particion
-- En este id lo que vamos a hacer es que traiga los id que se encuentren en la lista
WHERE id IN (1,2,3);*/

/*-- EJEMPLO 3: Si no sabemos los id que nos interesan, pero si la consulta que queremos hacder, hacemos lo siguiente:
SELECT *
FROM platzi.alumnos
WHERE id IN (
	SELECT id
	FROM platzi.alumnos 
	-- Pero que traiga a aquellos alumnos que tengan el tutor_id = 30
	WHERE tutor_id = 30
		AND carrera_id = 31
);
*/

-- RETO: Seleccionar los resultados que no se encuentren en el set o lista
-- Lo unico que hay que hacer para resolver el reto es agregar NOT en WHERE id NOT IN.

SELECT *
FROM platzi.alumnos
WHERE NOT id IN (
	SELECT id
	FROM platzi.alumnos 
	-- Pero que traiga a aquellos alumnos que tengan el tutor_id = 30
	WHERE tutor_id = 30
		AND carrera_id = 31
);


