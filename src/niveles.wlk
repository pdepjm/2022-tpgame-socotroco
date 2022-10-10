import wollok.game.*
import main.*
import configuracion.*

object gestorNiveles{
	var property nivelActual = nivel1
	
	method cargarSiguienteNivel(){
		nivelActual = nivelActual.siguienteNivel()
		game.clear()
		nivelActual.configuracionInicial()
	}
	
	
}

class Nivel{
	var property paredes = []
	var property placas = []
	var property puerta = null
	var property siguienteNivel
	
	method configuracionInicial(){
		self.cargarEscenario()
		game.onTick(100,"verificar abrir puerta", {if (self.requisitosCumplidos()) {puerta.abrir()} else {puerta.cerrar()}})
	}
	
	method cargarEscenario(){
		cfg.configurarPersonajes()
		self.crearYConfigurarObjetos()
	}
	
	method crearYConfigurarObjetos(){
		paredes.forEach({pared => pared.crear()})
		placas.forEach({placa => placa.crear()})
		placas.forEach({placa => placa.configuracionInicial()}) // por el tema del ontick de cada placa
		game.addVisual(puerta)
	}
	
	
	method requisitosCumplidos() = 
		placas.all({placa => placa.activada()}) // y también agregar si están todos los códigos desbloqueados
}

const nivel1 = new Nivel(
	siguienteNivel = nivel2,
	 paredes = [new Pared(position = game.at(0,2)),
	 	new Pared(position = game.at(10,10)),
	 	new Pared(position = game.at(10,11)),
	 	new Pared(position = game.at(10,12)),
	 	new Pared(position = game.at(9,10)),
	 	new Pared(position = game.at(8,10)),
	 	new Pared(position = game.at(7,10)),
	 	new Pared(position = game.at(5,5))],
	 placas = [new Placa(position = game.at(0,0))],
	 puerta = new Puerta(position = game.at(15,0))
)

const nivel2 = new Nivel(
	siguienteNivel = nivel2,
	 paredes = [new Pared(position = game.at(0,2)),
	 	new Pared(position = game.at(10,10)),
	 	new Pared(position = game.at(10,11)),
	 	new Pared(position = game.at(10,12))],
	 placas = [new Placa(position = game.at(0,0)), new Placa(position = game.at(1,1))],
	 puerta = new Puerta(position = game.at(15,0))
)

	//const placa1 = new Placa(position = game.at(0,0)) 
	//const placa2 = new Placa(position = game.at(1,1))