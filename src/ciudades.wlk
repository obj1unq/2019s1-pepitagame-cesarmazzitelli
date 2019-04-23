import wollok.game.*

object villaGesell {
	var property esComida = false
	
	method image() = "ciudad.png"
	method position() = game.at(8,3)
	
	method nombre() = "Villa Gesell"
}

object buenosAires {
	var property esComida = false
	
	method image() = "ciudad.png"
	method position() = game.at(1,1)
	
	method nombre() = "Buenos Aires"
}
