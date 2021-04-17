<?php


function book($id) {
    include_once("conexion.php");
    $con = conection();

    $book = dataBook($id, $con);
    $book["autor"] = dataAutor($book["id_autor"], $con);
    $book["editorial"] = dataEditorial($book["id_editorial"], $con);
    $gen1 = dataGeneros($book["id_genero_1"], $con);
    $gen2 = dataGeneros($book["id_genero_2"], $con);

    $book["generos"] = substr($gen1,1).$gen2;

    return $book;
}

function dataBook($id, $con) {
    $q     = "SELECT * FROM libros WHERE id = '".$id."'";
    $query = mysqli_query($con, $q);
    $nr    = mysqli_num_rows($query);
    $book = "";
    if($nr) {
        while($cons = mysqli_fetch_array($query)) { $book = $cons; }
    }
    return $book;
}


function dataAutor($id, $con) {
    $q     = "SELECT * FROM autor WHERE id = '".$id."'";
    $query = mysqli_query($con, $q);
    $nr    = mysqli_num_rows($query);
    $autor = "";
    if($nr) {
        while($cons = mysqli_fetch_array($query)) { $autor = $cons["nombre"]; }
    }

    return $autor;
}

function dataEditorial($id, $con) {
    $q     = "SELECT * FROM editorial WHERE id = '".$id."'";
    $query = mysqli_query($con, $q);
    $nr    = mysqli_num_rows($query);
    $editorial = "";
    if($nr) {
        while($cons = mysqli_fetch_array($query)) { $editorial = $cons["nombre"]; }
    }

    return $editorial;
}

function dataGeneros($id, $con) {
    $q     = "SELECT * FROM genero WHERE id = '".$id."'";
    $query = mysqli_query($con, $q);
    $nr    = mysqli_num_rows($query);
    $gen = "";
    if($nr) {
        while($cons = mysqli_fetch_array($query)) { $gen = $cons["nombre"]; }
    }
    if($id != 0) {
        return ',<a href="search?title='.$gen.'">'.$gen.'</a>';
    }
    return "";
    
}



function stock($id, $con) {
    $q     = "SELECT * FROM stock WHERE id = '".$id."'";
    $query = mysqli_query($con, $q);
    $nr    = mysqli_num_rows($query);
    $id_book = "";
    if($nr) {
        while($cons = mysqli_fetch_array($query)) { $id_book = $cons["id_libro"]; }
    }
    if($id != 0) {
        return $id_book;
    }
    return "";
}


?>