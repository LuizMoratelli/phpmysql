<?php
include("cabecalho.php");
include("conecta.php");
include("banco-produto.php");

$id = $_POST['id'];
removeProduto($conexao, $id);
header("Location: produto-lista.php?removido=true");
die();//para a execução do PHP para garantir

?>

<?php include("rodape.php"); ?>
