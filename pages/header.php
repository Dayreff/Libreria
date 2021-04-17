<?php 

include_once("../php/conexion.php");
header('Content-Type: text/html; charset=UTF-8');

$con = conection();

@session_start();

$user = @$_SESSION['username'];

?>

<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8" />
    <meta charset="ISO-8859-1">
    <title><?= isset($PageTitle) ? $PageTitle : "Livres de pierre"?></title>
    <link rel="stylesheet" href="../css/bootstrap.min.css"/>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="../css/main.css"/>
</head>
<body>

<nav class="navbar navbar-expand-md navbar-dark fixed-top bg-dark">
  <a class="navbar-brand" href="index.php">Livres de pierre</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarCollapse" aria-controls="navbarCollapse" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>
  <!-- opciones de navegacion -->
  <div class="collapse navbar-collapse" id="navbarCollapse">
    <ul class="navbar-nav mr-auto">
      <li class="nav-item">
        <a class="nav-link" href="index.php">Inicio</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="catalogo.php">Catalogo</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="carrito.php">Carrito</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="comprar.php">Comprar</a>
      </li>

      <!-- INICIA EL CODIGO PHP -->
      <?php
        if(($user)) {
      ?>
      <li class="nav-item">
        <a class="nav-link"  href="user.php"><?= $user ?></a>
      </li>
      <li class="nav-item">
        <a class="nav-link"  href="../php/logout.php">Cerrar sesion</a>
      </li>
      <?php
        } else {
      ?>
      <li class="nav-item">
        <a class="nav-link"  href="#login" data-toggle="modal">Iniciar sesion</a>
      </li>
      <li class="nav-item">
        <a class="nav-link"  href="#signin" data-toggle="modal">Registrarse</a>
      </li>
      <?php
        }
      ?>
      <!-- TERMINA EL CODIGO PHP -->

    </ul>
  </div>
</nav>

<br><br><br>


<div class="row p-2">
    <div class="col-7">
        <ul class="nav nav-pills nav-fill">
            <li class="nav-item">
                <a class="nav-link" href="search?title=terror">terror</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="search?title=Drama">Drama</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="search?title=romance">Romance</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="search?title=">Todo</a>
            </li>
        </ul>
    </div>
    <div class="col-5 d-flex justify-content-end">
    <form class="form-inline" action="search.php" method="GET">
        <input class="form-control input-left" type="search" name="title" placeholder="Buscar libro" aria-label="Search">
        <button class="btn btn-primary submit-right" type="submit">
            <i class="fa fa-search text-white" aria-hidden="true"></i>
        </button>
    </form>
    </div>
</div>



<!-- INCIA CODIGO PHP -->
<?php

  if(isset($_SESSION['err']) != "" && $_SESSION['err'] != "" && $_SESSION['err'] != "login" && $_SESSION['err'] != "register") {
?>
    <div class="alert alert-danger alert-dismissible fade show ml-5 mr-5 mt-3" role="alert">
      <?= $_SESSION['err'] ?>
      <button type="button" class="close" data-dismiss="alert" aria-label="Close">
        <span aria-hidden="true">&times;</span>
      </button>
    </div>
<?php
    session_destroy();
  } else if(isset($_SESSION['err']) != "" && $_SESSION['err'] == "register") {
?>
    <div class="alert alert-success alert-dismissible fade show ml-5 mr-5 mt-3" role="alert">
      Registro exitoso
      <button type="button" class="close" data-dismiss="alert" aria-label="Close">
        <span aria-hidden="true">&times;</span>
      </button>
    </div>
<?php
    session_destroy();
  } else if(isset($_SESSION['err']) != "" && $_SESSION['err'] == "login") {
?>
    <div class="alert alert-success alert-dismissible fade show ml-5 mr-5 mt-3" role="alert">
      Login exitoso <strong><?= $_SESSION['username'] ?></strong>
      <button type="button" class="close" data-dismiss="alert" aria-label="Close">
        <span aria-hidden="true">&times;</span>
      </button>
    </div>
<?php
  $_SESSION['err'] = "";
  }
?>
<!-- TERMINA CODIGO PHP -->




<!-- modal fade -->
<div class="modal fade" id="login" tabindex="-1" role="dialog" aria-labelledby="login" aria-hidden="true">
  <div class="modal-dialog modal-sm modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-header text-center">
        <h4 class="modal-title w-100 font-weight-bold">Inicia Sesion</h4>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      
        <form action="../php/login.php" method="GET">
            <div class="modal-body mx-3">
                <div class="form-group row">
                  <input type="email" class="form-control input" id="#" name="correo" placeholder="Email" required>
                </div>
                <div class="form-group row">
                    <input type="password" class="form-control input" id="#" name="pass" placeholder="Contraseña" required>
                </div>
            </div>

            <div class="modal-footer d-flex justify-content-center">
                <button type="submit" class="btn btn-primary mb-2">Iniciar sesion</button>
            </div>
        </form>
    </div>
  </div>
</div>


<!-- modal fade -->
<div class="modal fade" id="signin" tabindex="-1" role="dialog" aria-labelledby="signin" aria-hidden="true">
  <div class="modal-dialog modal-sm modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-header text-center">
        <h4 class="modal-title w-100 font-weight-bold">Registro</h4>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      
        <form action="../php/register.php" method="GET">
            <div class="modal-body mx-3">
                <div class="form-group row">
                  <input type="text" class="form-control input" name="name" placeholder="Nombre" required>
                </div>
                <div class="form-group row">
                    <input type="email" class="form-control input" name="correo" placeholder="Email" required>
                </div>
                <div class="form-group row">
                    <input type="password" class="form-control input" name="pass" placeholder="Contraseña" required>
                </div>
                <div class="form-group row">
                  <input type="text" class="form-control input" name="tel" placeholder="Telefono">
                </div>
            </div>

            <div class="modal-footer d-flex justify-content-center">
              <button type="submit" class="btn btn-primary mb-2">Registrarse</button>
            </div>
        </form>
    </div>
  </div>
</div>
