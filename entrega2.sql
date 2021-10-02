SELECT nombre FROM tienda.producto;
SELECT nombre, precio FROM tienda.producto;
SELECT * FROM tienda.producto;
SELECT nombre, precio, precio*1.17 FROM tienda.producto;
SELECT nombre AS 'nom de producto', precio AS euros, precio*1.17 AS dolars FROM tienda.producto;
SELECT UCASE(nombre), precio FROM tienda.producto;
SELECT LCASE(nombre), precio FROM tienda.producto;
SELECT nombre, UCASE(SUBSTR(nombre, 1, 2)) FROM tienda.fabricante;
SELECT nombre, ROUND(precio, 0) FROM tienda.producto;
SELECT nombre, TRUNCATE(precio, 0) FROM tienda.producto;
SELECT codigo_fabricante FROM tienda.producto;
SELECT DISTINCT codigo_fabricante FROM tienda.producto;
SELECT nombre FROM tienda.fabricante ORDER BY nombre;
SELECT nombre FROM tienda.fabricante ORDER BY nombre DESC;
SELECT nombre FROM tienda.producto ORDER BY nombre, precio DESC;
SELECT * FROM tienda.fabricante LIMIT 5;
SELECT * FROM tienda.fabricante LIMIT 3, 2;
-- Llista el nom i el preu del producto més barat. (Utilitzi solament les clàusules ORDER BY i LIMIT). NOTA: Aquí no podria usar MIN(preu), necessitaria GROUP BY
-- Llista el nom i el preu del producto més car. (Utilitzi solament les clàusules ORDER BY i LIMIT). NOTA: Aquí no podria usar MAX(preu), necessitaria GROUP BY.
-- Llista el nom de tots els productos del fabricant el codi de fabricant del qual és igual a 2.
-- Retorna una llista amb el nom del producte, preu i nom de fabricant de tots els productes de la base de dades.
-- Retorna una llista amb el nom del producte, preu i nom de fabricant de tots els productes de la base de dades. Ordeni el resultat pel nom del fabricador, per ordre alfabètic.
-- Retorna una llista amb el codi del producte, nom del producte, codi del fabricador i nom del fabricador, de tots els productes de la base de dades.
-- Retorna el nom del producte, el seu preu i el nom del seu fabricant, del producte més barat.
-- Retorna el nom del producte, el seu preu i el nom del seu fabricant, del producte més car.
-- Retorna una llista de tots els productes del fabricador Lenovo.
-- Retorna una llista de tots els productes del fabricant Crucial que tinguin un preu major que 200€.
-- Retorna un llistat amb tots els productes dels fabricants Asus, Hewlett-Packardy Seagate. Sense utilitzar l'operador IN.
-- Retorna un llistat amb tots els productes dels fabricants Asus, Hewlett-Packardy Seagate. Utilitzant l'operador IN.
-- Retorna un llistat amb el nom i el preu de tots els productes dels fabricants el nom dels quals acabi per la vocal e.
-- Retorna un llistat amb el nom i el preu de tots els productes el nom de fabricant dels quals contingui el caràcter w en el seu nom.
-- Retorna un llistat amb el nom de producte, preu i nom de fabricant, de tots els productes que tinguin un preu major o igual a 180€. Ordeni el resultat en primer lloc pel preu (en ordre descendent) i en segon lloc pel nom (en ordre ascendent)
-- Retorna un llistat amb el codi i el nom de fabricant, solament d'aquells fabricants que tenen productes associats en la base de dades.
-- Retorna un llistat de tots els fabricants que existeixen en la base de dades, juntament amb els productes que té cadascun d'ells. El llistat haurà de mostrar també aquells fabricants que no tenen productes associats.
-- Retorna un llistat on només apareguin aquells fabricants que no tenen cap producte associat.
-- Retorna tots els productes del fabricador Lenovo. (Sense utilitzar INNER JOIN).
-- Retorna totes les dades dels productes que tenen el mateix preu que el producte més car del fabricador Lenovo. (Sense utilitzar INNER JOIN).
-- Llista el nom del producte més car del fabricador Lenovo.
-- Llista el nom del producte més barat del fabricant Hewlett-Packard.
-- Retorna tots els productes de la base de dades que tenen un preu major o igual al producte més car del fabricador Lenovo.
-- Llesta tots els productes del fabricador Asus que tenen un preu superior al preu mitjà de tots els seus productes.
SELECT nombre, apellido1, apellido2 FROM universidad.persona WHERE tipo='alumno' ORDER BY nombre, apellido1, apellido2;
SELECT nombre, apellido1, apellido2 FROM universidad.persona WHERE tipo='alumno' AND telefono IS NULL;
SELECT * FROM universidad.persona WHERE tipo='alumno' AND YEAR(fecha_nacimiento)=1999;
SELECT * FROM universidad.persona WHERE tipo='profesor' AND telefono IS NULL AND SUBSTR(nif, 9, 1)='K';
SELECT * FROM universidad.asignatura WHERE cuatrimestre=1 AND curso=3 AND id_grado=7;
SELECT apellido1, apellido2, persona.nombre, departamento.nombre AS 'nombre departamento' FROM universidad.persona JOIN universidad.profesor ON persona.id=id_profesor JOIN universidad.departamento ON departamento.id=id_departamento ORDER BY apellido1, apellido2, persona.nombre;
SELECT asignatura.nombre, anyo_inicio, anyo_fin FROM universidad.alumno_se_matricula_asignatura JOIN universidad.asignatura ON id_asignatura=asignatura.id JOIN universidad.curso_escolar ON id_curso_escolar=curso_escolar.id JOIN universidad.persona ON id_alumno=persona.id WHERE persona.nif='26902806M';
SELECT DISTINCT departamento.nombre FROM universidad.departamento JOIN universidad.profesor ON departamento.id=id_departamento JOIN universidad.asignatura ON profesor.id_profesor=asignatura.id_profesor JOIN universidad.grado ON id_grado=grado.id WHERE grado.nombre='Grado en Ingeniería Informática (Plan 2015)';
SELECT DISTINCT persona.* FROM universidad.persona JOIN universidad.alumno_se_matricula_asignatura ON persona.id=id_alumno JOIN universidad.curso_escolar ON id_curso_escolar=curso_escolar.id WHERE anyo_inicio='2018' AND anyo_fin='2019';
SELECT departamento.nombre, apellido1, apellido2, persona.nombre, id_profesor FROM universidad.persona JOIN universidad.profesor ON persona.id=id_profesor LEFT JOIN universidad.departamento ON id_departamento=departamento.id ORDER BY departamento.nombre, apellido1, apellido2, persona.nombre;
SELECT persona.* FROM universidad.persona JOIN universidad.profesor ON persona.id=id_profesor LEFT JOIN universidad.departamento ON id_departamento=departamento.id WHERE departamento.id IS NULL;
SELECT departamento.nombre FROM universidad.departamento LEFT JOIN universidad.profesor ON departamento.id=id_departamento WHERE id_profesor IS NULL;
SELECT persona.* FROM universidad.persona JOIN universidad.profesor ON persona.id=id_profesor LEFT JOIN universidad.asignatura ON profesor.id_profesor=asignatura.id_profesor WHERE asignatura.id_profesor IS NULL;
SELECT asignatura.nombre FROM universidad.asignatura LEFT JOIN universidad.profesor ON asignatura.id_profesor=profesor.id_profesor WHERE asignatura.id_profesor IS NULL;
SELECT departamento.nombre FROM universidad.departamento WHERE departamento.nombre NOT IN (SELECT departamento.nombre FROM universidad.departamento LEFT JOIN universidad.profesor ON departamento.id=id_departamento LEFT JOIN universidad.asignatura ON profesor.id_profesor=asignatura.id_profesor LEFT JOIN universidad.alumno_se_matricula_asignatura ON asignatura.id=alumno_se_matricula_asignatura.id_asignatura WHERE id_curso_escolar IS NOT NULL);
SELECT COUNT(persona.id) FROM universidad.persona WHERE persona.tipo='alumno';
SELECT COUNT(persona.id) FROM universidad.persona WHERE persona.tipo='alumno' AND YEAR(fecha_nacimiento)=1999;
SELECT departamento.nombre, COUNT(id_profesor) FROM universidad.departamento JOIN universidad.profesor ON departamento.id=id_departamento GROUP BY departamento.nombre ORDER BY COUNT(id_profesor) DESC;
SELECT departamento.nombre, COUNT(id_profesor) FROM universidad.departamento LEFT JOIN universidad.profesor ON departamento.id=id_departamento GROUP BY departamento.nombre;
SELECT grado.nombre, COUNT(asignatura.id) FROM universidad.grado LEFT JOIN universidad.asignatura ON grado.id=id_grado GROUP BY grado.nombre ORDER BY COUNT(asignatura.id) DESC;
SELECT grado.nombre, COUNT(asignatura.id) FROM universidad.grado JOIN universidad.asignatura ON grado.id=id_grado GROUP BY grado.nombre HAVING COUNT(asignatura.id) > '40';
SELECT grado.nombre, asignatura.tipo, SUM(asignatura.creditos) FROM universidad.grado JOIN universidad.asignatura ON grado.id=id_grado GROUP BY grado.nombre, asignatura.tipo;
SELECT curso_escolar.anyo_inicio, COUNT(DISTINCT alumno_se_matricula_asignatura.id_alumno) FROM universidad.curso_escolar JOIN universidad.alumno_se_matricula_asignatura ON curso_escolar.id=id_curso_escolar GROUP BY curso_escolar.anyo_inicio;
SELECT persona.id, persona.nombre, apellido1, apellido2, COUNT(asignatura.id) FROM universidad.persona JOIN universidad.profesor ON persona.id=id_profesor LEFT JOIN universidad.asignatura ON profesor.id_profesor=asignatura.id_profesor GROUP BY persona.id ORDER BY COUNT(asignatura.id) DESC;
SELECT * FROM universidad.persona WHERE tipo='alumno' ORDER BY fecha_nacimiento DESC LIMIT 1;
SELECT persona.* FROM universidad.persona JOIN universidad.profesor ON persona.id=id_profesor JOIN universidad.departamento ON id_departamento=departamento.id LEFT JOIN universidad.asignatura ON profesor.id_profesor=asignatura.id_profesor WHERE asignatura.id IS NULL;