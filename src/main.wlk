import wollok.game.*
import niveles.*

class Objeto{
	var property position
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
	method puedePisarse() = true
	
	method pincharse() = self.morir()
	
	method morir() = game.stop()
	//method colisionarConPersonaje(personaje){}
	
	//method siguientePosicion(dir) = dir.siguientePosicion(position)
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

const personajeFuerte = new PersonajeFuerte(position = game.center().left(1))
const personajeInteligente = new PersonajeInteligente(position = game.center().right(1))


object objetoGenerico{
	var property position = game.at(100,100)
	
	method image() = ""
	
	method moverA(dir){}
	
}

class Codigo inherits Objeto{
	
	var property puedePisarse = true
	var property resuelto = false
	var property image = "codigo_no_resuelto.png"
	var property ultimoColisionador = objetoGenerico
	
	
	method resolverCodigo(){
		resuelto = true
		image = "codigo.png"
		game.schedule(5000,{self.bloquearCodigo()})
	}
	
	method image() = image
	
	method configuracionInicial(){
		game.onCollideDo(self, {objetoSobreCodigo => ultimoColisionador = objetoSobreCodigo})
		game.onTick(25, "Desbloquear código", {if(ultimoColisionador == personajeInteligente && ultimoColisionador.position() == self.position()) {self.resolverCodigo()}})
	}
	
	method bloquearCodigo(){
		resuelto = false
		ultimoColisionador = objetoGenerico
		image = "codigo_no_resuelto.png"
	}
	
}

class Caja inherits ObjetoMovible{
	method puedePisarse() = false
	
	override method esCaja() = true
	
	method image() = "caja.png"
}

class Placa inherits Objeto{
	var property image = "placaRoja.png"
	var property activada = false;
	var property ultimoColisionador = personajeInteligente
	var property puedePisarse = true
	
	method configuracionInicial(){
		game.onCollideDo(self, {objetoSobrePlaca => ultimoColisionador = objetoSobrePlaca})
		game.onTick(25, "Consultar Activacion", { if (ultimoColisionador.position() == self.position()) {self.activarPlaca()} else {self.desactivarPlaca()}})
	}
	
	 
	method activarPlaca(){
		image = "placaVerde.png";
		activada = true;
	}
	
	method desactivarPlaca(){
		image = "placaRoja.png";
		activada = false;
	}	
}

class Pared inherits Objeto{
	var property image = "pared.jpg"
	var property puedePisarse = false
}


class Puerta inherits Objeto{
	var property image = "puerta_cerrada.png"
	
	var property abierta = false;
	var property puedePisarse = false
	
	method abrir(){
		if (!abierta){
			abierta = true
			image = "puerta_abierta.png"
			puedePisarse = true
		}
	}
	
	method cerrar(){
		if (abierta){
			abierta = false
			image = "puerta_cerrada.png"
			puedePisarse = false
		}
			
	}
}

class Pinche inherits Objeto{
	var property image = "pinches.png"
	
	var property puedePisarse = true 
	
	override method colisionarConPersonaje(personaje){
		personaje.pincharse()
	}
}

class Pancho inherits Objeto{ //Objeto para pasar al nivel 2
	var property image = "pancho.png"

	var property puedePisarse = true
	
	
	override method colisionarConPersonaje(personaje){
		game.say(personaje,"Pasé de nivel!")
		game.schedule(3000, { gestorNiveles.cargarSiguienteNivel()})
	}
}
