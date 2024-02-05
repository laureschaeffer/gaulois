-- () Nom, date et lieu des batailles, classées de la plus récente à la plus ancienne

SELECT b.nom_bataille, l.nom_lieu, DATE_FORMAT(date_bataille, '%d/%m/%Y') AS date_bataille
FROM bataille b
INNER JOIN lieu l ON b.id_lieu = l.id_lieu
ORDER BY b.date_bataille DESC


-- date format: https://sql.sh/fonctions/date_format