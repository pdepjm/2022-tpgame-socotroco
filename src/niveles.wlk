import wollok.game.*
import main.*

object gestorNiveles{
	var property nivelActual = nivel1
	
	
	
	
}

class Nivel{
	const pared1 = new Pared(position = game.at(0,0))
	
	method cargarEscenario(){
		game.addVisual(pared1)
	}
}

object nivel1{
	
	const placa1 = new Placa(position = game.at(0,0))
	const placa2 = new Placa(position = game.at(1,1))
	
	method cargarEscenario(){
		game.addVisual(placa1)
		
		
		game.addVisual(placa2)
		
			
		
	}
}