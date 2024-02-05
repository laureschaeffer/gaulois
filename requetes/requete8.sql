-- 8 Nom du ou des personnages qui ont pris le plus de casques dans la bataille 'Bataille du village gaulois'

SELECT p.nom_personnage, MAX(totalCasque) AS max_totalCasque
FROM (
    SELECT id_personnage, SUM(qte) AS totalCasque
    FROM prendre_casque
    WHERE id_bataille=1
    GROUP BY id_personnage
) AS pc
INNER JOIN personnage p ON pc.id_personnage = p.id_personnage
WHERE totalCasque = (
    SELECT MAX(totalCasque)
    FROM (
        SELECT SUM(qte) AS totalCasque
        FROM prendre_casque
        WHERE id_bataille=1
        GROUP BY id_personnage
    ) AS subquery_inner
)
GROUP BY pc.id_personnage;