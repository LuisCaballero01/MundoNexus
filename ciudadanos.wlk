class Ciudadano{
    const edad

    method edad() = edad
    method esNotable() = edad.between(25,35)
    method habilidad() = if (edad.between(20,40)) 15 else 10
    method potencia() = 20

    method realizarContribucionA(unCentro)
}
class Ingeniero inherits Ciudadano{
    var nivelEspecializacion = 5

    override method esNotable() = super() && nivelEspecializacion>8
    override method habilidad() = super() + nivelEspecializacion*3
    
    override method realizarContribucionA(unCentro){
        unCentro.aumentarIndiceInnovacionEn(nivelEspecializacion.div(4))
        self.sufrirFlasheo()
    }

    method capacitarse(){
        nivelEspecializacion+=2
        self.sufrirFlasheo()
    }
    method sufrirFlasheo(){
        if (!self.esNotable())
            nivelEspecializacion -= 1
    }
}
class Guardian inherits Ciudadano{
    var reservaOperativa = 100

    override method esNotable() = (super() && self.potencia()>50) || reservaOperativa>150
    override method potencia() = super() + reservaOperativa*0.1

    method entrenar(){
        reservaOperativa = 300.min(reservaOperativa+10)
    }
    method patrullar(){
        reservaOperativa = 0.max(reservaOperativa - if (self.habilidad().even()) 20 else 18)
    }
    override method realizarContribucionA(unCentro){}
}
