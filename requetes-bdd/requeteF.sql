-- F. Obélix s'est trompé : ce sont 42 casques Weisenau, et non Ostrogoths, qu'il a pris lors de la bataille 'Attaque de la banque postale'. Corrigez son erreur !

-- infos
SELECT *
FROM prendre_casque pc
INNER JOIN casque c ON pc.id_casque = c.id_casque
WHERE id_bataille=9

--update
UPDATE prendre_casque 
SET id_casque = 10, qte=42
WHERE id_bataille=9