import wollok.game.*
import niveles.*
import direcciones.*

class Objeto{
	var property position = null
	var property puedePisarse = true
	
	method crear(){game.addVisual(self)}
	
	method moverA(_){}
	method colisionarConPersonaje(_){}
	method esCaja() = false
	method mismaPosicionQue(otroObjeto) = self.position() == otroObjeto.position()
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
		game.onTick(15, "Desbloquear código", {if(personajeInteligente.mismaPosicionQue(self)) {self.resolverCodigo()}})
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
		game.onTick(10, "Chequear si tiene adentro pj inteligente",{
			if(personajeInteligente.mismaPosicionQue(self)) 
				image = "cajaPersonajeInteligente.png"
			else 
				image = "caja.png"
			})
	}
	
	override method puedePisarse() = false
}

class Placa inherits Objeto{
	var property image = "placaRoja.png"
	var property activado = false
	
	method configuracionInicial(){
		game.onTick(15, "Consultar Activacion", { if (game.getObjectsIn(position).size() > 1) {self.activar()} else {self.desactivar()}})
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