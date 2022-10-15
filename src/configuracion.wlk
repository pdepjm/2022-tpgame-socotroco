import wollok.game.*
import main.*
import direcciones.*

object cfg{
	method configurarPantalla() {
		game.title("Piramide de Maslow")
		game.width(11)
		game.height(10)
		game.cellSize(64)
		game.boardGround("fondoGris.jpg")
	}
	
	method configurarPersonajes(){
		self.agregarPersonajes()
		self.configurarColisiones()
		self.configurarTeclas()
	}
	
	
	method agregarPersonajes(){
		game.addVisual(personajeFuerte)
		game.addVisual(personajeInteligente)
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
		game.onCollideDo(personajeFuerte, {objeto => objeto.colisionarConPersonaje(personajeFuerte)})
		game.onCollideDo(personajeInteligente, {objeto => objeto.colisionarConPersonaje(personajeInteligente)})
	}
}