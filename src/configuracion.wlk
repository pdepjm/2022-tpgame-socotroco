import wollok.game.*
import main.*
import direcciones.*

object cfg{
	method configurarTodo(){
		self.configurarPantalla()
		self.agregarPersonajes()
		self.configurarTeclas()
		self.configurarColisiones()
	}
	
	method configurarPantalla() {
		game.title("Piramide de Maslow")
		game.width(18)
		game.height(11)
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
		game.onCollideDo(personajeFuerte, {objeto => objeto.colisionarConPersonaje()})
		game.onCollideDo(personajeInteligente, {objeto => objeto.colisionarConPersonaje()})
	}
	
	method agregarPersonajes(){
		game.addVisual(personajeFuerte)
		game.addVisual(personajeInteligente)
	}
}