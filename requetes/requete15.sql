-- 15 Nom du / des personnages qui n'ont pas le droit de boire de la potion 'Magique'

SELECT nom_personnage, id_personnage
FROM personnage
WHERE id_personnage NOT IN (
    SELECT id_personnage
    FROM autoriser_boire
    WHERE id_potion=1
);

