/**
  * Rangos y solapes
  */

-- Ejemplos iniciales --
SELECT *
FROM platzi.alumnos
WHERE tutor_id IN (11,12,13,14,15,16,17,18,19,20);

SELECT *
FROM platzi.alumnos
WHERE tutor_id >= 1
    AND tutor_id <= 10;

SELECT *
FROM platzi.alumnos
WHERE tutor_id BETWEEN 1 AND 10;

-- Esta consulta trae un entero pequeño y pregunta si el rango contiene al numero 3 
SELECT int4range(10, 20) @> 3; -- False 

-- Esta consulta trae un resultado booleano, ya que los && consultan entre los dos rangos de números de alta precisión si existen valores solapados entre ambos 
SELECT numrange(11.1, 22.2) && numrange(20.0, 30.0); -- True

-- Simplemente trae el menor número del rango. Funciona igual con UPPER
SELECT LOWER(int8range(15, 25)); -- 15

-- Esta consulta trae el rango numérico que comparten ambos rangos
SELECT int4range(10, 20) * int4range(15, 25); -- [15,20)

-- Booleano que detecta si el rango esta vacío
SELECT isempty(numrange(1, 5)); -- False

-- Filtrar alumnos cuyo tutor_id esté entre 10 y 20 --
SELECT *
FROM platzi.alumnos
WHERE int4range(10, 20) @> tutor_id;