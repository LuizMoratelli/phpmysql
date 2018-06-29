<?php 
include("cabecalho.php"); 
include("conecta.php");
include("banco-categoria.php");

$categorias = listaCategorias($conexao);
?>
    <h1>Formulário de Produto</h1>
    <form class="" action="adiciona-produto.php" method="post">
        <table class="table">
            <tr>
                <td><label for="nome">Nome</label></td>
                <td><input type="text" name="nome" class="form-control"></td>
            </tr>
            <tr>
                <td><label for="preco">Preço</label></td>
                <td><input type="number" name="preco" class="form-control"></td>
            </tr>
            <tr>
                <td><label for="descricao">Descrição</label></td>
                <td><textarea name="descricao" id="descricao" class="form-control"></textarea></td>
            </tr>
            <tr>
                <td><label for="categoria">Categoria</label></td>
                <td>
                    <select name="categoria_id" class="form-control">
                    <?php foreach ($categorias as $categoria): ?>
                        <option value="<?=$categoria['id']?>">
                            <?=$categoria['nome']?>
                        </option>
                    <?php endforeach ?>
                    </select>
                </td>
            </tr>
            <tr>
                <td>Usado</td>
                <td><input type="checkbox" name="usado" value="true"></td>
            </tr>
            <tr>
                <td><input type="submit" value="Cadastrar" class="btn btn-primary"></td>
            </tr>
        </table>
    </form>
<?php include("rodape.php"); ?>
