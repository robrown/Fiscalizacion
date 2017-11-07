__author__ = 'rodolfo'


def pisos(dato):
    nro_pisos = [None] * dato.count()
    aux = pis["NRO_PISO"], pis["CONSTRUCCIONES_1_AREA_VERIFICADA"],pis["FICHAS_INDIVIDUALES_AREA_VERIFICADA"], pis["ESTRU_MURO_COL"], pis["ESTRU_TECHO"], \
              pis["ACABA_PISO"], pis["ACABA_PUERTA_VEN"], pis["ACABA_REVEST"], pis["ACABA_BANO"], pis[
            "INST_ELECT_SANITA"]
    aux = list(aux)
    conta = 0
    nro_pisos[conta].append(aux)
    for pis in dato:
        nuevo = pis["NRO_PISO"], pis["CONSTRUCCIONES_1_AREA_VERIFICADA"],pis["FICHAS_INDIVIDUALES_AREA_VERIFICADA"], pis["ESTRU_MURO_COL"], pis["ESTRU_TECHO"], \
              pis["ACABA_PISO"], pis["ACABA_PUERTA_VEN"], pis["ACABA_REVEST"], pis["ACABA_BANO"], pis[
            "INST_ELECT_SANITA"]
        nuevo = list(nuevo)
        if aux in nro_pisos:
            aux = nuevo
        else:
            nro_pisos[conta].append(aux)
        #nro_pisos[conta] = aux
        #print nro_pisos[conta]
        conta += 1
    nro_pisos.sort()
    return nro_pisos