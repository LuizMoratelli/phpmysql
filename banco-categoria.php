<?php
function listaCategorias($conexao) {
    $categorias = array();
    $query = "SELECT *
                FROM categorias";
    $resultado = mysqli_query($conexao, $query);
    while ($categoria = mysqli_fetch_array($resultado)) { //Enquanto houver, para cada resultado traz uma linha associada sendo esta categoria
       array_push($categorias, $categoria);
    }
    return $categorias;
}