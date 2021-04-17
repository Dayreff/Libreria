<?php

$PageTitle="Catalogo";

include_once('header.php');

include_once("../php/listBooks.php");

?>
<!-- Comienza el contenido de la pagina -->

<!-- Tema a buscar, id rechazado(si es 0, no se rechaza), titulo -->
<?= getListBooks( "Terror", 0, "Terror"); ?>
<?= getListBooks( "Drama", 0, "Drama"); ?>
<?= getListBooks( "Historia", 0, "Historia"); ?>
<?= getListBooks( "Fabula", 0, "Fabula"); ?>
<?= getListBooks( "Misterio", 0, "Misterio"); ?>

<!-- Termina el contenido de la pagina -->
<?php

include_once('footer.php');

?>