<?php

?>


<div class="ml-5 mr-5 mt-3">
    <form action="../php/update.php" class="ml-3 mr-3" method='GET'>
        <h3 class="text-center mb-4">Cambiar tu informacion</h3>
        <div class="input-group mb-3">
        <div class="input-group-prepend">
            <span class="input-group-text" id="basic-addon1">Nombre:</span>
        </div>
        <input name='nombre'  type="text" class="form-control" placeholder="<?=$_SESSION['username']?>" aria-label="Username" aria-describedby="basic-addon1" required>
        </div>

        <input name='id' value="<?=$_SESSION['id']?>" type="hidden" > <!--- Input invicible-->

        <div class="input-group mb-3">
        <div class="input-group-prepend">
            <span class="input-group-text" id="basic-addon1">Correo:</span>
        </div>
        <input name='correo' type="text" class="form-control" placeholder="<?=$_SESSION['correo']?>" aria-label="Username" aria-describedby="basic-addon1" required>
        </div>

        <div class="input-group mb-3">
        <div class="input-group-prepend">
            <span class="input-group-text" id="basic-addon1">Contraseña:</span>
        </div>
        <input name='clave' type="password" class="form-control" placeholder="contraseña" aria-label="Username" aria-describedby="basic-addon1" required>
        </div>

        <div class="input-group mb-3">
        <div class="input-group-prepend">
            <span class="input-group-text" id="basic-addon1">Telefono:</span>
        </div>
        <input name='telefono' type="text" class="form-control" placeholder="<?=$_SESSION['telefono']?>" aria-label="Username" aria-describedby="basic-addon1">
        </div>
        <input class="btn btn-primary align-content-center" type="submit" value="Actualizar informacion">
    </form>
</div>