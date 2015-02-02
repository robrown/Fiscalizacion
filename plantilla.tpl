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
                <label>{{dic_ubi["dire"]}}</label>
                <label>{{dic_ubi["mzn"]}}</label>
                <label>{{dic_ubi["lte"]}}</label>
                <label>{{dic_ubi["tvia"]}}</label>
                <label>{{dic_ubi["nvia"]}}</label>
                <label>{{dic_ubi["nro"]}}</label>
            
    	</fieldset>
	</section>
    <fieldset>
        <legend>Datos del Contribuyente</legend>
            <label>Nombre </label><br>
            %for numero in propi:
                <label>{{numero}}</label><br>
            %end
    </fieldset>
    
    <div id="slider">
      <a href="#" class="control_next">>></a>
      <a href="#" class="control_prev"><</a>
      <ul>
          %if foto != None:
              %for fotos in foto:
                <li> <img src={{fotos}} height="500" width="600"></li>
              %end
          %end
      </ul>
    </div>
    
</body>