-- 2 Nombre de personnages par lieu (trié par nombre de personnages décroissant)

SELECT nom_lieu, COUNT(personnage.id_lieu) AS total_lieu
FROM personnage
INNER JOIN lieu ON personnage.id_lieu = lieu.id_lieu
GROUP BY lieu.id_lieu 
ORDER BY total_lieu DESC