import wollok.game.*
import niveles.*
import juego.*
import direcciones.*

const musicaNivel = game.sound("musiquita.mp3")

object gestorDeSonido{
	var property activo = false
	var inicio = false
	
	method iniciar(){if(!inicio){
							musicaNivel.shouldLoop(true) 
							activo = true
							musicaNivel.play()
							inicio = true}
	}

	method activar(){
			activo = true
			musicaNivel.resume()
			}
					

	method pausar(){
		activo = false
		musicaNivel.pause()
	}
	
	method cambiar(){
		if(activo) self.pausar() else self.activar()
	}
}

class Objeto{
	var property position = null
	var property puedePisarse = true
	
	method crear(){game.addVisual(self)}
	
	method moverA(_){}
	method colisionarConPersonaje(_){}
	method esCaja() = false
}

class ObjetoMovible inherits Objeto{
	override method moverA(dir){
		const proximaPosicion = self.proximaPosicion(dir)
		if (self.puedeMoverseA(proximaPosicion)){
			position = proximaPosicion
		}
	}
	
	method puedeMoverseA(posicion) = self.todosPuedenPisarse(posicion) || self.casilleroVacio(posicion)
	
	method todosPuedenPisarse(posicion) = game.getObjectsIn(posicion).all({objeto => objeto.puedePisarse()})
	method casilleroVacio(posicion) = game.getObjectsIn(posicion).isEmpty()
	
	method proximaPosicion(dir) = dir.siguientePosicion(position)
}

class Personaje inherits ObjetoMovible{
	method pincharseCon(algo){algo.danio().times{_ => gestorNiveles.perderVida()}}
	method morir() = game.stop()
}

object personajeFuerte inherits Personaje{
	method image() = "personajeFuerte.png"
	
	override method moverA(dir){
		const proximaPosicion = self.proximaPosicion(dir)
		if (self.puedeMoverseA(proximaPosicion)){
			position = proximaPosicion
		}
		else{
			game.getObjectsIn(proximaPosicion).forEach({objeto => objeto.moverA(dir)})
		}
	}
	
}

object personajeInteligente inherits Personaje{
	method image() = "personajeInteligente.png"
	
	override method pincharseCon(algo) {if (!self.adentroDeCaja()) super(algo)}
	
	method adentroDeCaja() = game.getObjectsIn(position).any({objeto => objeto.esCaja()})
}

//const personajeFuerte = new PersonajeFuerte()
//const personajeInteligente = new PersonajeInteligente()


class Codigo inherits Objeto{
	var property activado = false
	var property image = "codigo_no_resuelto.png"
	
	var gscCounter = 0 // Cuenta la cantidad de gameSchedules corriendo al mismo tiempo
	
	override method crear(){
		self.bloquearCodigo()
		game.addVisual(self)
	}
	
	method resolverCodigo(){
		activado = true
		image = "codigo.png"
		gscCounter += 1
		game.schedule(5000, {gscCounter -= 1})
	}
	
	method image() = image
	
	method configuracionInicial(){
		gscCounter = 0
		game.onTick(15, "Desbloquear código", {if(personajeInteligente.position() == self.position()) {self.resolverCodigo()}})
		game.onTick(15, "Si gscCounter es 0 desactivar codigo", {if (gscCounter == 0) {self.bloquearCodigo()}})
	}
	
	method bloquearCodigo(){
		activado = false
		image = "codigo_no_resuelto.png"
	}
}

class Caja inherits ObjetoMovible{
	const property posicionInicial
	var property image = "caja.png"
	
	override method esCaja() = true
	override method crear(){
		self.position(posicionInicial)
		super()
	}
	
	method configuracionInicial(){
		// Tiene que ser un game ontick con intervalo muy corto por el tema de los pinches, si fuese un intervalo muy alto puede ocurrir que ocurra primero el onCollide con pinches antes que el false de la invulnerabilidad, por ende, no se pincharía cuando sí debería pincharse.
		game.onTick(10, "Chequear si tiene adentro pj inteligente",{
			if(personajeInteligente.position() == self.position()) 
				image = "cajaPersonajeInteligente.png"
			else 
				image = "caja.png"
			})
	}
	
	override method puedePisarse() = false
}

class Placa inherits Objeto{
	var property image = "placaRoja.png"
	var property activado = false;
	var property ultimoColisionador = personajeInteligente
	
