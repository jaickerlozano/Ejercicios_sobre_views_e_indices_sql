/* VISTAS
Dentro de la base de datos academia
*/
 
use academia;
-- 1. Crea una vista llamada ‘cursos_precio_alto’ con los cursos cuyo precio sea superior a 150
create view cursos_precio_alto as 
select * from cursos where precio > 150;
select * from cursos_precio_alto;
 
-- 2. Crea una vista llamada ‘cursos_alumno’ que tengan las columnas nombre del
-- curso y nombre del alumno. Tiene que aparecer el alumno y sus cursos
select * from cursos;
select * from alumnos;
create view cursos_alumno(nombre_del_curso, nombre_del_alumno) as
select c.nombre, a.nombre 
from cursos as c inner join alumnos as a
on c.cod_curso=a.cod_curso;

select * from cursos_alumno;

/*
3. Crea una vista llamada ‘asignaturas_curso’ en la que aparezcan los cursos con
las asignaturas que tienen. En este caso las columnas se llamarán
“Asignatura” y “curso”. Los nombres de las columnas deben ser creadas en la
declaración de la vista. También debe estar ordenado por el nombre del curso.
*/
select * from cursos;
select * from asignaturas;
create view asignaturas_curso(curso, asignatura) as
select c.nombre, a.nombre 
from cursos as c inner join asignaturas as a
on c.cod_curso=a.cod_curso;

select * from asignaturas_curso;

-- 4. Intenta insertar un nuevo curso a través de la vista ‘cursos_precio_alto’
select * from cursos_precio_alto;
insert into cursos_precio_alto (cod_curso, nombre, precio) values (11, 'CURSO11', 175);

select * from cursos;
-- Pude ingresar un nuevo curso a través de la vista ´cursos_precio_alto´ porque mantiene 
-- la misma cantidad de columnas o información que la tabla cursos

-- 5. Intenta hacer lo mismo con ‘asignaturas_curso’
select * from asignaturas_curso;
insert into asignaturas_curso values('CURSO12', 'asignatura12');
-- No me permite ingresar un nuevo curso porque solo cuento con una parte de la información de la tabla cursos y de asignaturas

-- 6. ¿Ysi le ponemos todas las columnas de las tablas asignaturas y cursos?
insert into asignaturas_curso (cursos.cod_curso, cursos.nombre, cursos.precio,
asignaturas.cod_asignatura, asignaturas.nombre, asignaturas.cod_curso, asignaturas.cod_profesor, asignaturas.duracion) 
values (12, 'CURSO12', 180, 51, 'asignatura12', 12, 15, 33);


/*7. Vamos ahora a probar el Check Option. Vamos a insertar una fila en la vista
“cursos_precio_alto” que sea de un curso que no cumpla la condición (precio
> 150) ¿funciona?*/
insert into cursos_precio_alto values (13, 'CURSO13', 140);
select * from cursos;
-- Si funciona, se pudo insertar la fila.

-- 8. Introduce un check option ahora
create or replace view cursos_precio_alto as
select * from cursos where precio > 150
with check option;

-- 9. Intenta insertar una fila que no cumpla las condiciones
insert into cursos_precio_alto values (14, 'CURSO14', 120);
select * from cursos_precio_alto;
select * from cursos;
-- No me permite insertar la fila porque el check option crea una restricción
insert into cursos_precio_alto values (15, 'CURSO15', 190);
select * from cursos_precio_alto;
select * from cursos;
-- Ingresando un precio más alto al valor estipulado en el check option, si me permite ingresar la fila


