<?php
session_start(); // démarre session d'appli
require_once "bdd-connect.php"; // fichier qui récupère les infos en bdd
ob_start(); //temporisation de sortie

// ------------------------------REQUETE SQL POUR NOMS PERSO --------------------------------------
$sqlQuery= "SELECT id_personnage, nom_personnage
FROM personnage ORDER BY nom_personnage;";
$gauloisStatement = $mysqlClient->prepare($sqlQuery);
$gauloisStatement->execute();
$index=1;

// ------------------------------------boucle pour afficher ces infos----------------------------------
?> 

<table class="table table-striped">
  <thead>
    <tr>
      <th scope="col">Index</th>
      <th scope="col">Personnages</th>
    </tr>
  </thead>
  <tbody>
    <?php
while($personnage = $gauloisStatement->fetch(PDO::FETCH_ASSOC)){ ?>
        <tr>
            <td><?= $index?> </td>
            <td><a href="personnage.php?action=afficherInfo&id=<?= $personnage["id_personnage"] ?>"><?= $personnage['nom_personnage'] ?></a></td>
        </tr>
    
<?php 
$index++ ;
 } ?>

 </table>
<?php


// temporisation de sortie
$title = "Liste des personnages";
$content= ob_get_clean();
require_once "template.php"; 
?>
