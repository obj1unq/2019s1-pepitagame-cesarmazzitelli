import wollok.game.*

object villaGesell {
	
	var property esComida = false
	
	method image() = "ciudad.png"
	method position() = game.at(8,3)
	
	method nombre() = "Villa Gesell"
	
	method colision(cosa) {
		//No hace nada.
	}
}

object buenosAires {
	
	var property esComida = false
	
	method image() = "ciudad.png"
	method position() = game.at(1,1)
	
	method nombre() = "Buenos Aires"
	
	method colision(cosa) {
		//No hace nada.
	}
}
