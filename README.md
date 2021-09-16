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

