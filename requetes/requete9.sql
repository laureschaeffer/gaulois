-- 9 Nom des personnages et leur quantité de potion bue (en les classant du plus grand buveur au plus petit)

SELECT SUM(dose_boire) AS qtePotion, p.nom_personnage
FROM boire b
INNER JOIN personnage p ON p.id_personnage = b.id_personnage
GROUP BY b.id_personnage
ORDER BY qtePotion DESC