-- PRESENTAR LA SEGUNDA MITAD DE LA TABLA PLATZI_ALUMNOS
-- ROW_NUMBER Aprobechando las propiedades de las window funcions
-- OVER() Particion default (toda la tabla)
-- AS Alias 
-- * Concatenamos todos los campos (no solo los row_id, traemos todo)
SELECT ROW_NUMBER() OVER() AS row_id, *
FROM platzi.alumnos
-- Vamos a saltarnos una cierta cantidad de rows y vamos a traer los demas con OFFSET
OFFSET (
	-- COUNT(*) Va a contar todos los registros de la tabla, los va a partir a la mitad y esa mitad lo va a usar como el OFFSET y traera los demas registros
	SELECT COUNT(*)/2
	-- Hacemos FROM nuevamente porque necesitamos que cuente primero los rows de esa misma tabla para sacar la segunda mitad
	FROM platzi.alumnos
);