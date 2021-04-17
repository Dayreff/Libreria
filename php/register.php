<?php

include_once("conexion.php");
$con = conection();
session_start();

$name = $_GET["name"];
$correo = $_GET["correo"];
$pass   = $_GET["pass"];
$tel = $_GET["tel"];

$q     = "SELECT * FROM usuario WHERE correo = '".$correo."'";
$query = mysqli_query($con, $q);
$nr    = mysqli_num_rows($query);

if(!$nr) {
    $insert = "INSERT INTO usuario(tipo, nombre, correo, clave, telefono)
                VALUES ('1','$name','$correo','$pass', '$tel')";
    
    $query2 = mysqli_query($con, $insert);
    if(!$query2) {
        $_SESSION['err'] = "<strong>Error</strong>, no se ha podido registrar, intentelo de nuevo";
    } else {
        $_SESSION['err'] = "register";
    }
} else {
    $_SESSION['err'] = "<strong>Error</strong>, el correo electronico ya esta en uso";
}

header('Location: ../pages/index.php');

?>