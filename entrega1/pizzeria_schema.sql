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

CREATE TABLE IF NOT EXISTS entregues_domicili (
id INT NOT NULL PRIMARY KEY,
empleat_id INT,
comanda_id INT,
hora_entrega DATETIME,
FOREIGN KEY (empleat_id) REFERENCES empleat(id),
FOREIGN KEY (comanda_id) REFERENCES comanda(id)

);

