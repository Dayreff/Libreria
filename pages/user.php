<?php

session_start();

if(!isset($_SESSION['id'])) {
    header('Location: index.php');
    die();
}

if($_SESSION['tipo'] == 0) {
    header('Location: admin.php');
    die();
}

include_once('header.php');




?>
<!-- Comienza el contenido de la pagina -->
<br><br><br>
<div class="alert alert-danger text-center alert-dismissible fade show ml-5 mr-5 mt-3" role="alert">
    Pagina en construccion
</div>
<br><br><br>

<?= $_SESSION['tipo'] ?>

<!-- Termina el contenido de la pagina -->
<?php

include_once('footer.php');

?>