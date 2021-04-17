<?php

include_once("conexion.php");
$con = conection();
session_start();

$correo = $_GET["correo"];
$pass   = $_GET["pass"];

$q     = "SELECT * FROM usuario WHERE correo = '".$correo."' and clave = '".$pass."'";
$query = mysqli_query($con, $q);
$nr    = mysqli_num_rows($query);

if($nr) {
    while($cons = mysqli_fetch_array($query)) {
        $_SESSION['id'] = $cons['id'];
        $_SESSION['tipo'] = $cons['tipo'];
        $_SESSION['correo'] = $cons['correo'];
        $_SESSION['telefono'] = $cons['telefono'];
        $_SESSION['username'] = $cons['nombre'];
    }
    $_SESSION['err'] = "login";
} else {
    $_SESSION['err'] = "<strong>Error</strong>, usuario o contraseña no validos";
}

header('Location: ../pages/index.php');

?>