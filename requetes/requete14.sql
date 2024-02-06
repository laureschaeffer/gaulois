-- 14 Nom des personnages qui n'ont jamais bu aucune potion.

SELECT nom_personnage, id_personnage
FROM personnage
WHERE id_personnage NOT IN (
    SELECT id_personnage
    FROM boire
)