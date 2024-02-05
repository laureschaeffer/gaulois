-- 2 Nombre de personnages par lieu (trié par nombre de personnages décroissant)

SELECT id_lieu, COUNT(id_lieu) AS total_lieu
FROM personnage
GROUP BY id_lieu 
ORDER BY total_lieu DESC