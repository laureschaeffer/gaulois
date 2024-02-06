-- E. La potion 'Soupe' ne doit plus contenir de persil.

-- afficher info potion 'soupe'
SELECT *
FROM composer c
INNER JOIN ingredient i ON c.id_ingredient = i.id_ingredient
WHERE id_potion=9;

-- cibler ligne ingredient persil dans la potion 9
SELECT * 
FROM composer
WHERE id_potion = 9 
AND id_ingredient = 19;


-- supprimer
DELETE 
FROM composer
WHERE id_potion = 9 
AND id_ingredient = 19;