DROP DATABASE IF EXISTS pizzeria;
CREATE SCHEMA IF NOT EXISTS pizzeria;
USE pizzeria;

CREATE TABLE IF NOT EXISTS provincia (
	id INT NOT NULL PRIMARY KEY,
  nom VARCHAR(45)

);

CREATE TABLE IF NOT EXISTS localitat (
	id INT NOT NULL PRIMARY KEY,
    nom VARCHAR(45),
    provincia_id INT,
	FOREIGN KEY (provincia_id) REFERENCES provincia(id)
    
);

CREATE TABLE IF NOT EXISTS cliente (
  id INT NOT NULL PRIMARY KEY,
  nom VARCHAR(45),
  cognom1 VARCHAR(45),
  cognom2 VARCHAR(45),
  adreça VARCHAR(45),
  codi_postal VARCHAR(5),
  localitat_id INT,
  telefon VARCHAR(45),
  FOREIGN KEY (localitat_id) REFERENCES localitat(id)
    
);
    
CREATE TABLE IF NOT EXISTS botiga (
  id INT NOT NULL PRIMARY KEY,
  adreça VARCHAR(45),
  codi_postal VARCHAR(5),
  localitat_id INT,
  FOREIGN KEY (localitat_id) REFERENCES localitat(id)
    
);

CREATE TABLE IF NOT EXISTS empleat (
  id INT NOT NULL PRIMARY KEY,
  nom VARCHAR(45),
  cognom1 VARCHAR(45),
  cognom2 VARCHAR(45),
  nif VARCHAR(9),
  telefon VARCHAR(45),
  càrrec ENUM('cuiner','repartidor'),
  botiga_id INT,
  FOREIGN KEY (botiga_id) REFERENCES botiga(id)
    
);

CREATE TABLE IF NOT EXISTS categoria (
	id INT NOT NULL PRIMARY KEY,
    nom VARCHAR(45)

);

CREATE TABLE IF NOT EXISTS producte (
	id INT NOT NULL PRIMARY KEY,
    nom VARCHAR(45),
    tipus ENUM('Pizza', 'Hamburguesa', 'Beguda'),
    descripció TEXT,
    preu DECIMAL(4,2),
    categoria_id INT,
    FOREIGN KEY (categoria_id) REFERENCES categoria(id)

);

CREATE TABLE IF NOT EXISTS comanda (
  id INT NOT NULL PRIMARY KEY,
  cliente_id INT,
  botiga_id INT,
  hora_comanda DATETIME,
  tipus ENUM('domicili', 'botiga'),
  pizza_nombre INT,
  hamburguesa_nombre INT,
  beguda_nombre INT,
  preu_total DECIMAL(4,2),
  FOREIGN KEY (cliente_id) REFERENCES cliente(id),
  FOREIGN KEY (botiga_id) REFERENCES botiga(id)
  
);

CREATE TABLE IF NOT EXISTS productes_comanda (
  id INT NOT NULL PRIMARY KEY,
    quantitat INT,
    comanda_id INT,
    producte_id INT,
    FOREIGN KEY (comanda_id) REFERENCES comanda(id),
    FOREIGN KEY (producte_id) REFERENCES producte(id)
);

CREATE TABLE IF NOT EXISTS entregues_domicili (
  id INT NOT NULL PRIMARY KEY,
    empleat_id INT,
    comanda_id INT,
    hora_entrega DATETIME,
    FOREIGN KEY (empleat_id) REFERENCES empleat(id),
    FOREIGN KEY (comanda_id) REFERENCES comanda(id)

);

INSERT INTO provincia VALUES (1, 'Barcelona');
INSERT INTO provincia VALUES (2, 'Girona');

INSERT INTO localitat VALUES (1, 'Barcelona', 1);
INSERT INTO localitat VALUES (2, 'Sant Cugat', 1);
INSERT INTO localitat VALUES (3, 'Girona', 2);

INSERT INTO cliente VALUES (1, 'Miquel', 'Sirvent', 'Ferrer', 'Av. Principal, 245, 1er segona', '08034', 1, '9312345678');
INSERT INTO cliente VALUES (2, 'Anna', 'Pérez', 'Casasses', 'C/Joan Boscà, 52', '08022', 3, '9387654321');
INSERT INTO cliente VALUES (3, 'Eva', 'López', 'Sánchez', 'Av. General, 2, tercer', '08505', 2, '9311223344');

INSERT INTO botiga VALUES (1, 'Carrer Major, 3', '08023', 1);
INSERT INTO botiga VALUES (2, 'Carrer Llarg, 56', '02022', 2);

INSERT INTO empleat VALUES (1, 'Maria', 'Clarís', 'Ferrés', '12312323A', '9334534545', 'cuiner', 1);
INSERT INTO empleat VALUES (2, 'Clara', 'Montero', 'Oller', '34534545G', '667858585', 'repartidor', 1);
INSERT INTO empleat VALUES (3, 'Marta', 'Guerrero', 'Matos', '56756767E', '668383838', 'cuiner', 2);
INSERT INTO empleat VALUES (4, 'Pau', 'Escobar', 'Rodríguez', '98765678R', '655588445', 'repartidor', 2);

INSERT INTO categoria VALUES (1, 'Massa fina');
INSERT INTO categoria VALUES (2, 'Massa gorda');

INSERT INTO producte VALUES (1, 'Carbonara', 'Pizza', 'Molt bona', 10, 1);
INSERT INTO producte VALUES (2, 'Vegetariana', 'Hamburguesa', 'Molt abundant', 4, 1);
INSERT INTO producte VALUES (3, 'Cervesa', 'Beguda', 'Molt refrescant', 2, 1);

INSERT INTO comanda VALUES (1, 1, 1, '2020-01-01 09:10:10','domicili', 3, 0, 1, 32);

INSERT INTO productes_comanda VALUES (1, 3, 1, 1);
INSERT INTO productes_comanda VALUES (2, 1, 1, 3);

INSERT INTO entregues_domicili VALUES (1, 2, 1, '2020-01-01 10:10:10');