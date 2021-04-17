<?php

session_start();

if(!isset($_SESSION['id'])) {
    header('Location: index.php');
    die();
}

if($_SESSION['tipo'] == 1) {
    header('Location: user.php');
    die();
}

include_once('header.php');




include_once("../php/db.php");

/*
while($book = mysqli_fetch_array($books)) {
    echo $book['titulo'].'<br>';
}*/

?>
<!-- Comienza el contenido de la pagina -->



<div class="card m-5">
    <div class="card-header"> 
        <ul class="nav nav-tabs card-header-tabs"  id="myTab" role="tablist">
            <li class="nav-item">
                <a class="nav-link active" id="home-tab" data-toggle="tab" href="#home" role="tab" aria-controls="home" aria-selected="true">Perfil</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" id="profile-tab" data-toggle="tab" href="#profile" role="tab" aria-controls="profile" aria-selected="false">Libros</a>
            </li>
        </ul>
    </div>

    <div class="card-body">
        <div class="tab-content" id="myTabContent">
            <div class="tab-pane fade show active" id="home" role="tabpanel" aria-labelledby="home-tab"><?php include_once('admin/perfil.php');?></div>
            <div class="tab-pane fade" id="profile" role="tabpanel" aria-labelledby="profile-tab"><?php include_once('admin/book.php');?></div>
        </div>
    </div>
</div>

<!-- Termina el contenido de la pagina -->
<?php

include_once('footer.php');

?>