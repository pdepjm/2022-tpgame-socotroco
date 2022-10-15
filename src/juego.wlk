import wollok.game.*
import configuracion.*
import niveles.*

object juego {
	method iniciar() {
		gestorNiveles.nivelActual().configuracionInicial()
		cfg.configurarPantalla()
		game.start()
	}
}
