-- 4 Nom des spécialités avec nombre de personnages par spécialité (trié par nombre de personnages décroissant)

SELECT s.nom_specialite, COUNT(p.id_specialite) AS nbPersoSpecialite
FROM personnage p
INNER JOIN specialite s ON p.id_specialite = s.id_specialite
GROUP BY s.id_specialite
ORDER BY nbPersoSpecialite DESC 