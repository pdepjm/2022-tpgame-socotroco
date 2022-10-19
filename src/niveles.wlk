import wollok.game.*
import main.*
import configuracion.*

const barraDeVidas = new BarraDeVidas(position = game.at(10,0),vidas=3)

object gestorNiveles{
	var property nivelActual = nivel1
	var property vidas = 3
	
	method perderVida(){
		nivelActual.reiniciarse()
		barraDeVidas.perderCorazon()	
	}
	
	method cargarSiguienteNivel(){
		nivelActual = nivelActual.siguienteNivel()
		game.clear()
		nivelActual.configuracionInicial()
	}

}

class Nivel{
	var property paredes = []
	var property placas = []
	var property cajas = []
	var property puerta = null
	var property codigos = []
	var property objetoGanador = null
	var property pinches = []
	var property siguienteNivel = null
	
	var property posInicialFuerte
	var property posInicialInteligente
	
	method reiniciarse(){
		game.clear()
		self.configuracionInicial()
	}
	
	method configuracionInicial(){
		self.cargarEscenario()
		game.onTick(50,"verificar abrir puerta", {if (self.requisitosCumplidos()) {puerta.abrir()} else {puerta.cerrar()}})
	}
	
	method cargarEscenario(){
		cfg.configurarPersonajes()
		self.crearYConfigurarObjetos()
		game.addVisual(barraDeVidas)
	}
	
	method crearYConfigurarObjetos(){
		self.crearTodos(paredes + codigos + cajas + pinches + placas + [puerta] + [objetoGanador])
		self.configurarTodos(placas + codigos)
		
		personajeInteligente.position(posInicialInteligente)
		personajeFuerte.position(posInicialFuerte)
	}
	
	method crearTodos(listaObjetos){
		listaObjetos.forEach({objeto => objeto.crear()})
	}
	
	method configurarTodos(listaObjetos){
		listaObjetos.forEach({objeto => objeto.configuracionInicial()})
	}
	
		
	method requisitosCumplidos() = 
		(placas + codigos).all({objetos => objetos.activado()})
		
}

const nivel1 = new Nivel(
	 siguienteNivel = nivel2,
		
	 paredes = [new Pared(position = game.at(2,2)), new Pared(position = game.at(1,1)), new Pared(position = game.at(2,1)), new Pared(position = game.at(4,2)), new Pared(position = game.at(5,2)), new Pared(position = game.at(6,2)),new Pared(position = game.at(4,1)),new Pared(position = game.at(8,1)),new Pared(position = game.at(2,0)),new Pared(position = game.at(1,0)),new Pared(position = game.at(0,0)),new Pared(position = game.at(0,1)),new Pared(position = game.at(0,2)),new Pared(position = game.at(0,3)),new Pared(position = game.at(0,4)),new Pared(position = game.at(0,5)),new Pared(position = game.at(0,6)),new Pared(position = game.at(1,6)),new Pared(position = game.at(2,6)),new Pared(position = game.at(3,6)),new Pared(position = game.at(4,6)),new Pared(position = game.at(2,3)),new Pared(position = game.at(2,4)),new Pared(position = game.at(3,3)),new Pared(position = game.at(3,4)),new Pared(position = game.at(4,3)),new Pared(position = game.at(5,3)),new Pared(position = game.at(6,3)),new Pared(position = game.at(6,4)),new Pared(position = game.at(6,5)),new Pared(position = game.at(6,6)),new Pared(position = game.at(3,7)),new Pared(position = game.at(3,8)),new Pared(position = game.at(0,0)),new Pared(position = game.at(8,7)),new Pared(position = game.at(8,8)),new Pared(position = game.at(8,9)),new Pared(position = game.at(10,7))],
	 	
	 codigos = [new Codigo(position = game.at(0,7))],	
	  
	 placas = [new Placa(position = game.at(7,2))],
	 
	 puerta = new Puerta(position = game.at(9,7)),
	 
	 cajas = [new Caja(position = game.at(8,5))],
	 
	 objetoGanador = new ObjetoGanador(position = game.at(9,9), image = "pancho.png"),
	 
	 pinches = [new Pinche(position = game.at(8,3))],
	 
	 posInicialFuerte = game.center().left(1),
	 posInicialInteligente = game.center().right(1)
)

const nivel2 = new Nivel(
	 siguienteNivel = nivel1,
	 paredes = [new Pared(position = game.at(0,2)),
	 	new Pared(position = game.at(10,10)),
	 	new Pared(position = game.at(10,11)),
	 	new Pared(position = game.at(10,12))],
	 placas = [new Placa(position = game.at(0,0)), new Placa(position = game.at(1,1))],
	 puerta = new Puerta(position = game.at(15,0)),
	 cajas = [new Caja(position = game.at(5,5))],
	 codigos = [new Codigo(position = game.at(2,2))],
	 objetoGanador = new ObjetoGanador(position = game.at(10,9), image = "botellaAgua.png"),
	 pinches = [new Pinche(position = game.at(8,3))],
	 posInicialFuerte = game.center().left(1),
	 posInicialInteligente = game.center().right(1)
)