import pymongo
import string

__author__ = 'rodolfo'


class Buscar:
    def __init__(self, db):
        self.db = db
        self.catastro = self.db.catastro

    def buscar_cod_contri(self, cod_contri):
        codigo = None
        try:
            codigo = self.catastro.find({'COD_CONTRIBUYENTE': cod_contri})
        except:
            print "Hubo un error en la busqueda por codigo contribuyente"

        if codigo is None:
            print "Codigo no se encuentra en la Base de Datos"
            return None
        return codigo