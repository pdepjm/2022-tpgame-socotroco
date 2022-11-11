import main.*
import wollok.game.*
import niveles.*

object bordes {
const paredes = [
	new Pared(position = game.at(0,9)),
	new Pared(position = game.at(1,9)),
	new Pared(position = game.at(0,-1)),
	new Pared(position = game.at(1,-1)),
	new Pared(position = game.at(2,-1)),
	new Pared(position = game.at(3,-1)),
	new Pared(position = game.at(4,-1)),
	new Pared(position = game.at(5,-1)),
	new Pared(position = game.at(6,-1)),
	new Pared(position = game.at(7,-1)),
	new Pared(position = game.at(8,-1)),
	new Pared(position = game.at(9,-1)),
	new Pared(position = game.at(10,-1)),
	new Pared(position = game.at(0,10)),
	new Pared(position = game.at(1,10)),
	new Pared(position = game.at(2,10)),
	new Pared(position = game.at(3,10)),
	new Pared(position = game.at(4,10)),
	new Pared(position = game.at(5,10)),
	new Pared(position = game.at(6,10)),
	new Pared(position = game.at(7,10)),
	new Pared(position = game.at(8,10)),
	new Pared(position = game.at(9,10)),
	new Pared(position = game.at(10,10)),
	new Pared(position = game.at(-1,0)),
	new Pared(position = game.at(-1,1)),
	new Pared(position = game.at(-1,2)),
	new Pared(position = game.at(-1,3)),
	new Pared(position = game.at(-1,4)),
	new Pared(position = game.at(-1,5)),
	new Pared(position = game.at(-1,6)),
	new Pared(position = game.at(-1,7)),
	new Pared(position = game.at(-1,8)),
	new Pared(position = game.at(-1,9)),
	new Pared(position = game.at(10,0)),
	new Pared(position = game.at(10,1)),
	new Pared(position = game.at(10,2)),
	new Pared(position = game.at(10,3)),
	new Pared(position = game.at(10,4)),
	new Pared(position = game.at(10,5)),
	new Pared(position = game.at(10,6)),
	new Pared(position = game.at(10,7)),
	new Pared(position = game.at(10,8)),
	new Pared(position = game.at(10,9))
	]
	
	
	method crear(){
		paredes.forEach({pared => pared.crear()})
		piramide.crear()
		barraDeVidas.crear()
	} 
}

object barraDeVidas inherits Objeto (position = game.at(0,9)){
	method image() = "vidas-" + gestorNiveles.vidas().toString() + "corazon.png"
}

object piramide inherits Objeto (position = game.at(1,9)){
	method image() = "nivel" + gestorNiveles.nivelActualNumero().toString() + ".png"
	
}

class Visual {
	var property image
	method position() = game.at(0,0)
	
	method mostrar(){ game.addVisual(self) }
}

const imagenInicio = new Visual(image = "pantallaInicio.png")
const imagenGanadora = new Visual(image = "imagenGanadora.png")
const imagenPerdedora = new Visual(image = "imagenPerdedora.png")