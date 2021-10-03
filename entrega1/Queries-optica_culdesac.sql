-- Ulleres venudes al client Miquel Servent durant l'any 2020.
SELECT client_nom, marca_nom, grad_dret, grad_esquerra, montura_tipus, montura_color, vidres_color, preu, empleat_nom, data_factura 
		FROM optica_culdesac.ulleres 
	JOIN optica_culdesac.client ON ulleres.client_id=client.client_id 
    JOIN optica_culdesac.marca ON ulleres.marca_id=marca.marca_id 
    JOIN optica_culdesac.empleat ON ulleres.empleat_id=empleat.empleat_id 
    WHERE ulleres.client_id=1 AND YEAR(data_factura)=2020;
    
-- Models d'ulleres venuts per l'empleat durant l'any 2020.
SELECT empleat_nom, marca_nom, montura_tipus, montura_color, vidres_color, data_factura
		FROM optica_culdesac.ulleres 
    JOIN optica_culdesac.marca ON ulleres.marca_id=marca.marca_id 
    JOIN optica_culdesac.empleat ON ulleres.empleat_id=empleat.empleat_id 
    WHERE ulleres.empleat_id=1 AND YEAR(data_factura)=2020;
    
-- Llista de proveïdors que han venut ulleres.
SELECT proveidor_nom
		FROM optica_culdesac.proveidor
	JOIN optica_culdesac.marca ON proveidor_NIF=proveidor_marca_NIF
    JOIN optica_culdesac.ulleres ON marca.marca_id=ulleres.marca_id
    GROUP BY proveidor_nom;
