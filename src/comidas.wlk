import wollok.game.*

class Alpiste {
	var property granitos = 5
	var property position
	
	method image() = "alpiste.png"
	
	method energia() = granitos * 0.5

	method chocasteConPajaro() {}
}

const alpiste = new Alpiste()
const alpisteBis = new Alpiste()

class Manzana {
	var property position 
	
	method image() = "manzana.png"
	
	method energia() = 80
	
	method chocasteConPajaro() {}
}

const manzana = new Manzana()

