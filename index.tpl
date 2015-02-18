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
        $(document).ready(function()
        {
            $('input[type="text"]').hide();
            $('input[name="codigo"]').click(function () {    
                switch ($('input:radio[name=codigo]:checked').val()){
                    case "codigoContri":
                        $('#CodContri').show().focus();
                        $('#CodCatas').hide();
                        $('#NomContri').hide();
                        $('#NomContri1').hide();
                        $('#NomContri2').hide();
                        break;
                    case "nombreContri":
                        $('#NomContri').show().focus();
                        $('#NomContri1').show();
                        $('#NomContri2').show();
                        $('#CodContri').hide();
                        $('#CodCatas').hide();
                        break;
                    case "CodCatas":
                        $('#CodCatas').show().focus();
                        $('#NomContri1').hide();
                        $('#NomContri2').hide();
                        $('#CodContri').hide();
                        $('#NomContri').hide();
                        break;
                }         
            });
        });
    </script>
    <script type="text/javascript">
        function enviar()
        {
            alert("Estoy axa");
            switch ($('input:radio[name=codigo]:checked').val()){
                    case "codigoContri":
                        document.getElementById("formulario").action = "/codigo";
                        document.getElementById("formulario").submit();
                        break;
                    case "nombreContri":
                        $(document).getElementById("formulario").action = "/nombre";
                        $(document).getElementById("formulario").submit();
                        break;
            }
        }
    
    </script>
</head>

<body>
    <section>
		 <form method="post" action="" id="formulario">
		 	<fieldset>
    		 <legend>Opciones de Busqueda</legend>
			 <input id="radio" type="radio" name="codigo"  value="codigoContri" /> Codigo Contribuyente
			 <input type="text" id="CodContri" class="placeholder" onkeypress="return justNumbers(event);" placeholder="Ejm. 311245" maxlength="6" pattern="[0-9]{6}" name="CodContri"><br>
			 <input id="radio" type="radio" name="codigo" value="nombreContri"/> Nombre Contribuyente
			 <input type="text" id="NomContri" class="placeholder" placeholder="Nombre" name="nombre">
			 <input type="text" id="NomContri1" class="placeholder" placeholder="Apellido Paterno" name="paterno">
			 <input type="text" id="NomContri2" class="placeholder" placeholder="Apellido Materno" name="materno"><br>
			 <input id="radio" type="radio" name="codigo" value="CodCatas"/> Codigo Catastral
			 <input type="text" id="CodCatas" class="placeholder" onkeypress="return justNumbers(event);" placeholder=" 04012601001005" maxlength="14" pattern="[0-9]{14}" name="CodCatas"><br>
			 <br>
			 <input id="busqueda" type="submit" name="BUSCAR" value="BUSQUEDA" onclick=javascript:enviar();>
			</fieldset>
		</form>
	</section>
	

</body>

</html>
