<!-- ------------------------------------------  Fichier de temporisation de sortie ----------------------------- -->

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="style.css">
    <title><?= $title?></title>
</head>
<body>
    <nav>
        <a href="liste_personnage.php">Liste des personnages</a>
        <a href="liste_potion.php">Liste des potions</a>
    </nav>

    <div id="wrapper">
        <?= $content //ici le contenu propre a chaque page ?>
    </div>
</body>
</html>