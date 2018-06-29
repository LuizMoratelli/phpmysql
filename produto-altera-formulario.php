<?php 
include("cabecalho.php"); 
include("conecta.php");
include("banco-categoria.php");
include("banco-produto.php");

$id = $_GET['id'];
$produto = buscaProduto($id, $conexao);
$categorias = listaCategorias($conexao);
$usado = $produto['usado'] ? "checked='checked'" : "";
?>
    <h1>Alterando Produto</h1>
    <form class="" action="altera-produto.php" method="post">
        <table class="table">
            <input type="hidden" name="id" class="form-control" value="<?=$produto['id']?>">
            <tr>
                <td><label for="nome">Nome</label></td>
                <td><input type="text" name="nome" class="form-control" value="<?=$produto['nome']?>"></td>
            </tr>
            <tr>
                <td><label for="preco">Preço</label></td>
                <td><input type="number" name="preco" class="form-control" value="<?=$produto['preco']?>"></td>
            </tr>
            <tr>
                <td><label for="descricao">Descrição</label></td>
                <td><textarea name="descricao" id="descricao" class="form-control"><?=$produto['descricao']?></textarea></td>
            </tr>
            <tr>
                <td><label for="categoria">Categoria</label></td>
                <td>
                    <select name="categoria_id" class="form-control">
                    <?php foreach ($categorias as $categoria): 
                        $selecionado = $produto['categoria'] == $categoria['id'] ? "selected='selected'" : ""; ?>
                        <option value="<?=$categoria['id']?>" <?=$selecionado?>>
                            <?=$categoria['nome']?>
                        </option>
                    <?php endforeach ?>
                    </select>
                </td>
            </tr>
            <tr>
                <td>Usado</td>
                <td><input type="checkbox" name="usado" value="true" <?=$usado?>></td>
            </tr>
            <tr>
                <td><input type="submit" value="Alterar" class="btn btn-primary"></td>
            </tr>
        </table>
    </form>
<?php include("rodape.php"); ?>
