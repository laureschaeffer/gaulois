-- D. Modifiez l'adresse de Zérozérosix : il a été mis en prison à Condate

-- afficher les infos
SELECT *
FROM personnage p
INNER JOIN lieu l ON p.id_lieu = l.id_lieu
WHERE nom_personnage = 'Zérozérosix';

-- changer les valeurs
UPDATE personnage
SET adresse_personnage ='prison', id_lieu=9
WHERE nom_personnage = 'Zérozérosix';