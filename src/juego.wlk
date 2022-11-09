import wollok.game.*
import configuracion.*
import niveles.*
import main.*
import sonido.*
import visuales.*


object juego{
	method iniciar() {
		cfg.configurarPantalla()
		imagenInicio.mostrar()
		game.schedule(5000, {gestorNiveles.nivelActual().iniciar(); gestorDeSonido.iniciar()})
		game.start()
	}
	
	method ganar(){
		game.clear()
		imagenGanadora.mostrar()
		gestorDeSonido.ganar()
		game.schedule(10000,{game.stop()})
	}
	
	method perder(){
		game.clear()
		imagenPerdedora.mostrar()
		game.schedule(5000,{gestorNiveles.volverAEmpezar()})
	}
}


