<!DOCTYPE html>
<html>

<head>
  <meta charset="UTF-8">
  <title>DECLARACION JURADA</title>
  <link rel="stylesheet" href="css/style.css" media="screen" type="text/css" />
    <link rel="stylesheet" href="css/table.css" media="screen" type="text/css" />
  <script src="js/jquery.js"></script>
  <script src="js/slider.js"></script>
</head>
<body>
    <p style="text-align:right"><a style="color:#dd5" href="/">Nueva Busqueda</a></p>
    <section>
        <fieldset>
            <legend>Ubicación del Predio</legend>
            <table class="rwd-table">
                  <tr>
                    <th>Dirección</th>
                    <th>Manzana</th>
                    <th>Lote</th>
                    <th>Tipo Via</th>
                    <th>Nombre Via</th>
                    <th>Número</th>
                    <th>Cod. Contribuyente</th>
                    <th>Cod. Catastral</th>
                  </tr>
                  <tr>
                    <td data-th="Dirección">{{dic_ubi["dire"]}}</td>
                    <td data-th="Manzana">{{dic_ubi["mzn"]}}</td>
                    <td data-th="Lote">{{dic_ubi["lte"]}}</td>
                    <td data-th="Tipo Via">{{dic_ubi["tvia"]}}</td>
                    <td data-th="Nombre Via">{{dic_ubi["nvia"]}}</td>
                    <td data-th="Número">{{dic_ubi["nro"]}}</td>
                    <td data-th="Cod. Contribuyente">{{dic_ubi["cod"]}}</td>
                    <td data-th="Cod. Catastral">0{{dic_ubi["contri"]}}</td>
                  </tr>
                  
            </table>            
    	</fieldset>
	</section>
    <fieldset>
        <legend>Datos del Contribuyente</legend>
         <table class="rwd-table">
            <tr>
                <th>Nombre</th>
            </tr>
            %for numero in propi:
             <tr>
                <td data-th="Nombre">{{numero}}</td>
            </tr>
             %end
        </table>  
    </fieldset>
    <div id="contenedor">
        <div id="contenido">
            <fieldset>
                <legend>Construcción</legend>
                <table class="rwd-table">
                  <tr>
                    <th>Piso</th>
                    <th>Area</th>
                    <th>Area Total</th>
                    <th></th>
                  </tr>
                %for numero in pisos:
                  <tr>
                    %for piso in numero:
                    <td data-th="Piso">{{piso}}</td>
                    %end
                  </tr>
                %end
            </table>            
            </fieldset>
        </div>
        <fieldset>
        <legend>Imagen</legend>
        %if foto != []:
        <div id="slider" >
          <a href="#" class="control_next">>></a>
          <a href="#" class="control_prev"><<</a>
          <ul>
                %if conta == 1:
                    <li><img src={{foto[0]}} height="400" width="500"></li>
                    <li>No hay otra imagen</li>
                %else:        
                  %for fotos in foto:
                    <li> <img src={{fotos}} height="400" width="500"></li>
                  %end
                %end

          </ul>
        </div>
        %end
        </fieldset>
    </div>
 </body>