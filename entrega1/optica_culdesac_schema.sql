CREATE SCHEMA IF NOT EXISTS `optica_culdesac`;
USE `optica_culdesac`;

CREATE TABLE IF NOT EXISTS `optica_culdesac`.`ADREÇA` (
  `adreça_id` INT NOT NULL,
  `carrer` VARCHAR(45),
  `num` VARCHAR(45),
  `pis` VARCHAR(45),
  `porta` VARCHAR(45),
  `codi_postal` VARCHAR(5),
  `ciutat` VARCHAR(45),
  `pais` VARCHAR(45),
  PRIMARY KEY (`adreça_id`)
  
);
  
CREATE TABLE IF NOT EXISTS `optica_culdesac`.`CLIENT` (
  `client_id` INT NOT NULL,
  `client_nom` VARCHAR(45),
  `client_tel` VARCHAR(45),
  `client_email` VARCHAR(45),
  `client_registre` DATE,
  `client_adreça_id` INT,
  `recomanat_per` INT,
  PRIMARY KEY (`client_id`),
  FOREIGN KEY (`client_adreça_id`) REFERENCES `ADREÇA` (`adreça_id`),
  FOREIGN KEY (`recomanat_per`) REFERENCES `CLIENT` (`client_id`)
    
);
    
CREATE TABLE IF NOT EXISTS `optica_culdesac`.`PROVEIDOR` (
  `proveidor_NIF` VARCHAR(9) NOT NULL,
  `proveidor_nom` VARCHAR(45),
  `proveidor_tel` VARCHAR(45),
  `proveidor_fax` VARCHAR(45),
  `proveidor_adreça_id` INT,
  PRIMARY KEY (`proveidor_NIF`),
  FOREIGN KEY (`proveidor_adreça_id`) REFERENCES `ADREÇA` (`adreça_id`)
  
);

CREATE TABLE IF NOT EXISTS `optica_culdesac`.`MARCA` (
  `marca_id` INT NOT NULL,
  `marca_nom` VARCHAR(45),
  `proveidor_marca_NIF` VARCHAR(9),
  PRIMARY KEY (`marca_id`),
  FOREIGN KEY (`proveidor_marca_NIF`) REFERENCES `PROVEIDOR` (`proveidor_NIF`)
  
  );
  
CREATE TABLE IF NOT EXISTS `optica_culdesac`.`EMPLEAT` (
  `empleat_id` INT NOT NULL,
  `empleat_nom` VARCHAR(45),
  PRIMARY KEY (`empleat_id`)
  
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

