<?php

session_start(); // démarre session d'appli
require_once "bdd-connect.php"; // fichier qui récupère les infos en bdd
ob_start(); //temporisation de sortie



// --------------------------deuxieme requete pour avoir toutes les infos-----------------

if (isset($_GET['action'])) { //si l'utilisateur fait une action


    $sqlQuery2= "SELECT p.nom_personnage, p.adresse_personnage, l.nom_lieu, s.nom_specialite
    FROM personnage p
    LEFT JOIN specialite s ON p.id_specialite = s.id_specialite
    LEFT JOIN lieu l ON p.id_lieu = l.id_lieu
    WHERE id_personnage =".$_GET['id'].";";
    $gauloisStatement2 = $mysqlClient->prepare($sqlQuery2);
    $gauloisStatement2->execute();
    $personnages = $gauloisStatement2->fetchAll();

    ?>
    <h2> <?=$personnages[0]['nom_personnage']?> </h2>
        <div class='perso'>
            <p>Fonction : <?=$personnages[0]['nom_specialite'] ?> </p>
            <p> Habite <?=$personnages[0]['adresse_personnage']?> </p>
            <p> <?=$personnages[0]['nom_lieu'] ?></p>
        </div>


<?php

}



// temporisation de sortie
$title = "Détail du personnage";
$content= ob_get_clean();
require_once "template.php"; 
?>
