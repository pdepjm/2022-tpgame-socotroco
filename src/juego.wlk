import wollok.game.*
import configuracion.*
import niveles.*
import main.*


object juego {
	method iniciar() {
		gestorNiveles.nivelActual().configuracionInicial()
		cfg.configurarPantalla()
		game.start()
	}
	
	method ganarJuego(){
		// Mostrar en pantalla imagen ganadora
		imagenGanadora.crear()
		//game.schedule(5000,{game.stop()})
	}
	
}


