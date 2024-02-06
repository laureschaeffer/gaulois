-- 11 Combien existe-t-il de casques de chaque type et quel est leur coût total ? (classés par DESC)

SELECT COUNT(id_type_casque) AS nbTypeCasque, SUM(cout_casque) AS coupCasque
FROM casque
GROUP BY id_type_casque
ORDER BY coupCasque DESC