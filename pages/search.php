<?php

$PageTitle="Catalogo";

include_once('header.php');

$title = strlen($_GET["title"]) == 0  ? "todos los titulos" : $_GET["title"];

?>
<!-- Comienza el contenido de la pagina -->


<div class="text-center ml-3 pl-3">
  <h3 class="text-primary m-5 text-uppercase"><?= $title?></h3>
  <div class="row">

<?php

if($title ==  "todos los titulos") { $title = ""; }

$q     = "SELECT l.id, l.titulo, l.precio, l.imagen FROM libros l
        LEFT JOIN autor a ON l.id_autor = a.id
        LEFT JOIN editorial e ON l.id_editorial = e.id
        LEFT JOIN genero g1 ON l.id_genero_1  = g1.id
        LEFT JOIN genero g2 ON l.id_genero_2  = g2.id
        WHERE   titulo LIKE '%$title%' or
                a.nombre LIKE '%$title%' or
                e.nombre LIKE '%$title%' or
                g1.nombre LIKE '%$title%' or
                g2.nombre LIKE '%$title%'";
                
$query = mysqli_query($con, $q);
$nr    = mysqli_num_rows($query);

if($nr) {
    while($cons = mysqli_fetch_array($query)) {
        echo '<div class="book-card">';
        echo '  <div>';
        echo '      <img src="'.$cons["imagen"].'" alt="">';
        echo '  </div>';
        echo '  <h4 href="#" class="">'.$cons["titulo"].'</h4>';
        echo '  <p>$'.$cons["precio"].'</p>';
        echo '  <a href="book.php?id='.$cons["id"].'" class="btn btn-info" role="button">Ver más...</a>';
        echo '</div>';
    }
}
?>
  </div>
</div>


<!-- Termina el contenido de la pagina -->
<?php

include_once('footer.php');

?>