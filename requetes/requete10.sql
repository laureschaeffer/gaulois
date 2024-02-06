-- 10 Nom de la bataille où le nombre de casques pris a été le plus important

SELECT b.id_bataille, b.nom_bataille, MAX(totalCasque) AS maxCasque
FROM (
    SELECT id_bataille, SUM(qte) AS totalCasque
    FROM prendre_casque
    GROUP BY id_bataille
) AS pc
INNER JOIN bataille b ON pc.id_bataille = b.id_bataille
WHERE totalCasque = (
    SELECT MAX(totalCasque)
    FROM (
        SELECT SUM(qte) AS totalCasque
        FROM prendre_casque
        GROUP BY id_bataille
    ) AS maxCasque
)
GROUP BY b.id_bataille;