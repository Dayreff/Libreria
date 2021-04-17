<?php 

function getListBooks($name, $id, $title) {
    include_once("conexion.php");
    $con = conection();

    if($id != 0) {
        //busca libros relaccionados a uno en especifico
        $q = query_one($id);
    } else {
        $q = query_gener($name, $id);
    }
    

    $query = mysqli_query($con, $q);
    $nr    = mysqli_num_rows($query);

    if($nr) {
        $count = 0;
        $list2 = '';
        while($cons = mysqli_fetch_array($query)) {
            $list2 .= '<a href="book.php?id='.$cons["id"].'">';
            $list2 .= '<img src="'.$cons["imagen"].'" alt="">';
            $list2 .= '</a>';
            $count++;
        }
    }
    $list = '<div class="text-center mt-5 m-3 pb-5">';
    $list .= '<h3>'.$title.' ('.$count.')</h3>';
    $list .= '<div class="border horizontal-scroll ml-3 mr-3" id="scrollbar">';
    $list .= $list2;
    $list .= '</div>';
    $list .= '</div>';
    
    return $list;
}


function query_one($id) {
    include_once("getBook.php");
    if($id != 0) {
        $book = book($id);
        $book_id_e =$book['id_editorial'];
        $book_id_a =$book['id_autor'];
        $book_id_g1 =$book['id_genero_1'];
        $book_id_g2 =$book['id_genero_2'];
    }
    
    
    $q     = "SELECT l.id, l.titulo, l.precio, l.imagen FROM libros AS l
            INNER JOIN autor ON l.id_autor = autor.id
            INNER JOIN editorial AS e ON l.id_editorial = e.id
            INNER JOIN genero g1 ON l.id_genero_1  = g1.id
            INNER JOIN genero g2 ON l.id_genero_2  = g2.id
            WHERE   l.id != '$id' and
                    (
                    autor.id = '$book_id_a' OR
                    e.id = '$book_id_e' OR
                    g1.id = '$book_id_g1' OR
                    g1.id = '$book_id_g2' OR
                    g2.id = '$book_id_g1' OR
                    g2.id = '$book_id_g2'
                    )";
    return $q;
}


function query_gener($name, $id) {
    include_once("conexion.php");
    $con = conection();
    
    $q     = "SELECT l.id, l.titulo, l.precio, l.imagen FROM libros l
            LEFT JOIN autor ON l.id_autor = autor.id
            LEFT JOIN editorial e ON l.id_editorial = e.id
            LEFT JOIN genero g1 ON l.id_genero_1  = g1.id
            LEFT JOIN genero g2 ON l.id_genero_2  = g2.id
            WHERE   l.id != $id and
                    titulo LIKE '%$name%' or
                    autor.nombre LIKE '%$name%' or
                    e.nombre LIKE '%$name%' or
                    g1.nombre LIKE '%$name%' or
                    g2.nombre LIKE '%$name%'";
    return $q;
}






?>
