<?php

include_once("conexion.php");
$con = conection();

$id_book = $_GET["id_book"];
$id_user = $_GET["id_user"];
$cantidad = $_GET["cantidad"];


$q     = "SELECT * FROM stock WHERE id_libro = '".$id_book."'";
$query = mysqli_query($con, $q);
$nr    = mysqli_num_rows($query);

if($nr >= $cantidad) {
    foreach($query as $a) {
        $d = $a["id"];
        $insert = "INSERT INTO carrito(id_stock, id_usuario)
                VALUES ('$d','$id_user')";
    }
    
    $query2 = mysqli_query($con, $insert);
    if(!$query2) {
        echo "<strong>Error</strong>, el elemento ya no existe";
    } else {
        echo "register";
    }
} else {
    echo "<strong>Error</strong>, el limite se supero";
}

header('Location: ../pages/book.php?id='.$id_book);
?>