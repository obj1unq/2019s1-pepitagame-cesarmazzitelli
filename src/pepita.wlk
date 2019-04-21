import ciudades.*
import comidas.*
import wollok.game.*

object pepita {
	var property energia = 100
	var property ciudad = buenosAires 
	var property position = game.at(3,3)
	
	method image() {
		return if(self.energia() > 100) {	"pepita-gorda-raw.png"	}
			   else {	"pepita.png"	}
	}

	method come(comida) {
		energia = energia + comida.energia()
	}
	
	method volaHacia(unaCiudad) {
		if (ciudad != unaCiudad) {
			self.move(unaCiudad.position())
			ciudad = unaCiudad
		}
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
	}

	method energiaParaVolar(distancia) = 15 + 5 * distancia

	method move(nuevaPosicion) {
		energia -= self.energiaParaVolar(position.distance(nuevaPosicion))
		self.position(nuevaPosicion)
	}
	
	method pepitaEngorda() {
		if(self.energia() > 100) {	}
	}
}
