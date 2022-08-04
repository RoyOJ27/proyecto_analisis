<?php
$usuario=$_POST['nickname'];
$contraseña=$_POST['password'];
session_start();
$_SESSION['nickname']=$usuario;

$conectar = @mysqli_connect("localhost","root","","DB");

$consulta="SELECT*FROM usuario where usuario = '$usuario' and clave='$contraseña'";
$resultado=mysqli_query($conectar,$consulta);

$fila=mysqli_num_rows($resultado);

if($fila){
    header("location:inicio.php");
}else{
    ?>
    <?php
    include("index.php");
    ?>
    <h1 class="bad">ERROR EN LA AUTENTIFICACION<h1>
    <?php
}
mysqli_free_result($resultado);
mysqli_close($conectar);
