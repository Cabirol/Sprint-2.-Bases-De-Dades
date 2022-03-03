-- Llista quants productes del tipus 'begudes' s'han venut en una determinada localitat
SELECT localitat.nom, beguda_nombre 
	FROM pizzeria.localitat 
	JOIN pizzeria.cliente ON localitat.id=cliente.localitat_id
    JOIN pizzeria.comanda ON cliente.id=comanda.cliente_id
    
-- Llista quantes comandes ha efectuat un determinat empleat
SELECT empleat.nom, COUNT(comanda_id)
    FROM pizzeria.empleat
    JOIN pizzeria.entregues_domicili ON empleat.id = entregues_domicili.empleat_id