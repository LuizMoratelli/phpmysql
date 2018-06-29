<?php
include("cabecalho.php");
include("conecta.php");
include("banco-produto.php");

    $nome = $_POST['nome'];//GET é para buscar dados, POST é para enviar dados.
    $preco = $_POST['preco'];
    $descricao = $_POST['descricao'];
    $categoria_id = $_POST['categoria_id'];

    if (array_key_exists('usado', $_POST)) {//se o checkbox não foi selecionado ele não será enviado
        $usado = "true";//entre aspas pois na concatenação na parte de inserção o valor false sem aspas é como se fosse uma string vazia
    } else {
        $usado = "false";
    }

    if(insereProduto($conexao, $nome, $preco, $descricao, $categoria_id, $usado)) { //execução com sucesso
?>
        <p class="text-success">Produto <?= $nome ?>, <?= $preco?> adicionado com sucesso!</p>
<?php
    } else {
        $msg = mysqli_error($conexao);
?>
        <p class="text-danger">O produto <?= $nome ?> não foi adicionado! <?= $msg ?></p>
<?php
    }
    mysqli_close($conexao);//fecha conexao
?>

<?php include("rodape.php"); ?>