	method configuracionInicial(){
		game.onCollideDo(self, {objetoSobrePlaca => ultimoColisionador = objetoSobrePlaca})
		game.onTick(15, "Consultar Activacion", { if (ultimoColisionador.position() == self.position()) {self.activar()} else {self.desactivar()}})
	}
	
	 
	method activar(){
		image = "placaVerde.png"
		activado = true
	}
	
	method desactivar(){
		image = "placaRoja.png"
		activado = false
	}
}

class Pared inherits Objeto{
	method image() = "pared.jpg"
	override method puedePisarse() = false
}


class Puerta inherits Objeto{
	var property image = "puerta_cerrada.png"
	
	method abrir(){
		image = "puerta_abierta.png"
		puedePisarse = true
	}
	
	method cerrar(){
		image = "puerta_cerrada.png"
		puedePisarse = false	
	}
}

class Pinche inherits Objeto{
	method image() = "pinches.png"
	
	method danio() = 1
	
	override method colisionarConPersonaje(personaje){
		personaje.pincharseCon(self)
	}
}

class SuperPinche inherits Pinche{
	override method danio() = 2
	
	override method image() = "superPinches.png"
}


class ObjetoGanador inherits Objeto{
	var property image
	
	override method colisionarConPersonaje(personaje){
		gestorNiveles.cargarSiguienteNivel()
	}
}

object bordes {
const paredes = [
	new Pared(position = game.at(0,9)),
	new Pared(position = game.at(1,9)),
	new Pared(position = game.at(0,-1)),
	new Pared(position = game.at(1,-1)),
	new Pared(position = game.at(2,-1)),
	new Pared(position = game.at(3,-1)),
	new Pared(position = game.at(4,-1)),
	new Pared(position = game.at(5,-1)),
	new Pared(position = game.at(6,-1)),
	new Pared(position = game.at(7,-1)),
	new Pared(position = game.at(8,-1)),
	new Pared(position = game.at(9,-1)),
	new Pared(position = game.at(10,-1)),
	new Pared(position = game.at(0,10)),
	new Pared(position = game.at(1,10)),
	new Pared(position = game.at(2,10)),
	new Pared(position = game.at(3,10)),
	new Pared(position = game.at(4,10)),
	new Pared(position = game.at(5,10)),
	new Pared(position = game.at(6,10)),
	new Pared(position = game.at(7,10)),
	new Pared(position = game.at(8,10)),
	new Pared(position = game.at(9,10)),
	new Pared(position = game.at(10,10)),
	new Pared(position = game.at(-1,0)),
	new Pared(position = game.at(-1,1)),
	new Pared(position = game.at(-1,2)),
	new Pared(position = game.at(-1,3)),
	new Pared(position = game.at(-1,4)),
	new Pared(position = game.at(-1,5)),
	new Pared(position = game.at(-1,6)),
	new Pared(position = game.at(-1,7)),
	new Pared(position = game.at(-1,8)),
	new Pared(position = game.at(-1,9)),
	new Pared(position = game.at(10,0)),
	new Pared(position = game.at(10,1)),
	new Pared(position = game.at(10,2)),
	new Pared(position = game.at(10,3)),
	new Pared(position = game.at(10,4)),
	new Pared(position = game.at(10,5)),
	new Pared(position = game.at(10,6)),
	new Pared(position = game.at(10,7)),
	new Pared(position = game.at(10,8)),
	new Pared(position = game.at(10,9))
	]
	
	
	method crear(){
		paredes.forEach({pared => pared.crear()})
		piramide.crear()
		barraDeVidas.crear()
	} 
}

object barraDeVidas inherits Objeto (position = game.at(0,9)){
	method image() = "vidas-" + gestorNiveles.vidas().toString() + "corazon.png"
}

object piramide inherits Objeto (position = game.at(1,9)){
	method image() = "nivel" + gestorNiveles.nivelActualNumero().toString() + ".png"
	
}

class Visual {
	var property image
	method position() = game.at(0,0)
	
	method mostrar(){ game.addVisual(self) }
}

const imagenInicio = new Visual(image = "pantallaInicio.png")
const imagenGanadora = new Visual(image = "imagenGanadora.png")
const imagenPerdedora = new Visual(image = "imagenPerdedora.png")