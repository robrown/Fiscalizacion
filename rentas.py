import pymongo
import bottle
import buscar

__author__ = 'rodolfo'

@bottle.route('/')
def index():
    return bottle.template('index.tpl',dict(CodContri=""))


@bottle.post('/codigo')
def busca_codigo_contri():
    cod = bottle.request.forms.get("CodContri")
    if cod=="":
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
            #bottle.redirect("/")
        #for i in dato:
        #    print i["ID_LOTE"]
        #redire_plantilla(dato)
    dic_ubi = ubicacion(dato)
    propi = propietarios(dato)
    return bottle.template('plantilla.tpl',{"dic_ubi":dic_ubi,"propi":propi})
    #bottle.redirect("plantilla")

"""@bottle.get("/plantilla")
def plantilla():
    return bottle.template('plantilla.tpl')"""

def imagenes(dato):
    aux = str(dato[0]["ID_LOTE"])
    img = aux[5:13]
    print img

def propietarios(dato):
    cont = dato.count()
    contribu=[]
    name = dato[0]["APE_PATERNO"]+" "+dato[0]["APE_MATERNO"]+" "+dato[0]["NOMBRES"]
    for i in range(cont):
        nuevo = dato[i]["APE_PATERNO"]+" "+dato[i]["APE_MATERNO"]+" "+dato[i]["NOMBRES"]
        if name != nuevo:
            contribu.append(name)
            name = nuevo
    contribu.append(name)
    print contribu
    return contribu



def ubicacion(dato):
    ubi={"dire":dato[0]["NOM_HAB_URBA"],
    "mzn":dato[0]["MZNA_MUNI"],
    "lte":dato[0]["LOTE_MUNI"],
    "tvia":dato[0]["TIP_VIA"],
    "nvia":dato[0]["NOM_VIA"],
    "nro":dato[0]["NROS_MUNI"]}
    return ubi

from bottle import static_file


@bottle.route('/css/<filename>')
def server_static(filename):
    return static_file(filename, root='/home/rodolfo/PycharmProjects/Fiscalizacion/css')
    # Mac
    #return static_file(filename, root='/Users/iServidor/eleccionesarequipa2014/css')


@bottle.route('/img/<filename>')
def server_static(filename):
    return static_file(filename, root='/home/rodolfo/PycharmProjects/Fiscalizacion/img')
    # return static_file(filename, root='/Users/iServidor/eleccionesarequipa2014/img')


@bottle.route('/js/<filename>')
def server_static(filename):
    return static_file(filename, root='/home/rodolfo/PycharmProjects/Fiscalizacion/js')
    # return static_file(filename, root='/Users/iServidor/eleccionesarequipa2014/js')


connection_string = "mongodb://localhost"
connection = pymongo.MongoClient(connection_string)
database = connection.rentas

busca = buscar.Buscar(database)

bottle.debug(True)
bottle.run(host='localhost', port=8082)  # Start the webserver running and wait for requests
