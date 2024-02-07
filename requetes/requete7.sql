-- 7 Nom des ingrédients + coût + quantité de chaque ingrédient qui composent la potion 'Santé'

SELECT  p.nom_potion, i.nom_ingredient, i.cout_ingredient, c.qte, (i.cout_ingredient * c.qte) AS coutIngredientQte
FROM composer c
INNER JOIN ingredient i ON c.id_ingredient = i.id_ingredient
INNER JOIN potion p ON c.id_potion = p.id_potion
WHERE p.id_potion = 3
GROUP BY i.id_ingredient