import wollok.game.*
import main.*
import direcciones.*

object juego {
	method iniciar() {
		self.hacerConfiguracionInicial()
		self.agregarPersonajes()
		self.configurarTeclas()
		self.configurarAcciones()
		self.cargarEscenario()
		self.configurarColisiones()
		game.start()
	}
	
	method cargarEscenario(){
		game.addVisual(placa)
	}
	
	method agregarPersonajes(){
		game.addVisual(personajeFuerte)
		game.addVisual(personajeInteligente)
		game.addVisual(puertaCerrada)
	}
	
	method hacerConfiguracionInicial() {
		game.title("Piramide de Maslow")
		game.width(20)
		game.height(13)
		game.cellSize(64)
		game.boardGround("fondoGris.jpg")
	}
	
	method configurarTeclas() {
		keyboard.w().onPressDo({personajeFuerte.moverA(arriba)})
		keyboard.s().onPressDo({personajeFuerte.moverA(abajo)})
		keyboard.a().onPressDo({personajeFuerte.moverA(izquierda)})
		keyboard.d().onPressDo({personajeFuerte.moverA(derecha)})
		
		keyboard.up().onPressDo({personajeInteligente.moverA(arriba)})
		keyboard.down().onPressDo({personajeInteligente.moverA(abajo)})
		keyboard.left().onPressDo({personajeInteligente.moverA(izquierda)})
		keyboard.right().onPressDo({personajeInteligente.moverA(derecha)})
	}

	method configurarColisiones(){
		game.onCollideDo(personajeFuerte, {unObjeto => unObjeto.colisionarConPersonaje()})
		game.onCollideDo(personajeInteligente, {unObjeto => unObjeto.colisionarConPersonaje()})
	}

	method configurarAcciones() {
		//TODO: Self-generated code
	}	
}
