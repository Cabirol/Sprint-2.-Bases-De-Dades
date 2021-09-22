# Sprint-2.-Bases-De-Dades
Entregues de l'sprint 2 del curs de Node.js de Barcelona Activa. MySQL i MongoDB

## Continguts

- Entrega 1: Estructura de Dades - MySQL
  - Nivell 1, exercici 1: Òptica
  - Nivell 1, exercici 2: Pizzeria
  - Nivell 2: Youtube
  - Nivell 3: Spotify

## Entrega 1: Estructura de Dades - MySQL

Per a cada base de dades ha de pujar-se el següent:

- Model Relacional amb el disseny de la base de dades. Si ho desitges, pots utilitzar draw.io, dbdiagram.io, Mysql Workbench o qualsevol altra eina que et permeti dibuixar l'estructura i exportar-la en format png o jpg (per a pujar-la al repositori). Et recomanem especialment genmymodel.com.
- Script .sql de creació i càrrega de la base de dades.

### Nivell 1, exercici 1: Òptica

Una òptica, anomenada “Cul d'Ampolla”, vol informatitzar la gestió dels clients i vendes d'ulleres.

- En primer lloc l'òptica vol saber quin és el proveïdor de cadascuna de les ulleres. En concret vol saber de cada proveïdor el nom, l'adreça (carrer, número, pis, porta, ciutat, codi postal i país), telèfon, fax, NIF.

- La política de compres de l'òptica es basa en que les ulleres d'una marca es compraran a un únic proveïdor (així en podrà treure més bons preus), però poden comprar ulleres de diverses marques a un proveïdor. De les ulleres vol saber, la marca, la graduació de cadascun dels vidres, el tipus de muntura (flotant, pasta o metàl·lica), el color de la muntura, el color de cada vidre i el preu.

- Dels clients vol emmagatzemar el nom, l'adreça postal, el telèfon, el correu electrònic i la data de registre. També ens demanen, quan arriba un client nou, d'emmagatzemar el client que li ha recomanat l'establiment (sempre i quan algú li hagi recomanat). El nostre sistema haurà d’indicar qui ha sigut l’empleat que ha venut cada ullera.

### Nivell 1, exercici 2: Pizzeria

Un client t’ha ha contractat per a dissenyar una web que permeti fer comandes de menjar a domicili per Internet.

- Tingues en compte les següents indicacions per a modelar com seria la base de dades del projecte: Per a cada client emmagatzemem un identificador únic, nom, cognoms, adreça, codi postal, localitat, província i número de telèfon. Les dades de localitat i província estaran emmagatzemats en taules separades. Sabem que una localitat pertany a una única província, i que una província pot tenir moltes localitats. Per a cada localitat emmagatzemem un identificador únic i un nom. Per a cada província emmagatzemem un identificador únic i un nom.

- Un client pot realitzar moltes comandes, però una única comanda només pot ser realitzat per un únic client. De cada comanda s'emmagatzema un identificador únic, data/hora, si la comanda és per a repartiment a domicili o per a recollir en botiga, la quantitat de productes que s'han seleccionat de cada tipus i el preu total. Una comanda pot constar d'un o diversos productes.

- Els productes poden ser pizzes, hamburgueses i begudes. De cada producte s'emmagatzema: un identificador únic, nom, descripció, imatge i preu. En el cas de les pizzes existeixen diverses categories que poden anar canviant de nom al llarg de l'any. Una pizza només pot estar dins d'una categoria, però una categoria pot tenir moltes pizzes.

- De cada categoria s'emmagatzema un identificador únic i un nom. Una comanda és gestionada per una única botiga i una botiga pot gestionar moltes comandes. De cada botiga s'emmagatzema un identificador únic, adreça, codi postal, localitat i província. En una botiga poden treballar molts empleats i un empleat només pot treballar en una botiga. De cada empleat s'emmagatzema un identificador únic, nom, cognoms, nif, telèfon i si treballa com a cuiner o repartidor. Per a les comandes de repartiment a domicili interessa guardar qui és el repartidor que realitza el lliurament de la comanda i la data/hora del moment del lliurament.

## Entrega 2: MySQL queries

Entregar un fitxer amb les següents consultes sql sobre dues bases de dades. Cada consulta ha d'ocupar una línia, sense importar la seva longitud.

### Base de dades Tienda

Tenim les taules producto i fabricador, cadascuna amb els següents camps:
- producto (codigo, nombre, precio, codigo_fabricante)
- fabricante (codigo, nombre)
El camp 'codigo_fabricante' de l'entitat producto es relaciona amb el camp 'codi' de l'entitat fabricante.
Si us plau, efectua les siguentes consultes:

