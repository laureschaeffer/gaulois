-- 13 Nom du / des lieu(x) possédant le plus d'habitants, en dehors du village gaulois.


SELECT COUNT(p.id_lieu) AS nbHabitant, l.nom_lieu
FROM personnage p 
INNER JOIN lieu l ON p.id_lieu = l.id_lieu
WHERE p.id_lieu = (
    SELECT id_lieu
    FROM (
        SELECT id_lieu, COUNT(*) AS nbHabitant
        FROM personnage
        ORDER BY nbHabitant DESC -- renvoie la liste par ordre décroissant et ne choisit que la première ligne
        LIMIT 1 
    ) AS countHab
)
AND l.nom_lieu!='Village gaulois'
GROUP BY p.id_lieu
