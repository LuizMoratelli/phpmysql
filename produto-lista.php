<?php
include("cabecalho.php"); 
include("conecta.php");
include("banco-produto.php");

if (array_key_exists('removido', $_GET) && $_GET['removido'] == "true") {//se existe determinada chave na array
?>
    <p class="alert-success">Produto apagado com sucesso.</p>
<?php
}
?>
<table class="table table-striped table-bordered">
    <th>Nome</th>
    <th>Preço</th>
    <th>Descrição</th>
    <th>Categoria</th>
    <th>Usado?</th>
    <th>Ações</th>
    <?php
        $produtos = listaProdutos($conexao);
        foreach ($produtos as $produto):
    ?>
        <tr>
            <td><?= $produto['nome']?></td>
            <td><?= $produto['preco']?></td>
            <td><?= substr($produto['descricao'], 0, 40)//exibe apenas um intervalo de caracteres?></td>
            <td><?= $produto['categoria_nome']?></td>
            <td><?= $produto['usado'] ? "Sim" : "Não"; ?></td>
            <td>
                <a href="produto-altera-formulario.php?id=<?=$produto['id']?>" class="btn btn-warning">alterar</a>
                <form action="remove-produto.php" method="post">
                    <input type="hidden" name="id" id="id" value="<?=$produto['id']?>">
                    <button class="btn btn-danger">remover</button>
                </form>
            </td>
        </tr>
    <?php
        endforeach //no lugar de usar as {}
    ?>
</table>
<?php
include("rodape.php"); ?>