Llista el nom de tots els productos que hi ha en la taula producto.

Llista els noms i els preus de tots els productos de la taula producto.

Llista totes les columnes de la taula producto.

Llista el nom dels productos, el preu en euros i el preu en dòlars estatunidencs (USD).

Llista el nom dels productos, el preu en euros i el preu en dòlars estatunidencs (USD). Utilitza els següents àlies per a les columnes: nom de producto, euros, dolars.

Llista els noms i els preus de tots els productos de la taula producto, convertint els noms a majúscula.

Llista els noms i els preus de tots els productos de la taula producto, convertint els noms a minúscula.

Llista el nom de tots els fabricants en una columna, i en una altra columna obtingui en majúscules els dos primers caràcters del nom del fabricant.

Llista els noms i els preus de tots els productos de la taula producto, arrodonint el valor del preu.

Llista els noms i els preus de tots els productos de la taula producto, truncant el valor del preu per a mostrar-lo sense cap xifra decimal.
Llista el codi dels fabricants que tenen productos en la taula producto.

Llista el codi dels fabricants que tenen productos en la taula producto, eliminant els codis que apareixen repetits.

Llista els noms dels fabricants ordenats de manera ascendent.

Llista els noms dels fabricants ordenats de manera descendent.

Llista els noms dels productos ordenats en primer lloc pel nom de manera ascendent i en segon lloc pel preu de manera descendent.

Retorna una llista amb les 5 primeres files de la taula fabricante.

Retorna una llista amb 2 files a partir de la quarta fila de la taula fabricante. La quarta fila també s'ha d'incloure en la resposta.

Llista el nom i el preu del producto més barat. (Utilitzi solament les clàusules ORDER BY i LIMIT). NOTA: Aquí no podria usar MIN(preu), necessitaria GROUP BY

Llista el nom i el preu del producto més car. (Utilitzi solament les clàusules ORDER BY i LIMIT). NOTA: Aquí no podria usar MAX(preu), necessitaria GROUP BY.

Llista el nom de tots els productos del fabricant el codi de fabricant del qual és igual a 2.

Retorna una llista amb el nom del producte, preu i nom de fabricant de tots els productes de la base de dades.

Retorna una llista amb el nom del producte, preu i nom de fabricant de tots els productes de la base de dades. Ordeni el resultat pel nom del fabricador, per ordre alfabètic.

Retorna una llista amb el codi del producte, nom del producte, codi del fabricador i nom del fabricador, de tots els productes de la base de dades.

Retorna el nom del producte, el seu preu i el nom del seu fabricant, del producte més barat.

Retorna el nom del producte, el seu preu i el nom del seu fabricant, del producte més car.

Retorna una llista de tots els productes del fabricador Lenovo.

Retorna una llista de tots els productes del fabricant Crucial que tinguin un preu major que 200€.

Retorna un llistat amb tots els productes dels fabricants Asus, Hewlett-Packardy Seagate. Sense utilitzar l'operador IN.

Retorna un llistat amb tots els productes dels fabricants Asus, Hewlett-Packardy Seagate. Utilitzant l'operador IN.

Retorna un llistat amb el nom i el preu de tots els productes dels fabricants el nom dels quals acabi per la vocal e.

Retorna un llistat amb el nom i el preu de tots els productes el nom de fabricant dels quals contingui el caràcter w en el seu nom.

Retorna un llistat amb el nom de producte, preu i nom de fabricant, de tots els productes que tinguin un preu major o igual a 180€. Ordeni el resultat en primer lloc pel preu (en ordre descendent) i en segon lloc pel nom (en ordre ascendent)

Retorna un llistat amb el codi i el nom de fabricant, solament d'aquells fabricants que tenen productes associats en la base de dades.

Retorna un llistat de tots els fabricants que existeixen en la base de dades, juntament amb els productes que té cadascun d'ells. El llistat haurà de mostrar també aquells fabricants que no tenen productes associats.

Retorna un llistat on només apareguin aquells fabricants que no tenen cap producte associat.

Retorna tots els productes del fabricador Lenovo. (Sense utilitzar INNER JOIN).

Retorna totes les dades dels productes que tenen el mateix preu que el producte més car del fabricador Lenovo. (Sense utilitzar INNER JOIN).

Llista el nom del producte més car del fabricador Lenovo.

Llista el nom del producte més barat del fabricant Hewlett-Packard.

Retorna tots els productes de la base de dades que tenen un preu major o igual al producte més car del fabricador Lenovo.

