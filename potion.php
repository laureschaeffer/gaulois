<?php

session_start(); // démarre session d'appli
require_once "bdd-connect.php"; // fichier qui récupère les infos en bdd
ob_start(); //temporisation de sortie



// --------------------------deuxieme requete pour avoir toutes les infos d'une potion-----------------

if (isset($_GET['action'])) { //si l'utilisateur fait une action

    // requete pour avoir nom potion et son prix
    $sqlQuery2= "SELECT  p.nom_potion, SUM(i.cout_ingredient * c.qte) AS prixPotion 
    FROM composer c
    INNER JOIN ingredient i ON c.id_ingredient = i.id_ingredient
    INNER JOIN potion p ON c.id_potion = p.id_potion
    WHERE p.id_potion =".$_GET['id']."
    GROUP BY c.id_potion, i.nom_ingredient;";
    $potionStatement2 = $mysqlClient->prepare($sqlQuery2);
    $potionStatement2->execute();
    $potions = $potionStatement2->fetchAll();
    ?>

    <h2> Potion <?=$potions[0]['nom_potion']?> </h2>
    <div class='potion'>
        <p>Prix total de la potion : <?=$potions[0]['prixPotion'] ?> </p>
        <p>Ingrédients nécessaires : </p>
        <ul>

<?php

    // requete pour avoir nombre d'ingrédients et tous les ingrédients
    $sqlQueryIngredient = "SELECT  i.nom_ingredient, c.id_potion
    FROM composer c
    INNER JOIN ingredient i ON c.id_ingredient = i.id_ingredient
    WHERE c.id_potion =".$_GET['id'].";";
    $ingredientStatement = $mysqlClient->prepare($sqlQueryIngredient);
    $ingredientStatement->execute();

    while ($row = $ingredientStatement->fetch(PDO::FETCH_ASSOC)) {
        ?>
            <li><?php echo $row['nom_ingredient']; ?></li>
    <?php }
?>
        </ul>
        </div>
        
<?php

}


// temporisation de sortie
$title = "Détail de la potion";
$content= ob_get_clean();
require_once "template.php"; 
?>
