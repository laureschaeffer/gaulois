-- 9 Nom des personnages et leur quantité de potion bue (en les classant du plus grand buveur au plus petit)

SELECT b.id_personnage, SUM(dose_boire) AS qtePotion, p.nom_personnage
FROM boire b
INNER JOIN personnage p ON b.id_potion = p.id_personnage
GROUP BY b.id_personnage, p.nom_personnage 
ORDER BY qtePotion DESC 