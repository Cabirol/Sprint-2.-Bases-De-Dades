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
  provincia_id INT,
  telefon VARCHAR(45),
  FOREIGN KEY (localitat_id) REFERENCES localitat(id),
  FOREIGN KEY (provincia_id) REFERENCES provincia(id)
    
);
    
CREATE TABLE IF NOT EXISTS botiga (
  id INT NOT NULL PRIMARY KEY,
  adreça VARCHAR(45),
  codi_postal VARCHAR(5),
  localitat_id INT,
  provincia_id INT,
  FOREIGN KEY (localitat_id) REFERENCES localitat(id),
  FOREIGN KEY (provincia_id) REFERENCES provincia(id)
    
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

CREATE TABLE IF NOT EXISTS pizza (
	id INT NOT NULL PRIMARY KEY,
    nom VARCHAR(45),
    descripció TEXT,
    imatge LONGBLOB,
    preu DECIMAL(2,2),
    categoria_id INT,
    FOREIGN KEY (categoria_id) REFERENCES categoria(id)

);

CREATE TABLE IF NOT EXISTS hamburguesa (
	id INT NOT NULL PRIMARY KEY,
    nom VARCHAR(45),
    descripció TEXT,
    imatge LONGBLOB,
    preu DECIMAL(2,2)

);

CREATE TABLE IF NOT EXISTS beguda (
	id INT NOT NULL PRIMARY KEY,
    nom VARCHAR(45),
    descripció TEXT,
    imatge LONGBLOB,
    preu DECIMAL(2,2)

);

CREATE TABLE IF NOT EXISTS `optica_culdesac`.`ULLERES` (
  `ulleres_id` INT NOT NULL,
  `marca_id` INT,
  `grad_dret` DECIMAL(9,2),
  `grad_esquerra` DECIMAL(9,2),
  `montura_tipus` ENUM('F', 'M', 'P') COMMENT 'Tres montures possibles:\nF = Flotant\nM = Metàl·lica\nP = Pasta',
  `montura_color` VARCHAR(45),
  `vidres_color` VARCHAR(45),
  `preu` DECIMAL(9,2),
  `client_id` INT,
  `empleat_id` INT,
  `data_factura` DATE,
  PRIMARY KEY (`ulleres_id`),
  FOREIGN KEY (`marca_id`) REFERENCES `MARCA` (`marca_id`),
  FOREIGN KEY (`client_id`) REFERENCES `CLIENT` (`client_id`),
  FOREIGN KEY (`empleat_id`) REFERENCES `EMPLEAT` (`empleat_id`)
  
);

INSERT INTO `ADREÇA` VALUES (1, 'Carrer Major', '42B', 'Sobreàtic', '2', '00802', 'Barcelona', 'Espanya');
INSERT INTO `ADREÇA` VALUES (2, 'Avinguda Principal', '245-247', '1', '3', '08034', 'Barcelona', 'Espanya');
INSERT INTO `ADREÇA` VALUES (3, 'Carrer Joan Boscà', '52', '5', NULL, '08022', 'Mataró', 'Espanya');

INSERT INTO `CLIENT` VALUES (1, 'Miquel Sirvent i Ferrer', '931234567', 'msirvent@mail.com', '2020/08/23', 1, NULL);
INSERT INTO `CLIENT` VALUES (2, 'Anna Pérez Casasses', '937654321', 'anna_86@mail.com', '2020/11/15', 2, 1);

INSERT INTO `PROVEIDOR` VALUES ('35752258G', 'Focus', '931324354', '931324354', 3);

INSERT INTO `MARCA` VALUES (1, 'Raybon', '35752258G');
INSERT INTO `MARCA` VALUES (2, 'Veubé', '35752258G');

INSERT INTO `EMPLEAT` VALUES (1, 'Maria Ribes i Casals');

INSERT INTO `ULLERES` VALUES (1, 1, 0.50, 0.50, 'M', 'negre', NULL, 59.99, 1, 1, '2020/08/23');
INSERT INTO `ULLERES` VALUES (2, 2, -0.75, -1.00, 'F', 'negre', NULL, 67.49, 2, 1, '2020/11/21');

