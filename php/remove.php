<?php

include_once("conexion.php");
$con = conection();

$id = $_GET["id"];


$q     = "DELETE FROM carrito WHERE id = '".$id."'";
$query = mysqli_query($con, $q);

header('Location: ../pages/carrito.php');

?>