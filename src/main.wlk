import wollok.game.*
import niveles.*

class Objeto{
	var property position = null
	var property puedePisarse = true
	
	method crear() = game.addVisual(self)
	
	method moverA(_){}
	method colisionarConPersonaje(_){}
	method esCaja() = false
}

class ObjetoMovible inherits Objeto{
	override method moverA(dir){
		if (self.puedeMoverseA(dir)){
			position = dir.siguientePosicion(position)
		}
	}
	
	method puedeMoverseA(dir) = game.getObjectsIn(self.siguientePosicion(dir)).all({objeto => objeto.puedePisarse()}) || game.getObjectsIn(self.siguientePosicion(dir)).isEmpty()	
	
	method siguientePosicion(dir) = dir.siguientePosicion(position)	
}

class Personaje inherits ObjetoMovible{
	method pincharse(){gestorNiveles.perderVida()}
	method morir() = game.stop()
}

class PersonajeFuerte inherits Personaje{
	method image() = "orc.png"
	
	override method moverA(dir){
		if (self.puedeMoverseA(dir)){
			position = dir.siguientePosicion(position)
		}
		else{
			game.getObjectsIn(self.siguientePosicion(dir)).forEach({objeto => objeto.moverA(dir)})
		}
	}
	
}

class PersonajeInteligente inherits Personaje{
	method image() = "SeñorPepino.png"
	
	override method pincharse() {if (game.getObjectsIn(position).any({objeto => objeto.esCaja()})) {} else {super()}}
}

const personajeFuerte = new PersonajeFuerte()
const personajeInteligente = new PersonajeInteligente()


class Codigo inherits Objeto{
	var property activado = false
	var property image = "codigo_no_resuelto.png"
	
	var gscCounter = 0 // Cuenta la cantidad de gameSchedules corriendo al mismo tiempo
	
	method resolverCodigo(){
		activado = true
		image = "codigo.png"
		gscCounter += 1
		game.schedule(5000, {gscCounter -= 1})
	}
	
	method image() = image
	
	method configuracionInicial(){
		game.onTick(25, "Desbloquear código", {if(personajeInteligente.position() == self.position()) {self.resolverCodigo()}})
		game.onTick(25, "Si gscCounter es 0 desactivar codigo", {if (gscCounter == 0) {self.bloquearCodigo()} else {}})
	}
	
	method bloquearCodigo(){
		activado = false
		image = "codigo_no_resuelto.png"
	}
}

class Caja inherits ObjetoMovible{
	override method esCaja() = true
	override method puedePisarse() = false
	
	method image() = "caja.png"
}

class Placa inherits Objeto{
	var property image = "placaRoja.png"
	var property activado = false;
	var property ultimoColisionador = personajeInteligente
	
	method configuracionInicial(){
		game.onCollideDo(self, {objetoSobrePlaca => ultimoColisionador = objetoSobrePlaca})
		game.onTick(25, "Consultar Activacion", { if (ultimoColisionador.position() == self.position()) {self.activar()} else {self.desactivar()}})
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
	method image() = "Pinches.png"
	
	override method colisionarConPersonaje(personaje){
		personaje.pincharse()
	}
}

class ObjetoGanador inherits Objeto{ //Objeto para pasar al nivel 2
	var property image
	
	override method colisionarConPersonaje(personaje){
		game.say(personaje,"Pasé de nivel!")
		game.schedule(3000, { gestorNiveles.cargarSiguienteNivel()})
	}
}

class BarraDeVidas inherits Objeto{
	var property vidas
	
	method image() = "vidas-" + self.vidas().toString() + "corazon.png"
	
	method perderCorazon(){
		if(vidas == 1)
		{
			game.stop()}else{
				vidas -= 1
		}
	} 
}

