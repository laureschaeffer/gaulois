-- 6 Nom des potions + coût de réalisation de la potion (trié par coût décroissant)

SELECT  p.nom_potion, SUM(i.cout_ingredient * c.qte) AS prixPotion 
FROM composer c
INNER JOIN ingredient i ON c.id_ingredient = i.id_ingredient
INNER JOIN potion p ON c.id_potion = p.id_potion
GROUP BY c.id_potion 
ORDER BY prixPotion DESC 