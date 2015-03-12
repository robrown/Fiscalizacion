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
            $('input[type="submit"]').hide();
            $('input[name="codigo"]').click(function () {    
                switch ($('input:radio[name=codigo]:checked').val()){
                    case "codigoContri":
                        $('#CodContri').show().focus();
                        $('#buscarCodigo').show();
                        $('#CodCatas').hide();
                        $('#buscarCatastro').hide();
                        $('#buscarNombre').hide();
                        $('#NomContri').hide();
                        $('#NomContri1').hide();
                        $('#NomContri2').hide();
                        break;
                    case "nombreContri":
                        $('#NomContri').show().focus();
                        $('#NomContri1').show();
                        $('#NomContri2').show();
                        $('#buscarNombre').show();
                        $('#CodContri').hide();
                        $('#CodCatas').hide();
                        $('#buscarCodigo').hide();
                        $('#buscarCatastro').hide();
                        break;
                    case "CodCatas":
                        $('#CodCatas').show().focus();
                        $('#buscarCatastro').show();
                        $('#NomContri1').hide();
                        $('#NomContri2').hide();
                        $('#CodContri').hide();
                        $('#NomContri').hide();
                        $('#buscarCodigo').hide();
                        $('#buscarNombre').hide();
                        break;
                }         
            });
        });
    </script>
    
</head>

<body>
    <section>
        <fieldset>
            <legend>Opciones de Busqueda</legend>
                <input id="radio" type="radio" name="codigo"  value="codigoContri" /> Codigo Contribuyente
                <form method="post" id="formulario" action="/codigo">
                    <input type="text" id="CodContri" class="placeholder" onkeypress="return justNumbers(event);" placeholder="Ejm. 311245" maxlength="6" pattern="[0-9]{6}" name="CodContri">
                    <input type="submit" id="buscarCodigo" name="buscarCodigo" value="BUSQUEDA"/>
                </form>
                <input id="radio" type="radio" name="codigo" value="nombreContri"/> Nombre Contribuyente
                <form method="post" action="/nombre">
                 <input type="text" id="NomContri" class="placeholder" placeholder="Nombre" name="nombre">
                 <input type="text" id="NomContri1" class="placeholder" placeholder="Apellido Paterno" name="paterno">
                 <input type="text" id="NomContri2" class="placeholder" placeholder="Apellido Materno" name="materno">
                 <input type="submit" id="buscarNombre" name="buscarNombre" value="BUSQUEDA"/>
                </form>
                <input id="radio" type="radio" name="codigo" value="CodCatas"/> Codigo Catastral
                <form method="post" action="/catastro">
			     <input type="text" id="CodCatas" class="placeholder" onkeypress="return justNumbers(event);" placeholder="04012601001005" maxlength="14" pattern="[0-9]{14}" name="CodCatas">
			     <input type="submit" id="buscarCatastro" name="buscarCatastro" value="BUSQUEDA"/>
                </form>
        </fieldset>    
	</section>
	

</body>

</html>
