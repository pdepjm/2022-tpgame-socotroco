import wollok.game.*
import main.*

object gestorNiveles{
	var property nivelActual = nivel1
	
	
	
	
}

class Nivel{
	var property paredes = []
	var property placas = []
	var property puerta = null
	
	method cargarEscenario(){
		paredes.forEach({pared => pared.crear()})
		placas.forEach({placa => placa.crear()})
		if (puerta != null) game.addVisual(puerta);
	}
}

const nivel1 = new Nivel(
	 paredes = [new Pared(position = game.at(0,2)),
	 	new Pared(position = game.at(10,10)),
	 	new Pared(position = game.at(10,11)),
	 	new Pared(position = game.at(10,12)),
	 	new Pared(position = game.at(9,10)),
	 	new Pared(position = game.at(8,10)),
	 	new Pared(position = game.at(7,10)),
	 	new Pared(position = game.at(5,5))],
	 placas = [new Placa(position = game.at(0,0)), new Placa(position = game.at(1,1))],
	 puerta = new Puerta(position = game.at(15,0))
)

	//const placa1 = new Placa(position = game.at(0,0)) 
	//const placa2 = new Placa(position = game.at(1,1))