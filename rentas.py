import pymongo
import bottle
import buscar
import os

__author__ = 'rodolfo'


@bottle.route('/')
def index():
    return bottle.template('index.tpl')


@bottle.post('/codigo')
def busca_codigo_contri():
    cod = bottle.request.forms.get("CodContri")
    #cat = bottle.request.forms.get("CodCatas")
    if cod == "":
        return '''
			<script type="text/javascript">
				alert("No ha digitado ningun codigo");
				location.href='/';
			</script>
			'''
    else:
        print cod
        dato = busca.buscar_cod_contri(cod)
        if dato == None:
            return '''
			<script type="text/javascript">
				alert("No existe un contribuynte con ese codigo");
				location.href='/';
			</script>
			'''
            # bottle.redirect("/")
            #for i in dato:
            #    print i["ID_LOTE"]
            #redire_plantilla(dato)
    dic_ubi = ubicacion(dato)
    propi = propietarios(dato)
    image = imagenes(dato)
    cont_img = len(image)
    total_pisos = pisos(dato)
    return bottle.template('plantilla.tpl',
                           {"dic_ubi": dic_ubi, "propi": propi, "foto": image, "conta": cont_img, "pisos": total_pisos})
    # bottle.redirect("plantilla")


@bottle.post('/catastro')
def busca_codigo_catastro():
    cod = bottle.request.forms.get("CodCatastro")
    if cod == "":
        return '''
			<script type="text/javascript">
				alert("No ha digitado ningun codigo");
				location.href='/';
			</script>
			'''
    else:
        print cod
        dato = busca.buscar_cod_contri(cod)
        if dato == None:
            return '''
			<script type="text/javascript">
				alert("No existe un contribuyente con ese codigo");
				location.href='/';
			</script>
			'''

def imagenes(dato):
    aux = str(dato[0]["ID_LOTE"])
    imag = aux[5:13]
    """sector = imag[0:2]
    manzana = imag[2:5]
    print sector,manzana
    sector = "SECTOR" + sector
    print sector
    nuevaruta=os.path.abspath(os.path.join(os.path.dirname( __file__ ), '..', sector))
    print nuevaruta"""
    ruta = os.path.abspath("img") + "/" + imag + ".JPG"
    array = []
    if os.path.exists(ruta):
        parseo = "img/" + imag + ".JPG"
        array.append(parseo)
        return array
    else:
        for i in range(3):
            ruta = os.path.abspath("img") + "/" + imag + "-" + str(i + 1) + ".JPG"
            if os.path.exists(ruta):
                parseo = "img/" + imag + "-" + str(i + 1) + ".JPG"
                array.append(parseo)
            else:
                print "No hay imagenes para esta direccion"
        return array


def propietarios(dato):
    cont = dato.count()
    contribu = []
    name = dato[0]["APE_PATERNO"] + " " + dato[0]["APE_MATERNO"] + " " + dato[0]["NOMBRES"]
    contribu.append(name)
    for i in range(cont):
        nuevo = dato[i]["APE_PATERNO"] + " " + dato[i]["APE_MATERNO"] + " " + dato[i]["NOMBRES"]
        if name in contribu:
            name = nuevo
        else:
            contribu.append(name)
    return contribu


def ubicacion(dato):
    ubi={"dire":dato[0]["NOM_HAB_URBA"],
    "mzn":dato[0]["MZNA_MUNI"],
    "lte":dato[0]["LOTE_MUNI"],
    "tvia":dato[0]["TIP_VIA"],
    "nvia":dato[0]["NOM_VIA"],
    "nro":dato[0]["NROS_MUNI"]}
    """ubi = dato[0]["NOM_HAB_URBA"], dato[0]["MZNA_MUNI"], dato[0]["LOTE_MUNI"], dato[0]["TIP_VIA"], \
          dato[0]["NOM_VIA"], dato[0]["NROS_MUNI"]"""
    return ubi


def pisos(dato):
    nro_pisos = [None] * dato.count()
    aux = []
    conta = 0
    for pis in dato:
        aux = pis["NRO_PISO"], pis["CONSTRUCCIONES_1_AREA_VERIFICADA"],pis["FICHAS_INDIVIDUALES_AREA_VERIFICADA"], pis["ESTRU_MURO_COL"], pis["ESTRU_TECHO"], \
              pis["ACABA_PISO"], pis["ACABA_PUERTA_VEN"], pis["ACABA_REVEST"], pis["ACABA_BANO"], pis[
            "INST_ELECT_SANITA"]
        aux = list(aux)
        nro_pisos[conta] = aux
        #print nro_pisos[conta]
        conta += 1
    nro_pisos.sort()
    return nro_pisos


from bottle import static_file


@bottle.route('/css/<filename>')
def server_static(filename):
    # return static_file(filename, root='/home/rodolfo/PycharmProjects/Fiscalizacion/css')
    # Mac
    return static_file(filename, root='/Users/iServidor/Fiscalizacion/css')


@bottle.route('/img/<filename>')
def server_static(filename):
    # return static_file(filename, root='/home/rodolfo/PycharmProjects/Fiscalizacion/img')
    return static_file(filename, root='/Users/iServidor/Fiscalizacion/img')


@bottle.route('/js/<filename>')
def server_static(filename):
    # return static_file(filename, root='/home/rodolfo/PycharmProjects/Fiscalizacion/js')
    return static_file(filename, root='/Users/iServidor/Fiscalizacion/js')


connection_string = "mongodb://localhost"
connection = pymongo.MongoClient(connection_string)
database = connection.rentas

busca = buscar.Buscar(database)

bottle.debug(True)
bottle.run(host='localhost', port=8082)  # Start the webserver running and wait for requests
