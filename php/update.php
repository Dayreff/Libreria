<?php

//header('Location: ../pages/user.php');



include_once("conexion.php");
$con = conection();
session_start();

$name = $_GET["nombre"]; //Recibiendo el input del nombre
$correo = $_GET["correo"];
$pass   = $_GET["clave"];
$telefono = $_GET["telefono"];
$id = $_GET["id"];

$q     = "SELECT * FROM usuario WHERE id = '".$id."'";
$query = mysqli_query($con, $q);
$nr    = mysqli_num_rows($query);

if($nr) {

    $update ="UPDATE usuario SET nombre = '$name', correo='$correo', clave='$pass', telefono='$telefono' WHERE id='$id'";

    if(mysqli_query($con,$update)) {
        $_SESSION['correo'] = $correo;
        $_SESSION['telefono'] = $telefono;
        $_SESSION['username'] = $name;
    }
}

header('Location: ../pages/user.php');

?>
