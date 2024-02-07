-- 3 Nom des personnages + adresse, spécialité, et lieu d'habitation, triés par lieu puis par nom de personnage

SELECT p.nom_personnage, p.adresse_personnage, l.nom_lieu, s.nom_specialite
FROM personnage p
INNER JOIN lieu l ON p.id_lieu = l.id_lieu
INNER JOIN specialite s ON p.id_specialite = s.id_specialite
ORDER BY l.nom_lieu, p.nom_personnage;