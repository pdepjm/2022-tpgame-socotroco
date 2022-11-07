import wollok.game.*
import configuracion.*
import niveles.*
import main.*
import nivel1.*

object juego {
	method iniciar() {
		gestorNiveles.nivelActual().iniciar()
		cfg.configurarPantalla()
		game.start()
	}
	
	method ganar(){
		game.clear()
		game.addVisual(imagenGanadora)
		game.schedule(15000,{game.stop()})
	}
	
	method perder(){
		game.clear()
		game.addVisual(imagenPerdedora)
		game.schedule(5000,{gestorNiveles.volverAEmpezar()})
	}
}


