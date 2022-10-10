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
}
