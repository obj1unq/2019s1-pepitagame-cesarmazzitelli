import wollok.game.*

object manzana {
	
	var property esComida = true
	
	method image() = "manzana.png"
	method position() = game.at(5,1)
	
	method energia() = 80
	
	method colision(cosa) {
		cosa.recogerComida(self)
	}
}

object alpiste {
	
	var property esComida = true
	
	method image() = "alpiste.png"
	method position() = game.at(5,5)
	
	method energia() = 5
	
	method colision(cosa) {
		cosa.recogerComida(self)
	}
}
