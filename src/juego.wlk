import wollok.game.*
import configuracion.*
import niveles.*
import main.*


object juego {
	method iniciar() {
		cfg.configurarTodo()		
		nivel1.cargarEscenario()
		game.start()
	}
}
