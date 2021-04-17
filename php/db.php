<?php

function table($con, $table) {
    $q     = "SELECT * FROM $table";
    $query = mysqli_query($con, $q);
    $nr    = mysqli_num_rows($query);
    $book = [];
    if($nr) {
        return $query;
        //while($cons = mysqli_fetch_array($query)) { }
    }
    return null;
}

?>