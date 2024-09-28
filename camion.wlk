import cosas.*

object camion {
    const carga = []

    method tara() = 1000
    method pesoTotal() = self.tara() + self.pesoCarga()
    method pesoCarga() = carga.sum({c => c.peso()})

    method cargar(unaCosa){carga.add(unaCosa)}
    method descargar(unaCosa){carga.remove(unaCosa)}
    method cargarVarios(cosas){carga.addAll(cosas)}

    method todosLosPesosPares() = carga.all({c => c.peso()%2 == 0})

    method hayAlgoQuePesa(unPeso) = carga.any({c => c.peso() == unPeso})

    method cosaConPeligrosidad(nivelPeligro) = carga.find({c => c.peligrosidad() == nivelPeligro})

    method cosasMasPeligrosasQue(nivelPeligro) = carga.filter({c => c.peligrosidad() > nivelPeligro})

    method cosasMasPeligrosasQueOtra(cosa) = carga.filter({c => c.peligrosidad() > cosa.peligrosidad()})

    method estaExcedidoDePeso() = self.pesoTotal() > 2500

    method puedeCircular(nivelPeligro) = !self.estaExcedidoDePeso() and self.cosasMasPeligrosasQue(nivelPeligro).isEmpty()

    method hayAlgoQuePesa(min, max) = carga.any({c => c.peso().between(min, max)})

    method laCosaMasPesada() = carga.max({c => c.peso()})
}