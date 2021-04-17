<?php

include_once("conexion.php");
$con = conection();

$title = $_GET["title"];
$descr = $_GET["descripcion"];
$image = "../media/livre/".$_GET["image"];
$price = $_GET["price"];
$id_a = $_GET["id_a"];
$id_e = $_GET["id_e"];
$gen1 = $_GET["gen1"];
$gen2 = $_GET["gen2"];


$insert = "INSERT INTO libros(titulo, descripcion, imagen, precio, id_autor, id_editorial, id_genero_1, id_genero_2, id_genero_3)
            VALUES ('$title','$descr','$image', '$price', '$id_a','$id_e','$gen1', '$gen2', '$gen2')";

if(!mysqli_query($con, $insert)) {
    echo "<strong>Error</strong>, no se ha podido registrar, intentelo de nuevo<br>".mysqli_error($con);
} else {
    echo "register";
}

header('Location: ../pages/user.php');

?>