<?php 
function listaProdutos ($conexao) {
    $produtos = [];//nas versões antigas seria = array();
    
    $query = "SELECT pro.*, cat.nome AS categoria_nome
                FROM produtos AS pro
                JOIN categorias AS cat
                  ON pro.categoria = cat.id";

    $resultado = mysqli_query($conexao, $query);
    while ($produto = mysqli_fetch_assoc($resultado)) {
        array_push($produtos, $produto);//coloca $produto em produtos
    }
    return $produtos;
}

function insereProduto($conexao, $nome, $preco, $descricao, $categoria_id, $usado) {
    $query = "INSERT INTO produtos (nome, preco, descricao, categoria, usado) values ('{$nome}', {$preco}, '{$descricao}', '{$categoria_id}', {$usado})"; //comando SQL '' para quando é texto
    return mysqli_query($conexao, $query);//execução da query e retorno de sucessão ou não
}

function alteraProduto($conexao, $nome, $preco, $descricao, $categoria_id, $usado, $id) {
$query = "UPDATE produtos SET nome = '{$nome}', preco = {$preco}, descricao = '{$descricao}', categoria = '{$categoria_id}', usado = $usado WHERE id = {$id}"; //comando SQL '' para quando é texto
    return mysqli_query($conexao, $query);//execução da query e retorno de sucessão ou não
}

function removeProduto($conexao, $id) {
    $query = "DELETE FROM produtos WHERE id = {$id}";
    return mysqli_query($conexao, $query); 
}

function buscaProduto($id, $conexao) {
    $query = "SELECT *
                FROM produtos
               WHERE id = {$id}";
    $resultado = mysqli_query($conexao, $query);
    return mysqli_fetch_assoc($resultado);
}