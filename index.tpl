<!DOCTYPE html>
<html>

<head>
  <meta charset="UTF-8">
  <title>DECLARACION JURADA</title>
  <link rel="stylesheet" href="css/style.css" media="screen" type="text/css" />
  <script src="js/jquery.min.js"></script>
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
    <script type="text/javascript">
        $('#validar-codigo').click(function() {
            //Se verifica si alguno de los radios esta seleccionado
            if ($('input[name="codigo"]').is(':checked')) {
                alert('Campo correcto');
            }
            else {
                alert('Se debe seleccionar un idioma');
            }
        });
    </script>
    <script type="text/javascript">
        $(document).ready(function()
        {
            $('input[name="codigo"]').click(function () {    
                alert("El valor es: "+ $('input:radio[name=codigo]:checked').val());
                alert($(this.).val());
            });
        });
</script>
</head>

<body>
    <section>
		 <form method="post" action="/codigo" >
		 	<fieldset>
    		 <legend>Opciones de Busqueda</legend>
			 <input id="radio" type="radio" name="codigo" formaction="/codigo" val="codigoContri" /> Codigo Contribuyente
			 <input type="text" name="CodContri" class="placeholder" onkeypress="return justNumbers(event);" placeholder="Ejm. 311245" maxlength="6" pattern="[0-9]{6}"><br>
			 <input id="radio" type="radio" name="codigo" val="nombreContri"/> Nombre Contribuyente
			 <input type="text" name="NomContri" class="placeholder" placeholder="Nombre">
			 <input type="text" name="NomContri" class="placeholder" placeholder="Primer Apellido">
			 <input type="text" name="NomContri" class="placeholder" placeholder="Segundo Apellido"><br>
			 <input id="radio"type="radio" name="codigo" val="CodCatas"/> Codigo Catastral
			 <input type="text" name="CodCatas" class="placeholder" onkeypress="return justNumbers(event);" placeholder="Ejm. 04012601001005" maxlength="14" pattern="[0-9]{14}"><br>
			 <br>
			 <input id="busqueda" type="submit" name="BUSCAR" value="BUSQUEDA">
			</fieldset>
		</form>
	</section>
	

</body>

</html>
