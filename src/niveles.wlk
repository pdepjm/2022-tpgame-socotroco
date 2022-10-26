import wollok.game.*
import main.*
import configuracion.*

const barraDeVidas = new BarraDeVidas(position = game.at(0,9),vidas=3)

object gestorNiveles{
	var property nivelActual = nivel1
	var property vidas = 3
	
	method perderVida(){
		nivelActual.reiniciarse()
		barraDeVidas.perderCorazon()	
	}
	
	method cargarSiguienteNivel(){
		if(nivelActual.siguienteNivel() == null) game.stop()
		else{
			nivelActual = nivelActual.siguienteNivel()
			game.clear()
			nivelActual.configuracionInicial()
		}
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
		bordes.crear()
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
		
	 paredes = [
	 	new Pared(position = game.at(2,9)),
	 	new Pared(position = game.at(3,9)),
	 	new Pared(position = game.at(4,9)),
	 	new Pared(position = game.at(4,8)), 
	 	new Pared(position = game.at(4,7)), 
	 	new Pared(position = game.at(4,6)),  
	 	new Pared(position = game.at(7,0)),
	 	new Pared(position = game.at(7,1)),  
	 	new Pared(position = game.at(7,2)),  
	 	new Pared(position = game.at(9,2))
	 ],
	 	
	 codigos = [new Codigo(position = game.at(3,0)),new Codigo(position = game.at(0,3))],	
	  
	 placas = [new Placa(position = game.at(9,4)),new Placa(position = game.at(7,9))],
	 
	 puerta = new Puerta(position = game.at(8,2)),
	 
	 cajas = [new Caja(posicionInicial = game.at(2,6), position = game.at(2,6))],
	 
	 objetoGanador = new ObjetoGanador(position = game.at(8,0), image = "comida.png"),
	 
	 pinches = [
	 	new Pinche(position = game.at(6,9)),
	 	new Pinche(position = game.at(6,8)),
	 	new Pinche(position = game.at(7,8)),
	 	new Pinche(position = game.at(8,8)),
	 	new Pinche(position = game.at(8,9)),
	 	new Pinche(position = game.at(3,2)),
	 	new SuperPinche(position = game.at(0,2)),
	 	new SuperPinche(position = game.at(2,0))
	 ],
	 
	 posInicialFuerte = game.at(3,3),
	 posInicialInteligente = game.at(6,5)
)



const nivel2 = new Nivel(
	 siguienteNivel = nivel3,
		
	 paredes = [
	 	new Pared(position = game.at(1,8)),
	 	new Pared(position = game.at(7,0)),
	 	new Pared(position = game.at(7,1)),  
	 	new Pared(position = game.at(7,2)),  
	 	new Pared(position = game.at(9,2))
	 ],
	 	
	 codigos = [new Codigo(position = game.at(0,7)),new Codigo(position = game.at(3,0)),new Codigo(position = game.at(6,7))],	
	  
	 placas = [new Placa(position = game.at(6,9)), new Placa(position = game.at(9,3)), new Placa(position = game.at(6,0))],
	 
	 puerta = new Puerta(position = game.at(8,2)),
	 
	 cajas = [new Caja(posicionInicial = game.at(3,6), position = game.at(3,6)), new Caja(posicionInicial = game.at(6,8), position = game.at(6,8))],
	 
	 objetoGanador = new ObjetoGanador(position = game.at(8,0), image = "familia.png"),
	 
	 pinches = [
	 	new Pinche(position = game.at(1,7)),
	 	new Pinche(position = game.at(1,6)),
	 	new Pinche(position = game.at(2,6)),
	 	new Pinche(position = game.at(4,6)),
	 	new Pinche(position = game.at(5,6)),
	 	new Pinche(position = game.at(5,7)),
	 	new Pinche(position = game.at(5,8)),
	 	new Pinche(position = game.at(6,6)),
	 	new Pinche(position = game.at(1,1)),
	 	new Pinche(position = game.at(1,0)),
		new Pinche(position = game.at(2,0))
	 ],
	 
	 posInicialFuerte = game.at(3,8),
	 posInicialInteligente = game.at(0,0)
)


const nivel3 = new Nivel(
	 siguienteNivel = nivel5,
		
	 paredes = [
	 	new Pared(position = game.at(2,4)),
	 	new Pared(position = game.at(3,4)),
	 	new Pared(position = game.at(4,4)),  
	 	new Pared(position = game.at(5,4)),  
	 	new Pared(position = game.at(0,2)),
	 	new Pared(position = game.at(2,2)),
	 	new Pared(position = game.at(2,1)),
	 	new Pared(position = game.at(2,0)),
	 	new Pared(position = game.at(1,5)),
	 	new Pared(position = game.at(6,6)),
	 	new Pared(position = game.at(7,8)),
	 	new Pared(position = game.at(6,3)),
	 	new Pared(position = game.at(9,5)),
	 	new Pared(position = game.at(8,0)),
	 	new Pared(position = game.at(9,5)),
	 	new Pared(position = game.at(5,7))
	 	
	 ],
	 	
	 codigos = [new Codigo(position = game.at(9,2))],	
	  
	 placas = [new Placa(position = game.at(2,9)), 
	 	new Placa(position = game.at(9,9)), 
	 	new Placa(position = game.at(9,4)), 
	 	new Placa(position = game.at(8,7))
	 ],
	 
	 puerta = new Puerta(position = game.at(1,2)),
	 
	 cajas = [new Caja(posicionInicial = game.at(3,5), position = game.at(3,5)), 
	 	new Caja(posicionInicial = game.at(9,7), position = game.at(9,7)), 
	 	new Caja(posicionInicial = game.at(8,6), position = game.at(8,6)), 
	 	new Caja(posicionInicial = game.at(8,8), position = game.at(8,8)),
	 	new Caja(posicionInicial = game.at(7,1), position = game.at(7,1))
	 ],

	 objetoGanador = new ObjetoGanador(position = game.at(0,0), image = "amigos.png"),
	 
	 pinches = [
	 	new Pinche(position = game.at(3,0)),
	 	new Pinche(position = game.at(3,1)),
	 	new Pinche(position = game.at(3,2)),   
	 	new Pinche(position = game.at(6,0)),
	 	new Pinche(position = game.at(4,2)),
	 	new Pinche(position = game.at(5,2)),
	 	new Pinche(position = game.at(6,2)),
	 	new Pinche(position = game.at(7,3)),
	 	new Pinche(position = game.at(9,3)),
	 	new Pinche(position = game.at(9,1)),
	 	new Pinche(position = game.at(9,0))
	 ],
	 
	 posInicialFuerte = game.at(3,8),
	 posInicialInteligente = game.at(4,1)
)

const nivel4 = new Nivel(
	 siguienteNivel = nivel5,
		
	 paredes = [
	 	new Pared(position = game.at(2,9)), 
		new Pared(position = game.at(2,8)), 
		new Pared(position = game.at(1,6)), 
		new Pared(position = game.at(2,6)),
		new Pared(position = game.at(1,5)), 
		new Pared(position = game.at(1,4)), 
		new Pared(position = game.at(1,3)),
		new Pared(position = game.at(1,2)),
		new Pared(position = game.at(2,2)),
		new Pared(position = game.at(0,0)),
		new Pared(position = game.at(4,2)),  
		new Pared(position = game.at(4,3)),  
		new Pared(position = game.at(5,3)),  
		new Pared(position = game.at(6,2)),  
		new Pared(position = game.at(6,3)),
		new Pared(position = game.at(6,0)),  
		new Pared(position = game.at(7,3)),
		new Pared(position = game.at(7,7)),
		new Pared(position = game.at(7,8)),  
		new Pared(position = game.at(7,9)),    
		new Pared(position = game.at(9,3)), 
		new Pared(position = game.at(9,7))    
	 ],
	 	
	 codigos = [new Codigo(position = game.at(0,2)),new Codigo(position = game.at(1,8))],	
	  
	 placas = [new Placa(position = game.at(1,0)),new Placa(position = game.at(3,2)), new Placa(position = game.at(5,1)), new Placa(position = game.at(7,2))],
	 
	 puerta = new Puerta(position = game.at(8,7)),
	 
	 cajas = [
	 	new Caja(posicionInicial = game.at(1,7), position = game.at(1,7)),
	 	new Caja(posicionInicial = game.at(3,4), position = game.at(3,4)),
	 	new Caja(posicionInicial = game.at(8,3), position = game.at(8,3)),
	 	new Caja(posicionInicial = game.at(7,1), position = game.at(7,1))
	 ],
	 
	 objetoGanador = new ObjetoGanador(position = game.at(9,9), image = "dinero.png"),
	 
	 pinches = [
	 	new Pinche(position = game.at(2,3)),
	 	new Pinche(position = game.at(3,3)),
	 	new Pinche(position = game.at(6,1)),
	 	new SuperPinche(position = game.at(4,1)),
	 	new SuperPinche(position = game.at(5,2))
	 ],
	 
	 posInicialFuerte = game.at(5,8),
	 posInicialInteligente = game.at(4,8)
)


const nivel5 = new Nivel(
	 siguienteNivel = null,
		
	 paredes = [
	 	new Pared(position = game.at(1,9)), 
		new Pared(position = game.at(1,8)),
		new Pared(position = game.at(2,8)),
		new Pared(position = game.at(0,6)),
		new Pared(position = game.at(1,6)),
		new Pared(position = game.at(2,6)),
		new Pared(position = game.at(4,6)),
		new Pared(position = game.at(6,8)),
		new Pared(position = game.at(6,6)),
		new Pared(position = game.at(7,7)),
		new Pared(position = game.at(4,8)),
		new Pared(position = game.at(2,1)),
		new Pared(position = game.at(4,3)),
		new Pared(position = game.at(4,1)),
		new Pared(position = game.at(4,3)),
		new Pared(position = game.at(5,3)),
		new Pared(position = game.at(2,3)),
		new Pared(position = game.at(8,7)),
		new Pared(position = game.at(6,5)),
		new Pared(position = game.at(7,5)),
		new Pared(position = game.at(8,5)),
		new Pared(position = game.at(2,0)),
		new Pared(position = game.at(7,0)),
		new Pared(position = game.at(7,1)),
		new Pared(position = game.at(6,3)),
		new Pared(position = game.at(7,3)),
		new Pared(position = game.at(4,4)),
		new Pared(position = game.at(5,2)),
		new Pared(position = game.at(9,1))
	 ],
	 	
	 codigos = [new Codigo(position = game.at(7,9)),new Codigo(position = game.at(7,6))],	
	  
	 placas = [new Placa(position = game.at(4,2)),new Placa(position = game.at(0,5))],
	 
	 puerta = new Puerta(position = game.at(8,1)),
	 
	 cajas = [
	 	new Caja(posicionInicial = game.at(4,7), position = game.at(4,7)),
	 	new Caja(posicionInicial = game.at(4,9), position = game.at(4,9)),
	 	new Caja(posicionInicial = game.at(1,2), position = game.at(1,2)),
	 	new Caja(posicionInicial = game.at(7,4), position = game.at(7,4))
	 ],
	 
	 objetoGanador = new ObjetoGanador(position = game.at(9,0), image = "nota.png"),
	 
	 pinches = [
	 	new Pinche(position = game.at(2,9)),
	 	new Pinche(position = game.at(6,9)),
	 	new Pinche(position = game.at(3,2)),
	 	new SuperPinche(position = game.at(9,7)),
	 	new SuperPinche(position = game.at(9,9))
	 ],
	 
	 posInicialFuerte = game.at(0,8),
	 posInicialInteligente = game.at(2,2)
)
