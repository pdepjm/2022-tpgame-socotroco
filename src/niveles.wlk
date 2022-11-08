import wollok.game.*
import main.*
import configuracion.*
import nivel1.*
import nivel2.*
import nivel3.*
import nivel4.*
import nivel5.*
import juego.*

object gestorNiveles{
	var property nivelActualNumero = 1
	var property nivelActual = nivel1
	var property vidas = 3
	
	method ultimoNivel() = self.nivelActual().siguienteNivel() == null
	
	method perderVida(){
		if (vidas == 1) juego.perder() 
		else {
			vidas -= 1
			nivelActual.iniciar()
		}
	}
	
	method cargarSiguienteNivel(){
		if(!self.ultimoNivel()){
			nivelActual = nivelActual.siguienteNivel()
			nivelActualNumero++
			vidas = 3
			
			nivelActual.iniciar()	
		}
		else{
			juego.ganar()
		}
		
	}
	
	method volverAEmpezar(){
		vidas = 3
		nivelActual = nivel1
		nivelActualNumero = 1
		
		nivelActual.iniciar()
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
	
	method iniciar(){
		self.cargarEscenario()
		gestorDeSonido.iniciar()
		game.onTick(25,"verificar abrir puerta", {if (self.requisitosCumplidos()) {puerta.abrir()} else {puerta.cerrar()}})
	}
	
	method cargarEscenario(){
		game.clear()
		self.crearYConfigurarObjetos()
		cfg.configurarPersonajes()
		self.crearTodos(cajas) // Las cajas las creo después de crear los personajes así el personaje inteligente se puede meter a dentro de la caja
	}
	
	method crearYConfigurarObjetos(){
		self.crearTodos(paredes + codigos + pinches + placas + [puerta] + [objetoGanador] + [bordes])
		self.configurarTodos(placas + codigos + cajas)
		
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
		(placas + codigos).all({placaCodigo => placaCodigo.activado()})
}