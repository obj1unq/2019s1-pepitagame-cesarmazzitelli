import ciudades.*
import comidas.*
import wollok.game.*

object pepita {

	var property energia = 100
	var property ciudad = buenosAires
	var property position = game.at(3, 3)
	var amiga

	method image() {
		return if (self.energia() > 100) {
			"pepita-gorda-raw.png"
		} else {
			"pepita.png"
		}
	}

	method come(comida) {
		energia = energia + comida.energia()
	}

	method volaHacia(unaCiudad) {
		if (ciudad == unaCiudad && self.position() == unaCiudad.position()) {
			game.say(self, "Ya estoy en" + unaCiudad)
		} else {
			self.volarSiPuede(unaCiudad)
		}
	}

	method volarSiPuede(unaCiudad) {
		if (self.energia() > self.energiaParaVolar(position.distance(unaCiudad.position()))) self.move(unaCiudad.position())
		ciudad = unaCiudad
	}

	method irAComidaYComer(comida) {
		self.move(comida.position())
		self.comerComida(comida)
	}

	method comerComida(comida) {
		self.come(comida)
		self.limpiarTerreno(comida)
	}

	method limpiarTerreno(comida) {
//		if(hay visual (comida)) { game.removeVisual(comida) }
//		else { "No hay mas (comida)" :( }
//		No hay una forma de comprobar si hay un visual (por ahora).
		game.removeVisual(comida)
	}

	method energiaParaVolar(distancia) = 15 + 5 * distancia

	method move(nuevaPosicion) {
		energia -= self.energiaParaVolar(position.distance(nuevaPosicion))
		self.position(nuevaPosicion)
	}

	method pepitaEngorda() {
		if (self.energia() > 100) {
		}
	}

	method nuevaAmiga(ave) {
		if (amiga != ave) game.say(self, "Hola" + ave + "!")
		amiga = ave
	}
	
	method colision(cosa) {
		cosa.darleDeComerA(self)
	}

}

object pepona {

	method image() = "pepona.png"
	method position() = game.at(2, 8)
	
	method colision(cosa) {
		cosa.darleDeComerA(self)
	}
}

object pipa {
	var property esComida = false 
	
	method image() = "pepitaCanchera.png"
	method position() = game.at(4, 8)
	
	method colision(cosa) {
		cosa.darleDeComerA(self)
	}
}

object roque {
	var property esComida = false
	var property position = game.at(3, 5)
	var property comidaGuardada = null

	method image() = "pepita1.png"

	method esComida(comida) {
		if (comida.esComida()) {
			self.guardarComida(comida)
		}
	}
	
	method guardarComida(comida) {
		if(comidaGuardada != comida) {
			self.tirarComidaGuardada()
			self.recogerComida(comida)
		}
	}

	method recogerComida(comida) {
		comidaGuardada = comida
		game.removeVisual(comida)
	}

	method tirarComidaGuardada() {
		if (comidaGuardada != null) {
			self.agregarComidaGuardada()
		}
	}
	
	method darleDeComerA(golondrina) {
		if (comidaGuardada != null) {
			golondrina.come(comidaGuardada)
			self.agregarComidaGuardada()
			self.comidaGuardada(null)
		}
	}

	method agregarComidaGuardada() {
		game.addVisualIn(comidaGuardada, game.at(1.randomUpTo(10).truncate(0), 1.randomUpTo(10).truncate(0)))
	}
}

