SELECT *
FROM platzi.alumnos AS ou -- le ponemos un alias de out porque es una tabla que se encuentra afuera
WHERE (
	--Hacemos un subquery que va a contener otra sentencia select y contamos el total de todos los elementos
	SELECT COUNT(*)
	FROM platzi.alumnos AS inr
	WHERE ou.id = inr.id  -- Esto va a tratar de hacer que si existe un id que sea igual a otro id en la misma tabla, 
) > 1;

-- Hacemos un select de todo a la tabla platzi.alumnos y con :: convertimos estos campos a texto
SELECT (platzi.alumnos.*)::text, COUNT(*)
FROM platzi.alumnos
-- Lo agrupamos por la agrupacion de todos los campos
GROUP BY platzi.alumnos.*
HAVING COUNT(*) > 1;


SELECT (
	platzi.alumnos.nombre,
	platzi.alumnos.apellido,
	platzi.alumnos.email,
	platzi.alumnos.colegiatura,
	platzi.alumnos.fecha_incorporacion,
	platzi.alumnos.carrera_id,
	platzi.alumnos.tutor_id
	)::text, COUNT(*)
FROM platzi.alumnos
GROUP BY platzi.alumnos.nombre,
	platzi.alumnos.apellido,
	platzi.alumnos.email,
	platzi.alumnos.colegiatura,
	platzi.alumnos.fecha_incorporacion,
	platzi.alumnos.carrera_id,
	platzi.alumnos.tutor_id
HAVING COUNT(*) > 1;


SELECT *
FROM  (
	SELECT id,
	ROW_NUMBER () OVER(
		PARTITION BY
			nombre,
			apellido,
			email,
			colegiatura,
			fecha_incorporacion,
			carrera_id,
			tutor_id
		ORDER BY id ASC
	) AS row,
	*
	FROM platzi.alumnos
)AS duplicados
WHERE duplicados.row > 1;
	
/* RETO: ELIMINAR DUPLICADOS
DELETE 
FROM platzi.alumnos
WHERE id IN (
SELECT id
FROM  (
	SELECT id,
	ROW_NUMBER () OVER(
		PARTITION BY
			nombre,
			apellido,
			email,
			colegiatura,
			fecha_incorporacion,
			carrera_id,
			tutor_id
		ORDER BY id ASC
	) AS row
	FROM platzi.alumnos
)AS duplicados
WHERE duplicados.row > 1);
*/