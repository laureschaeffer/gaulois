-- 13 Nom du / des lieu(x) possédant le plus d'habitants, en dehors du village gaulois.


select COUNT(id_lieu) AS nbHabitant, id_lieu
FROM personnage
WHERE id_lieu !=1
GROUP BY id_lieu 
order by nbHabitant DESC 
LIMIT 1;
--renvoie seulement la première ligne


-- alternative qui prend en compte les égalités
SELECT MAX(nbHabitant)
FROM (
    SELECT COUNT(id_lieu) AS nbHabitant, id_lieu
    FROM personnage 
    WHERE id_lieu != 1
    GROUP BY id_lieu
) AS findHab;

-- affiche le nom du lieu

SELECT l.nom_lieu, MAX(nbHabitant) as maxHabitant
FROM (
    SELECT COUNT(id_lieu) as nbHabitant, id_lieu
    FROM personnage
    WHERE id_lieu != 1
    GROUP BY id_lieu
) as perso
INNER JOIN lieu l ON perso.id_lieu = l.id_lieu
WHERE nbHabitant = (
    SELECT MAX(nbHabitant)
    FROM (
        SELECT COUNT(id_lieu) as nbHabitant, id_lieu
        FROM personnage
        WHERE id_lieu != 1
        GROUP BY id_lieu
    ) as findHab
)
GROUP BY l.nom_lieu;
