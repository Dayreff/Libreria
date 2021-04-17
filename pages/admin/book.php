<?php
$books = table($con, "libros");
$autors = table($con, "autor");
$editorials = table($con, "editorial");
$gens = table($con, "genero");


?>


<div class="container mt-4">
    <div class="d-flex justify-content-end">
        <a href="#nuevo" class="btn btn-primary mb-2"  data-toggle="modal">Nuevo libro</a>
    </div>
  <div class="mt-3">
     <table class="table table-bordered" id="users-list">
       <thead>
          <tr>
             <th>Titulo</th>
             <th>ver</th>
          </tr>
       </thead>
       <tbody>
          <?php foreach($books as $book): ?>
          <tr>
             <td><?= utf8_encode($book['titulo']); ?></td>
             <td>
              <a href="#book<?=$book['id']?>" class="btn btn-success btn-sm"  data-toggle="modal">Ver</a>
              </td>
          </tr>
          <?php endforeach; ?>
       </tbody>
     </table>
  </div>
</div>
 
      

<div class="modal fade" id="nuevo" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
<form action="../php/newBook.php" method="GET">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header text-center">
                <h4 class="modal-title w-100 font-weight-bold">Nuevo libro</h4>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                <span aria-hidden="true">&times;</span>
                </button>
            </div>
        <div class="modal-body">
            <div class="form-group">
            <label for="id_alumno">Titulo</label>
            <input  type="text" id="title" name="title" class="form-control" required/>
            </div>
            <div class="form-group">
            <label for="Cod ALumno">Descripcion</label>
            <textarea id="obs" name="descripcion" class="form-control" required></textarea>
            </div>
            <div class="form-group">
            <label for="CodMatri">Imagen</label>
            <div class="input-group mb-3">
                <div class="input-group-prepend">
                    <span class="input-group-text" id="basic-addon1">../media/livre/</span>
                </div>
                <input type="text" class="form-control" name="image" placeholder="img.jpg" aria-label="Username" aria-describedby="basic-addon1"  required>
                </div>
            </div>

            <div class="form-group">
            <label for="CodMatri">Precio</label>
            <div class="input-group mb-3">
                <div class="input-group-prepend">
                    <span class="input-group-text" id="basic-addon1">$</span>
                </div>
                <input type="text" class="form-control" name="price" placeholder="499" aria-label="Username" aria-describedby="basic-addon1"  required>
                </div>
            </div>

            <div class="form-group">
                <label for="Observacion">Autor</label>
                <select class="browser-default custom-select" name="id_a">
                    <?php foreach($autors as $autor): ?>
                        <option value="<?=$autor['id']?>"><?=utf8_encode($autor['nombre'])?></option>
                    <?php endforeach; ?>
                </select>
            </div>

            <div class="form-group">
                <label for="Observacion">Editorial</label>
                <select class="browser-default custom-select" name="id_e">
                    <?php foreach($editorials as $editorial): ?>
                        <option value="<?=$editorial['id']?>"><?=utf8_encode($editorial['nombre'])?></option>
                    <?php endforeach; ?>
                </select>
            </div>

            <div class="form-group">
                <label for="Observacion">Genero 1</label>
                <select class="browser-default custom-select" name="gen1">
                    <?php foreach($gens as $gen): ?>
                        <option value="<?=$gen['id']?>"><?=utf8_encode($gen['nombre'])?></option>
                    <?php endforeach; ?>
                </select>
            </div>

            <div class="form-group">
                <label for="Observacion">Genero 2</label>
                <select class="browser-default custom-select" name="gen2">
                    <?php foreach($gens as $gen): ?>
                        <option value="<?=$gen['id']?>"><?=utf8_encode($gen['nombre'])?></option>
                    <?php endforeach; ?>
                </select>
            </div>
        </div>
        <div class="modal-footer">
            <button type="button" class="btn btn-default" data-dismiss="modal">Cancelar</button>
            <button type="submit" class="btn btn-primary mb-2">Agregar</button>
        </div>
        </div>
    </div>
</form>
</div>


<?php foreach($books as $book): ?>
<div class="modal fade" id="book<?=$book['id']?>" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
<form action="#">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header text-center">
                <h4 class="modal-title w-100 font-weight-bold"><?= utf8_encode($book['titulo']); ?></h4>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                <span aria-hidden="true">&times;</span>
                </button>
            </div>
        <div class="modal-body">
            <div class="form-group">
            <label for="id_alumno">Titulo</label>
            <input  type="text" id="title" class="form-control" value="<?= utf8_encode($book['titulo']); ?>" required/>
            </div>
            <div class="form-group">
            <label for="Cod ALumno">Descripcion</label>
            <textarea id="obs" name="" class="form-control" required><?= utf8_encode($book['descripcion']); ?></textarea>
            </div>
            <div class="form-group">
            <label for="CodMatri">Imagen</label>
            <div class="input-group mb-3">
                <div class="input-group-prepend">
                    <span class="input-group-text" id="basic-addon1">../media/livre/</span>
                </div>
                <input type="text" class="form-control" value="<?= substr($book['imagen'],16); ?>" aria-label="Username" aria-describedby="basic-addon1"  required>
                </div>
            </div>

            <div class="form-group">
                <label for="Observacion">Autor</label>
                <select class="browser-default custom-select">
                    <?php foreach($autors as $autor): ?>
                        <option value="<?=$autor['id']?>"><?=utf8_encode($autor['nombre'])?></option>
                    <?php endforeach; ?>
                </select>
            </div>

            <div class="form-group">
                <label for="Observacion">Editar</label>
                <select class="browser-default custom-select">
                    <?php foreach($editorials as $editorial): ?>
                        <option value="<?=$editorial['id']?>"><?=utf8_encode($editorial['nombre'])?></option>
                    <?php endforeach; ?>
                </select>
            </div>

            <div class="form-group">
                <label for="Observacion">Genero 1</label>
                <select class="browser-default custom-select">
                    <?php foreach($editorials as $editorial): ?>
                        <option value="<?=$editorial['id']?>"><?=utf8_encode($editorial['nombre'])?></option>
                    <?php endforeach; ?>
                </select>
            </div>

            <div class="form-group">
                <label for="Observacion">Genero 2</label>
                <select class="browser-default custom-select">
                    <?php foreach($gens as $gen): ?>
                        <option value="<?=$gen['id']?>"><?=utf8_encode($gen['nombre'])?></option>
                    <?php endforeach; ?>
                </select>
            </div>
        </div>
        <div class="modal-footer">
            <button type="button" class="btn btn-default" data-dismiss="modal">Cancelar</button>
            <button type="submit" class="btn btn-primary mb-2">Agregar</button>
        </div>
        </div>
    </div>
</form>
</div>

<?php endforeach; ?>


