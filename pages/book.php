<?php

$PageTitle="Catalogo";

$id = isset($_GET["id"]) == "" ? 0: $_GET["id"];

include_once('header.php');

include_once("../php/getBook.php");
include_once("../php/listBooks.php");

$book = book($id);

?>
<!-- Comienza el contenido de la pagina -->
<br>

<div class="one-book m-3">
<div class="row m-3 p-2">
  <div class="col-lg-3"></div>

  <div class="col-3 col-lg-3 mt-3 ml-0">
    <img src="<?= $book["imagen"] ?>" alt="">
  </div>
  
  <div class="col-5 col-lg-3 mt-5 text-uppercase">
    <p class="m-1">Titulo: <?= $book["titulo"] ?></p>
    <p class="m-1">Autor: <a href="search.php?title=<?= $book["autor"]?>"><?= $book["autor"] ?></a></p>
    <p class="m-1">Editorial: <a href="search.php?title=<?= $book["editorial"] ?>"><?= $book["editorial"]?></a></p>
    <p class="m-1">Genero(s): <?= $book["generos"] ?></p>
  </div>
  
  <div class="col-4 col-lg-3 to-cart p-3">
  <form action="../php/cart.php">
  <p class="text-success m-1 mb-3">Disponible.</p>
    <select class="browser-default custom-select" name="cantidad">
      <option value="1">1</option>
      <option value="2">2</option>
      <option value="3">3</option>
      <option value="2">4</option>
      <option value="3">5</option>
    </select>
    
    <p class="price">precio: $<?=$book["precio"]?></p>

    
    <input type="hidden" value="<?=$book["id"]?>" name="id_book">
    <input type="hidden" value="<?=$_SESSION['id']?>" name="id_user">
    <button type="submit" class="btn btn-warning mb-2">
    Agregar al carrito
    <i class="fa fa-shopping-cart" aria-hidden="true"></i>
    </button>

    </form>
    <p class="text-success m-0">Envio inmediato.</p>
    
    <p class="m-0">Recibelo de 3 a 7 dias habiles</p>
    <p class="text-info m-0">Envio gratis en compras mayores a $1275</p>
  </div>
</div>

<div class="m-3 descripcion">
  <div>
    <p>descripcion:</p>
  </div>
  <div>
    <p><?=utf8_encode($book["descripcion"])?></p>
  </div>
</div>

</div>


<!-- REGRESA LOS LIBROS RELACIONADOS -->
<?=  getListBooks( $book["titulo"], $book['id'], "Libros relacionados") ?>

<br>


<!-- Termina el contenido de la pagina -->
<?php

include_once('footer.php');

?>