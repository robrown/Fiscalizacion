<!DOCTYPE html>
<html>

<head>
  <meta charset="UTF-8">
  <title>DECLARACION JURADA</title>
  <link rel="stylesheet" href="css/style.css" media="screen" type="text/css" />
  <script src="js/jquery.min.js"></script>
  <script src="js/slider.js"></script>
</head>
<body>
    <section>
        <fieldset>
            <legend>Ubicación del Predio</legend>
                <label>Dirección</label><label>Manzana</label><label>Lote</label><label>Tipo Via</label><label>Nombre Via</label><label>Número</label><br>
     
                %for ubi in dic_ubi:
                    <label>{{ubi}}</label>
                %end
            
    	</fieldset>
	</section>
    <fieldset>
        <legend>Datos del Contribuyente</legend>
            <label>Nombre </label><br>
            %for numero in propi:
                <label>{{numero}}</label><br>
            %end
    </fieldset>
    <div id="contenedor">
        <div id="contenido">
            <fieldset>
                <legend>Construcción</legend>
                <label>Piso</label><label>Area</label><label>Categorias</label><br>
                %for numero in pisos:
                    %for piso in numero:
                        <label>{{piso}}</label>
                    %end
                    <br>
                %end
            </fieldset>
        </div>
        %if foto != []:
        <div id="slider">
          <a href="#" class="control_next">>></a>
          <a href="#" class="control_prev"><</a>
          <ul>
                %if conta == 1:
                    <li><img src={{foto[0]}} height="500" width="600"></li>
                    <li>No hay otra imagen</li>
                %else:        
                  %for fotos in foto:
                    <li> <img src={{fotos}} height="500" width="600"></li>
                  %end
                %end

          </ul>
        </div>
        %end
    </div>

</body>