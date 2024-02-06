-- C Supprimez les casques grecs qui n'ont jamais été pris lors d'une bataille


-- affiche les casques de type 2 "casques grecs" qui n'ont jamais utilités pendant une bataille
SELECT c.id_casque, c.id_type_casque 
FROM casque c
INNER JOIN type_casque tc ON c.id_type_casque = tc.id_type_casque
WHERE c.id_type_casque=2 AND c.id_casque NOT IN (
	SELECT id_casque
	FROM prendre_casque);

-- retourne les vasques 20/21/22/23

-- suppression des données
DELETE c
FROM casque c
INNER JOIN type_casque tc ON c.id_type_casque = tc.id_type_casque
WHERE c.id_type_casque=2 AND c.id_casque NOT IN (
	SELECT id_casque
	FROM prendre_casque)