import federacion.*
class Centro{
    const property ciudadanos = []
    var capacidadMaxima
    var indiceInnovacion

    method capacidadMaxima() = capacidadMaxima
    method indiceInnovacion() = indiceInnovacion

    method capacidadEfectivaProteccion() = self.comunidadDestacada().sum({cd => cd.potencia()})
    method comunidadDestacada() = ciudadanos.filter({c => c.esNotable()})
    method esDeElite() = indiceInnovacion>5 && ciudadanos.all({c => c.habilidad()>=12})
    method ciudadanoMasJoven() = ciudadanos.min({c => c.edad()})
    method nivelInicialProteccion() = ciudadanos.filter({c => c.potencia()>=federacion.potenciaMinima()}).size()

    method agregarCiudadano(unCiudadano){
        if (ciudadanos.size()==capacidadMaxima)
            self.error("Supera la cantidad maxima permitida")
        ciudadanos.add(unCiudadano)
    }

    method puedeSolicitarContribucion() = !ciudadanos.isEmpty()
    method solicitarContribucion(){
        if (self.puedeSolicitarContribucion())
            capacidadMaxima+=1
            ciudadanos.forEach({c => c.realizarContribucionA(self)})
            ciudadanos.filter({c => c.edad() > 65}).forEach({c => self.jubilarA(c)})
    }
    method jubilarA(unCiudadano){
        ciudadanos.remove(unCiudadano)
    }
    method aumentarIndiceInnovacionEn(unaCant){
        indiceInnovacion += unaCant
    }
}