Llesta tots els productes del fabricador Asus que tenen un preu superior al preu mitjà de tots els seus productes.


### Base de dades Universidad

Si us plau, descàrrega la base de dades del fitxer schema_universidad.sql, visualitza el diagrama E-R en un editor i efectua les següents consultes:

Retorna un llistat amb el primer cognom, segon cognom i el nom de tots els alumnes. El llistat haurà d'estar ordenat alfabèticament de menor a major pel primer cognom, segon cognom i nom.

Esbrina el nom i els dos cognoms dels alumnes que no han donat d'alta el seu número de telèfon en la base de dades.

Retorna el llistat dels alumnes que van néixer en 1999.

Retorna el llistat de professors que no han donat d'alta el seu número de telèfon en la base de dades i a més la seva nif acaba en K.

Retorna el llistat de les assignatures que s'imparteixen en el primer quadrimestre, en el tercer curs del grau que té l'identificador 7.

Retorna un llistat dels professors juntament amb el nom del departament al qual estan vinculats. El llistat ha de retornar quatre columnes, primer cognom, segon cognom, nom i nom del departament. El resultat estarà ordenat alfabèticament de menor a major pels cognoms i el nom.

Retorna un llistat amb el nom de les assignatures, any d'inici i any de fi del curs escolar de l'alumne amb nif 26902806M.

Retorna un llistat amb el nom de tots els departaments que tenen professors que imparteixen alguna assignatura en el Grau en Enginyeria Informàtica (Pla 2015).

Retorna un llistat amb tots els alumnes que s'han matriculat en alguna assignatura durant el curs escolar 2018/2019.

- Resolgui les 6 següents consultes utilitzant les clàusules LEFT JOIN i RIGHT JOIN.

Retorna un llistat amb els noms de tots els professors i els departaments que tenen vinculats. El llistat també ha de mostrar aquells professors que no tenen cap departament associat. El llistat ha de retornar quatre columnes, nom del departament, primer cognom, segon cognom i nom del professor. El resultat estarà ordenat alfabèticament de menor a major pel nom del departament, cognoms i el nom.

Retorna un llistat amb els professors que no estan associats a un departament.

Retorna un llistat amb els departaments que no tenen professors associats.

Retorna un llistat amb els professors que no imparteixen cap assignatura.

Retorna un llistat amb les assignatures que no tenen un professor assignat.

Retorna un llistat amb tots els departaments que no han impartit assignatures en cap curs escolar.

- Consultes resum:

Retorna el nombre total d'alumnes que hi ha.

Calcula quants alumnes van néixer en 1999.

Calcula quants professors hi ha en cada departament. El resultat només ha de mostrar dues columnes, una amb el nom del departament i una altra amb el nombre de professors que hi ha en aquest departament. El resultat només ha d'incloure els departaments que tenen professors associats i haurà d'estar ordenat de major a menor pel nombre de professors.

Retorna un llistat amb tots els departaments i el nombre de professors que hi ha en cadascun d'ells. Tingui en compte que poden existir departaments que no tenen professors associats. Aquests departaments també han d'aparèixer en el llistat.

Retorna un llistat amb el nom de tots els graus existents en la base de dades i el nombre d'assignatures que té cadascun. Tingui en compte que poden existir graus que no tenen assignatures associades. Aquests graus també han d'aparèixer en el llistat. El resultat haurà d'estar ordenat de major a menor pel nombre d'assignatures.

Retorna un llistat amb el nom de tots els graus existents en la base de dades i el nombre d'assignatures que té cadascun, dels graus que tinguin més de 40 assignatures associades.

Retorna un llistat que mostri el nom dels graus i la suma del nombre total de crèdits que hi ha per a cada tipus d'assignatura. El resultat ha de tenir tres columnes: nom del grau, tipus d'assignatura i la suma dels crèdits de totes les assignatures que hi ha d'aquest tipus.

Retorna un llistat que mostri quants alumnes s'han matriculat d'alguna assignatura en cadascun dels cursos escolars. El resultat haurà de mostrar dues columnes, una columna amb l'any d'inici del curs escolar i una altra amb el nombre d'alumnes matriculats.

Retorna un llistat amb el nombre d'assignatures que imparteix cada professor. El llistat ha de tenir en compte aquells professors que no imparteixen cap assignatura. El resultat mostrarà cinc columnes: id, nom, primer cognom, segon cognom i nombre d'assignatures. El resultat estarà ordenat de major a menor pel nombre d'assignatures.

Retorna totes les dades de l'alumne més jove.

Retorna un llistat amb els professors que tenen un departament associat i que no imparteixen cap assignatura.

