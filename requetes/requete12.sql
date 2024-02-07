-- 12 Nom des potions dont un des ingrédients est le poisson frais

SELECT p.nom_potion, i.nom_ingredient 
FROM composer c
INNER JOIN potion p ON c.id_potion = p.id_potion
INNER JOIN ingredient i ON c.id_ingredient = c.id_ingredient
WHERE i.id_ingredient = 24