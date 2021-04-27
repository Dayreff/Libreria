<?php

$PageTitle="Librerio";

include_once('header.php');

?>
<!-- Comienza el contenido de la pagina -->


<div class=" text-center m-4">
    <h2>Lo mas vendido</h2>
</div>


<div class="ml-5 mr-5 pl-5 pr-5">

<div id="caros" class="carousel slide ml-5 mr-5 pl-5 pr-5 bg-dark" data-ride="carousel">
  <ol class="carousel-indicators">
    <li data-target="#caros" data-slide-to="0" class="active"></li>

<?php
$q     = "SELECT * FROM libros";
$query = mysqli_query($con, $q);
$nr    = mysqli_num_rows($query);

if($nr) {
    $count = 1;
    while($cons = mysqli_fetch_array($query)) {
        echo '<li data-target="#caros" data-slide-to="'.$count++.'"></li>';
    }
    echo '</ol>';
    echo '<div class="carousel-inner pl-5 pr-5">';

    echo '<div class="carousel-item active">';
    echo    '<img src="../media/libros/kthulhu.jpg" class="d-block w-100" alt="">';
    echo '</div>';
    
    $query = mysqli_query($con, $q);
    while($cons = mysqli_fetch_array($query)) {
      echo '<div class="carousel-item">';
      echo    '<img src="'.$cons["imagen"].'" class="d-block w-100" alt="">';
      echo '</div>';
    }
    echo '</div>';
}
?>

  <a class="carousel-control-prev" href="#caros" role="button" data-slide="prev">
    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
    <span class="sr-only">Previous</span>
  </a>
  <a class="carousel-control-next" href="#caros" role="button" data-slide="next">
    <span class="carousel-control-next-icon" aria-hidden="true"></span>
    <span class="sr-only">Next</span>
  </a>
</div>

</div>


<!-- CONTENIDO -->
<div class="bg-white ml-5 mr-5 pl-4 pr-4">
  <div class="p-5 text-center">
    <!-- TARJETA DE DESCRIPCION -->
    <div class="card text-white bg-primary m-4">
      <div class="card-header p-2"><h5 class="card-title">¿Quienes somos?</h5></div>
      <div class="card-body p-3 pb-1">
        <p class="card-text text-justify">
          Somos una pagina diseñada por un programador con pocas horas de sueño... si lee esto profe... no me repruebe porfa :(
        </p>
      </div>
    </div>
  </div>
</div>


<!-- Termina el contenido de la pagina -->
<?php

include_once('footer.php');

?>