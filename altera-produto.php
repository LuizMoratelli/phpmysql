<?php
include("cabecalho.php");
include("conecta.php");
include("banco-produto.php");

    $id = $_POST['id'];
    $nome = $_POST['nome'];//GET é para buscar dados, POST é para enviar dados.
    $preco = $_POST['preco'];
    $descricao = $_POST['descricao'];
    $categoria_id = $_POST['categoria_id'];

    if (array_key_exists('usado', $_POST)) {//se o checkbox não foi selecionado ele não será enviado
        $usado = "true";//entre aspas pois na concatenação na parte de inserção o valor false sem aspas é como se fosse uma string vazia
    } else {
        $usado = "false";
    }

    if(alteraProduto($conexao, $nome, $preco, $descricao, $categoria_id, $usado, $id)) { //execução com sucesso
?>
        <p class="text-success">Produto <?= $nome ?>, <?= $preco?> alterado com sucesso!</p>
<?php
    } else {
        $msg = mysqli_error($conexao);
?>
        <p class="text-danger">O produto <?= $nome ?> não foi alterado! <?= $msg ?></p>
<?php
    }
    mysqli_close($conexao);//fecha conexao
?>

<?php include("rodape.php"); ?>
