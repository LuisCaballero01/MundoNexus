import ciudadanos.*
import centros.*
object federacion{
    const centros = []
    var property potenciaMinima = 20

    method crearNuevoCentro(){
        return new Centro(
                indiceInnovacion=5,
                capacidadMaxima= if(centros.isEmpty()) 3 else 3.max(centros.size()),
                ciudadanos = if (centros.isEmpty()){
                    [new Ingeniero(edad=25)]
                } 
                else{ 
                    centros.map({
                        c => 
                        const cJoven = c.ciudadanoMasJoven()
                        c.jubilarA(cJoven)
                        cJoven
                    }) 
                }
            )   
    }
    method agregarCentro(unCentro){
        centros.add(unCentro)
    }
}