import wollok.game.*
import niveles.*

class Objeto{
	var property position = null
	var property puedePisarse = false
	
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
	override method puedePisarse() = true
	method pincharse() = self.morir()
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
	
	override method pincharse() = if (game.getObjectsIn(position).any({objeto => objeto.esCaja()})) {} else {super()}
}

const personajeFuerte = new PersonajeFuerte()
const personajeInteligente = new PersonajeInteligente()


object objetoGenerico{
	var property position = game.at(100,100)
	
	method image() = ""
	
	method moverA(dir){}
	
}

class Codigo inherits Objeto{
	var property resuelto = false
	var property image = "codigo_no_resuelto.png"
	var property ultimoColisionador = objetoGenerico
	
	var gscCounter = 0 // Cuenta la cantidad de gameSchedules corriendo al mismo tiempo
	
	override method puedePisarse() = true
	
	method resolverCodigo(){
		resuelto = true
		image = "codigo.png"
		gscCounter += 1
		game.schedule(5000, {gscCounter -= 1})
	}
	
	method image() = image
	
	method configuracionInicial(){
		game.onCollideDo(self, {objetoSobreCodigo => ultimoColisionador = objetoSobreCodigo})
		game.onTick(25, "Desbloquear código", {if(ultimoColisionador == personajeInteligente && ultimoColisionador.position() == self.position()) {self.resolverCodigo()}})
		game.onTick(25, "Si gscCounter es 0 desactivar codigo", {if (gscCounter == 0) {self.bloquearCodigo()} else {}})
	}
	
	method bloquearCodigo(){
		resuelto = false
		ultimoColisionador = objetoGenerico
		image = "codigo_no_resuelto.png"
	}
}

class Caja inherits ObjetoMovible{
	override method esCaja() = true
	
	method image() = "caja.png"
}

class Placa inherits Objeto{
	var property image = "placaRoja.png"
	var property activada = false;
	var property ultimoColisionador = personajeInteligente
	
	override method puedePisarse() = true
	
	method configuracionInicial(){
		game.onCollideDo(self, {objetoSobrePlaca => ultimoColisionador = objetoSobrePlaca})
		game.onTick(25, "Consultar Activacion", { if (ultimoColisionador.position() == self.position()) {self.activarPlaca()} else {self.desactivarPlaca()}})
	}
	
	 
	method activarPlaca(){
		image = "placaVerde.png"
		activada = true
	}
	
	method desactivarPlaca(){
		image = "placaRoja.png"
		activada = false
	}	
}

class Pared inherits Objeto{
	var property image = "pared.jpg"
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
	override method puedePisarse() = true
	
	method image() = "Pinches.png"
	
	override method colisionarConPersonaje(personaje){
		personaje.pincharse()
	}
}

class ObjetoGanador inherits Objeto{ //Objeto para pasar al nivel 2
	var property image

	override method puedePisarse() = true
	
	override method colisionarConPersonaje(personaje){
		game.say(personaje,"Pasé de nivel!")
		game.schedule(3000, { gestorNiveles.cargarSiguienteNivel()})
	}
}
