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
-- Retorna un llistat amb el nom de les assignatures, any d'inici i any de fi del curs escolar de l'alumne amb nif 26902806M.
-- Retorna un llistat amb el nom de tots els departaments que tenen professors que imparteixen alguna assignatura en el Grau en Enginyeria Informàtica (Pla 2015).
-- Retorna un llistat amb tots els alumnes que s'han matriculat en alguna assignatura durant el curs escolar 2018/2019.