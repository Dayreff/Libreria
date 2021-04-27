<?php

$PageTitle="Comprar";

include_once('header.php');

include_once("../php/db.php");

include_once("../php/getBook.php");


$stock = table($con, "carrito");
?>
<!-- Comienza el contenido de la pagina -->




<div class="row m-5">
    <div class="col-md-4 order-md-2 mb-4">
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

    <div class="col-md-8 order-md-1">
      <h4 class="mb-3">Envio</h4>
      <form class="needs-validation" novalidate>
        <div class="mb-3">
          <label for="address">Direccion</label>
          <input type="text" class="form-control" id="address" placeholder="1234 Guadalajara" required>
          <div class="invalid-feedback">
            Please enter your shipping address.
          </div>
        </div>

        <div class="mb-3">
          <label for="address2">Direccion 2 <span class="text-muted">(Optional)</span></label>
          <input type="text" class="form-control" id="address2" placeholder="Apartmento 512">
        </div>

        <div class="row">
          <div class="col-md-4 mb-3">
            <label for="state">Ciudad</label>
            <select class="custom-select d-block w-100" id="state" required>
              <option value="">Choose...</option>
              <option>Guadalajara</option>
            </select>
            <div class="invalid-feedback">
              Please provide a valid state.
            </div>
          </div>
          <div class="col-md-3 mb-3">
            <label for="zip">cp</label>
            <input type="text" class="form-control" id="zip" placeholder="" required>
            <div class="invalid-feedback">
              Zip code required.
            </div>
          </div>
        </div>
        <hr class="mb-4">

        <h4 class="mb-3">Forma de pago</h4>

        <div class="d-block my-3">
          <div class="custom-control custom-radio">
            <input id="credit" name="paymentMethod" type="radio" class="custom-control-input" checked required>
            <label class="custom-control-label" for="credit">Tarjeta de credito</label>
          </div>
          <div class="custom-control custom-radio">
            <input id="debit" name="paymentMethod" type="radio" class="custom-control-input" required>
            <label class="custom-control-label" for="debit">Tarjeta de debito</label>
          </div>
        </div>
        <div class="row">
          <div class="col-md-6 mb-3">
            <label for="cc-name">Nombre de la tarjeta</label>
            <input type="text" class="form-control" id="cc-name" placeholder="" required>
            <small class="text-muted">Full name as displayed on card</small>
            <div class="invalid-feedback">
              Name on card is required
            </div>
          </div>
          <div class="col-md-6 mb-3">
            <label for="cc-number">Numero de la tarjeta</label>
            <input type="text" class="form-control" id="cc-number" placeholder="" required>
            <div class="invalid-feedback">
              Credit card number is required
            </div>
          </div>
        </div>
        <div class="row">
          <div class="col-md-3 mb-3">
            <label for="cc-expiration">Expiracion</label>
            <input type="text" class="form-control" id="cc-expiration" placeholder="" required>
            <div class="invalid-feedback">
              Expiration date required
            </div>
          </div>
          <div class="col-md-3 mb-3">
            <label for="cc-cvv">CVV</label>
            <input type="text" class="form-control" id="cc-cvv" placeholder="" required>
            <div class="invalid-feedback">
              Security code required
            </div>
          </div>
        </div>
        <hr class="mb-4">
        <button class="btn btn-primary btn-lg btn-block" type="submit">Realizar compra</button>
      </form>
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