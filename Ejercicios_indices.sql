/*
ÍNDICES
 Dentro de la base de datos academia
*/
use academia;
-- 1. Crear un índice llamado i_nombre en la tabla cursos y columna “nombre”
create index i_nombre on cursos(nombre);
select * from cursos;
-- 2. Mostrar los índices de la tabla “cursos”
show indexes from cursos;

--  3. ¿Por qué aparecen dos?
/*
Porque uno es el indice que aparece con la primary key y el segundo es el creado por nosotros
*/

-- 4. Comprobar con EXPLAIN qué índice se usa la consultar por “nombre”
explain select * from cursos where nombre = 'CURSO10';

-- 5. Borrar el índice
drop index i_nombre on cursos;
show indexes from cursos;

-- 6. Volver a crearlo pero de tipo único y comprobar que se ha creado. La columna
-- “Non unique” debe ser de tipo 0 (único).
create unique index i_nombre on cursos(nombre);

/*
7. Crear la siguiente tabla. Debemos crear los índices en el momento de creación
de la tabla. Después, comprobar la creación de estos índices.
COLUMNA         TIPO          ÍNDICES
CODIGO          INT           PRIMARY
NOMBRE         VARCHAR        UNIQUE
APELLIDOS      VARCHAR    Índice sobre apellidos y
							  nombre
*/
create table ejercicio7 (
CODIGO INT PRIMARY KEY,
NOMBRE VARCHAR(50) UNIQUE,
APELLIDOS VARCHAR(100),
INDEX NOMBRE_COMPLETO(NOMBRE, APELLIDOS)
);

show indexes from ejercicio7;