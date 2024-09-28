object knightRider {
    method peso() = 500
    method peligrosidad() = 10
}

object bumblebee {
    var estadoAuto = true

    method estadoAuto() = estadoAuto
    method peso() = 800
    method peligrosidad() = if(estadoAuto) 15 else 30
    method cambiarAAuto() {estadoAuto = true}
    method cambiarARobot() {estadoAuto = false}
}

object paqueteLadrillos {
    var property cantLadrillos = 0

    method peso() = cantLadrillos * 2
    method peligrosidad() = 2
}

object arena {
    var property peso = 0

    method peligrosidad() = 1
}

object bateriaAntiarea {
    var property tieneMisiles = false

    method peso() = if(tieneMisiles) 300 else 200
    method peligrosidad() = if(tieneMisiles) 100 else 0
}

object contenedor {
    const cosas = []

    method cargarCosa(unaCosa) {cosas.add(unaCosa)}
    method sacarCosa(unaCosa) {cosas.remove(unaCosa)}
    method peso() = 100 + cosas.sum({c => c.peso()})
    method peligrosidad() = if(cosas.isEmpty()) 0 else cosas.max({c => c.peligrosidad()}).peligrosidad()
}

object residuosRadioactivos{
    var property peso = 0
    
    method peligrosidad() = 200
}

object embalaje{
    var property envuelve = bateriaAntiarea

    method peso() = envuelve.peso()
    method peligrosidad() = envuelve.peligrosidad() * 0.50
}