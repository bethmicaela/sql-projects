-- Lo que queremos traer es la segunda colegiatura mas alta
SELECT DISTINCT colegiatura -- DISTINCT LO QUE HACE ES TRAER INFORMACION SOLO UNA VEZ
FROM platzi.alumnos AS a1 -- a1 ES LA TABLA PRINCIPAL
WHERE 2 = ( --LE DECIMOS CON UN SUBQUERY QUE QUEREMOS EL SEGUNDO REGISTRO, QUE TODO LO QUE ESTE AQUI DENTRO SEA IGUAL A DOS
	SELECT COUNT (DISTINCT colegiatura) -- COUNT LO QUE HACES ES TRAER UN CONTEO DE LAS DIFERENTES COLEGIATURAS CON DISTINCT
	FROM platzi.alumnos a2 --ESPECIFICAMOS NUEVAMENTE DE DONDE LAS VA A TRAER Y LO LLAMAMOS A2 PARA DIFERENCIARLO DEL a1
	WHERE a1.colegiatura <= a2.colegiatura -- DONDE LA COLEGIATURA DE LA TABLA ORIGINAL a1 SEA MENOR O IGUAL A LA COLEGIATURA DE ESTE SUBQUERY DONDE ESTAMOS HACIENDO EL CONTEO 
);

-- FORMA MAS FACIL Y FUNCIONAL
SELECT DISTINCT colegiatura, tutor_id
FROM platzi.alumnos
WHERE tutor_id = 20
ORDER BY colegiatura DESC
LIMIT 1 OFFSET 1;

SELECT *
FROM platzi.alumnos AS datos_alumnos
INNER JOIN (
	SELECT DISTINCT colegiatura
	FROM platzi.alumnos
	WHERE tutor_id = 20
	ORDER BY colegiatura DESC
	LIMIT 1 OFFSET 1
) AS segunda_mayor_colegiatura
ON datos_alumnos.colegiatura = segunda_mayor_colegiatura.colegiatura;


SELECT*
FROM platzi.alumnos AS datos_alumnos
WHERE colegiatura = (
	SELECT DISTINCT colegiatura
	FROM platzi.alumnos
	WHERE tutor_id = 20
	ORDER BY colegiatura DESC
	LIMIT 1 OFFSET 1
);