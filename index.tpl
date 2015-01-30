<!DOCTYPE html>
<html>

<head>
  <meta charset="UTF-8">
  <title>DECLARACION JURADA</title>
  <link rel="stylesheet" href="css/style.css" media="screen" type="text/css" />
  <script src='http://codepen.io/assets/libs/fullpage/jquery.js'></script>
  <script src="js/slider.js"></script>
    <script type="text/javascript">
        function justNumbers(e)
        {
        var keynum = window.event ? window.event.keyCode : e.which;
        if ((keynum == 8) || (keynum == 46) || (keynum ==0))
        return true;

        return /\d/.test(String.fromCharCode(keynum));
	    }
	</script>
</head>

<body>
    <section>
		 <form >
		 	<fieldset>
    		 <legend>Opciones de Busqueda</legend>
			 <input type="radio" name="codigo" value="CodContri" />Codigo Contribuyente
			 <input type="text" name="CodContri" class="placeholder" onkeypress="return justNumbers(event);" placeholder="Ejm. 311245" maxlength="6" pattern="[0-9]{6}"><br>
			 <input type="radio" name="codigo" value="NomContri"/>Nombre Contribuyente
			 <input type="text" name="NomContri" class="placeholder" placeholder="Nombre">
			 <input type="text" name="NomContri" class="placeholder" placeholder="Primer Apellido">
			 <input type="text" name="NomContri" class="placeholder" placeholder="Segundo Apellido"><br>
			 <input type="radio" name="codigo" value="CodCatas"/>Codigo Catastral
			 <input type="text" name="CodCatas" class="placeholder" onkeypress="return justNumbers(event);" placeholder="Ejm. 04012601001005" maxlength="14" pattern="[0-9]{14}"><br>	
			 <br>
			 <input type="submit" name="BUSCAR" value="BUSQUEDA">
			</fieldset>
		</form>
	</section>
	<section>
		<fieldset>
    		 <legend>Ubicación del Predio</legend>
    	</fieldset>
	</section>
    <div id="slider">
      <a href="#" class="control_next">>></a>
      <a href="#" class="control_prev"><</a>
      <ul>
        <li> <img src="img/05023001-1.JPG" height="500" width="600"></li>
        <li> <img src="img/05023001-2.JPG" height="500" width="600"></li>
        <li>SLIDE 3</li>
        <li style="background: #aaa;">SLIDE 4</li>
      </ul>
    </div>

</body>

</html>
