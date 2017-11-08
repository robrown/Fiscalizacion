#!/usr/bin/env python
import Image
import pymongo
import base64
import bottle
import os

from PIL import Image, ImageOps
from pymongo import MongoClient
from bottle import static_file
con = MongoClient()
db = con.catastro

@bottle.route('/img/<filename>')
def server_static(filename):
    return static_file(filename, root='/home/rodolfo/PycharmProjects/Fiscalizacion/img')

image = os.path.abspath("img") + "/" + "0256004.JPG"
img = open(image, 'rb')
image_read = img.read()
encoded_string = base64.encodestring(image_read)
print encoded_string

#img.save('/home/santiago/Documents/Python/img/exito2.jpg')
#encoded = base64.b64encode(img)

#with open(image, "rb") as image_file:
#    encoded_string = base64.encodestring(image_file.read())

#decode_string = base64.b64decode(encoded_string)


user = {
    'nombre' : 'Saul',
    'edad' : 38,
    'localidad' : 'Monterrey',
    'curp' : 'NDUBD88DND87',
    'imagen' : encoded_string
}
#print encoded_string


use = db.users
use.insert_one(user)

aux = use.find_one()
picture = aux['imagen']

decode_imagen = base64.decodestring(picture)
result = open('Picture.JPG', 'wb')
result.write(decode_imagen)



print 'Insertado Correctamente' + str(use.inserted_id)


#for row in use.find():
#    print row
