<?php 

function conection() {
    $user = "root";
    $pass = "";
    $server = "localhost";
    $db   = "libreria";
    $con  = mysqli_connect($server, $user, $pass, $db) or die ("error al conectar".mysql_error());
    
    return $con;
}

?>