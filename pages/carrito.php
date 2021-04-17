<?php

$PageTitle="Tus compras";

include_once('header.php');

include_once("../php/db.php");

include_once("../php/getBook.php");


$stock = table($con, "carrito");


?>
<!-- Comienza el contenido de la pagina -->




<div class="m-5">
    <div class="col-md-7 mb-4">
      <h4 class="d-flex justify-content-between align-items-center mb-3">
        <span class="text-muted">Tus articulos</span>
        <?php $c=0; foreach($stock as $item): ?>
        <?php if($item["id_usuario"] == $_SESSION['id']): ?>
        <?php $c++;?>
        <?php endif; ?>
        <?php endforeach; ?>
        <span class="badge badge-secondary badge-pill"><?=$c?></span>
      </h4>
      <ul class="list-group mb-3">
        <?php foreach($stock as $item): ?>
        <?php if($item["id_usuario"] == $_SESSION['id']): ?>
        <?php $book = book(stock($item["id_stock"], $con)); ?>
        <li class="list-group-item d-flex justify-content-between lh-condensed">
          <div class="row">
            <div class="mr-2">
                <button class="btn" href="#remove<?=$item['id']?>" data-toggle="modal">
                    <i class="fa fa-times-circle fa-2x text-danger" aria-hidden="true"></i>
                </button>
            </div>
            <div>
                <h6 class="my-0"><?=$book["titulo"]?></h6>
                <small class="text-muted"><?=$book["autor"]?></small>
            </div>
          </div>
          <span class="text-muted">$180</span>
        </li>
        <?php endif; ?>
        <?php endforeach; ?>
      </ul>
    </div>
    <div class="">
      <a href="comprar.php" class="btn btn-warning ml-3" role="button">
          Comprar ahora
          <i class="fa fa-credit-card" aria-hidden="true"></i>
      </a>
    </div>
</div>


<?php foreach($stock as $item): ?>
<?php if($item["id_usuario"] == $_SESSION['id']): ?>
<?php $book = book(stock($item["id_stock"], $con)); ?>

<!-- modal fade -->
<div class="modal fade" id="remove<?=$item['id']?>" tabindex="-1" role="dialog" aria-labelledby="login" aria-hidden="true">
  <div class="modal-dialog modal-sm modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-header text-center">
        <h5 class="modal-title w-100 font-weight-bold">Estas seguro</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
  
        <div class="modal-footer d-flex justify-content-center">
          <a class=" btn btn-outline-danger mb-2"  class="close" data-dismiss="modal" aria-label="Close">No</a>
          <a href="../php/remove.php?id=<?=$item['id']?>" class="btn btn-outline-primary mb-2">Si</a>
        </div>
    </div>
  </div>
</div>


<?php endif; ?>
<?php endforeach; ?>

















  <!-- Termina el contenido de la pagina -->




<?php

include_once('footer.php');

?>