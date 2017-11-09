import pymongo
from bson.json_util import dumps
import string
import sys

__author__ = 'rodolfo'


class Buscar:
    def __init__(self, db):
        self.db = db
        self.catastro = self.db.catastro

    def buscar_cod_contri(self, cod_contri):
        """

        :rtype : Envia un diccionario con la busqueda por codigo de contribuyente
        """
        codigo = None
        pregunta = {'COD_CONTRIBUYENTE':int(cod_contri)}
        restri = {'ID_LOTE': True, 'NOM_HAB_URBA': True, 'MZNA_MUNI': True, 'LOTE_MUNI': True, 'NROS_MUNI': True,
                  'NOM_VIA': True, 'TIP_VIA': True, 'NRO_PISO': True, 'CONSTRUCCIONES_1_AREA_VERIFICADA': True,
                  'NOMBRES': True, 'APE_PATERNO': True, 'APE_MATERNO': True, 'COD_CONTRIBUYENTE': True,
                  'ESTRU_MURO_COL': True, 'ESTRU_TECHO': True, 'ACABA_PISO': True, 'ACABA_PUERTA_VEN': True,
                  'ACABA_REVEST': True, 'ACABA_BANO': True, 'INST_ELECT_SANITA':True,
                  'FICHAS_INDIVIDUALES_AREA_VERIFICADA': True}

        try:
            codigo = self.catastro.find(pregunta,restri).sort('NRO_PISO',pymongo.ASCENDING)
            #codigo = self.catastro.find(pregunta).sort('NRO_PISO',pymongo.ASCENDING)
        except:
            print "Hubo un error en la busqueda por codigo contribuyente",sys.exc_info()[0]

        if codigo.count() == 0:
           # print "Codigo no se encuentra en la Base de Datos"
            return None

        #dato = dumps(codigo)
        #print codigo
        return codigo

    def buscar_paterno(self, ape_pater):
        ape_pater = ape_pater.upper()
        codigo = None

        pregunta = {'APE_PATERNO': ape_pater}
        restri = {'APE_PATERNO': True, 'APE_MATERNO': True, 'NOMBRES': True, '_id': False}

        try:
            codigo = self.catastro.find(pregunta, restri)
        except:
            print "Hubo un error en la busqueda por nombre",sys.exc_info()[0]

        if codigo.count() == 0:
            # print "Codigo no se encuentra en la Base de Datos"
            return None
        dato = dumps(codigo)
        return dato

    def buscar_materno(self, ape_pater, ape_mater):
        ape_pater = ape_pater.upper()
        ape_mater = ape_mater.upper()
        codigo = None

        pregunta = {'APE_PATERNO': ape_pater, 'APE_MATERNO':ape_mater}
        restri = {'APE_PATERNO': True, 'APE_MATERNO': True, 'NOMBRES': True, '_id': False}

        try:
            codigo = self.catastro.find(pregunta, restri)
        except:
            print "Hubo un error en la busqueda por nombre",sys.exc_info()[0]
        print codigo.count()
        if codigo.count() == 0:
            # print "Codigo no se encuentra en la Base de Datos"
            return None
        dato = dumps(codigo)
        return dato

    def buscar_direccion(self, direccion):
        direccion = direccion.upper()
        codigo = None

        pregunta = {'NOM_VIA': direccion}
        restri = {'NOM_VIA': True, 'NOM_HAB_URBA': True, 'MZNA_MUNI': True, 'LOTE_MUNI': True, 'ID_LOTE': True, 'NROS_MUNI': True, '_id': False}

        try:
            codigo = self.catastro.find(pregunta, restri)
        except:
            print "Hubo un error en la busqueda por nombre",sys.exc_info()[0]
        print codigo.count()
        if codigo.count() == 0:
            # print "Codigo no se encuentra en la Base de Datos"
            return None
        dato = dumps(codigo)
        return dato

    def buscar_nombre(self, ape_pater, ape_mater, nombre):
        ape_pater = ape_pater.upper()
        ape_mater = ape_mater.upper()
        nombres = nombre.upper()
        codigo = None

        pregunta = {'APE_PATERNO': ape_pater, 'APE_MATERNO': ape_mater, 'NOMBRES': nombres}
        #restri = {'APE_PATERNO': True, 'APE_MATERNO': True, 'NOMBRES': True, '_id': False}

        try:
            codigo = self.catastro.find(pregunta)
            #codigo = self.catastro.find(pregunta, restri)
        except:
            print "Hubo un error en la busqueda por nombre",sys.exc_info()[0]

        if codigo.count() == 0:
            # print "Codigo no se encuentra en la Base de Datos"
            return None
        return codigo

    def buscar_cod_catastro(self, cod_catas):
        """

        :rtype : Envia un diccionario con la busqueda por codigo CATASTRAL
        """
        codigo = None
        pregunta = {'ID_LOTE':int(cod_catas)}
        try:
            codigo = self.catastro.find(pregunta).sort('NRO_PISO',pymongo.ASCENDING)
        except:
            print "Hubo un error en la busqueda por codigo contribuyente",sys.exc_info()[0]

        if codigo.count() == 0:
           # print "Codigo no se encuentra en la Base de Datos"
            return None
        return codigo




