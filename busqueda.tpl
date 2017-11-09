<!DOCTYPE html>
<html>

<head>
  <meta charset="UTF-8">
  <title>DECLARACION JURADA</title>
  <link rel="stylesheet" href="css/style.css" media="screen" type="text/css" />
  <link rel="stylesheet" href="css/table.css" media="screen" type="text/css" />
  <script src="js/jquery.min.js"></script>
</head>
<body>
    <p style="text-align:right"><a style="color:#dd5" href="/">Nueva Busqueda</a></p>
    <form id="enviar" method="post" action="/nombre">
                 <input type="hidden" id="NomContri" class="placeholder" placeholder="Nombre" name="nombre">
                 <input type="hidden" id="NomContri1" class="placeholder" placeholder="Apellido Paterno" name="paterno">
                 <input type="hidden" id="NomContri2" class="placeholder" placeholder="Apellido Materno" name="materno">
    </form>
    <section>
        <fieldset>
            <legend>Seleccione un contribuyente</legend>
            <table  class="rwd-table">
                  <tr>
                    <th>APELLIDO PATERNO</th>
                    <th>APELLIDO MATERNO</th>
                    <th>NOMBRE</th>
                  </tr>
                  %for numero in dato:
                  <tr style="cursor:pointer" class="desmarcado">
                    <td  data-th="APELLIDO PATERNO" >{{numero["APE_PATERNO"]}}</td>
                    <input type="hidden" id="pater" name="pater" value="{{numero["APE_PATERNO"]}}">
                    <td  data-th="APELLIDO MATERNO" >{{numero["APE_MATERNO"]}}</td>
                    <input type="hidden" id="mater" name="mater" value="{{numero["APE_MATERNO"]}}">
                    <td  data-th="NOMBRE" >{{numero["NOMBRES"]}}</td>
                    <input type="hidden" id="nomb" name="nomb" value="{{numero["NOMBRES"]}}">               
                  </tr>
                  %end
              <script type="text/javascript">
                  $(".desmarcado").click(function(){
                    var paterno = $(this).find('input:hidden[name=pater]').val();
                    var materno = $(this).find('input:hidden[name=mater]').val();
                    var nom = $(this).find('input:hidden[name=nomb]').val();
                    document.getElementById("NomContri1").value = paterno;
                    document.getElementById("NomContri2").value = materno;
                    document.getElementById("NomContri").value = nom;
                    $( "#enviar" ).submit();
                  });
                 
              </script>
            </table>            
    	</fieldset>
	</section>
  