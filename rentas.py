import pymongo
import bottle
import buscar

__author__ = 'rodolfo'
@bottle.route('/')
def index():
    return bottle.template('index.tpl')

from bottle import static_file
@bottle.route('/css/<filename>')
def server_static(filename):
    return static_file(filename, root='/home/rodolfo/PycharmProjects/Fiscalizacion/css')
  #Mac
  #return static_file(filename, root='/Users/iServidor/eleccionesarequipa2014/css')

@bottle.route('/img/<filename>')
def server_static(filename):
    return static_file(filename, root='/home/rodolfo/PycharmProjects/Fiscalizacion/img')
    #return static_file(filename, root='/Users/iServidor/eleccionesarequipa2014/img')

@bottle.route('/js/<filename>')
def server_static(filename):
    return static_file(filename, root='/home/rodolfo/PycharmProjects/Fiscalizacion/js')
    #return static_file(filename, root='/Users/iServidor/eleccionesarequipa2014/js')



connection_string = "mongodb://localhost"
connection = pymongo.MongoClient(connection_string)
database = connection.rentas

busca= buscar.Buscar(database)

bottle.debug(True)
bottle.run(host='localhost', port=8082)         # Start the webserver running and wait for requests
