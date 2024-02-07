<?php

session_start(); // démarre session d'appli
require_once "bdd-connect.php"; // fichier qui récupère les infos en bdd
ob_start(); //temporisation de sortie

// ------------------------------REQUETE SQL POUR NOMS POTIONS --------------------------------------
$sqlQuery= "SELECT  p.nom_potion, COUNT(c.qte) AS nbIngredient, p.id_potion
FROM composer c
INNER JOIN potion p ON c.id_potion = p.id_potion
GROUP BY p.id_potion
ORDER BY p.nom_potion";
$potionStatement = $mysqlClient->prepare($sqlQuery);
$potionStatement->execute();



// ------------------------------------boucle pour afficher ces infos----------------------------------
?> 
<table class="table table-striped">
  <thead>
    <tr>
      <th scope="col">Potions</th>
      <th scope="col">Nombre d'ingrédients</th>
    </tr>
  </thead>
  <tbody>

    <?php
while($potion = $potionStatement->fetch(PDO::FETCH_ASSOC)){ ?>
        <tr>
            <td><a href="potion.php?action=afficherInfo&id=<?= $potion["id_potion"] ?>"><?= $potion['nom_potion'] ?></a></td>
            <td><?= $potion['nbIngredient']?> ingrédients </td>
        </tr>
<?php } 
?> 
    </tbody>
 </table>

<?php


// temporisation de sortie
$title = "Liste des potions";
$content= ob_get_clean();
require_once "template.php"; 
?>