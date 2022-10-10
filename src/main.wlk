import wollok.game.*
import niveles.*

class Personaje{
	var property position = game.center()
	method moverA(dir) {
		position = dir.siguientePosicion(position) 
	}
	method colisionarConPersonaje(personaje){}
}

class Personaje1 inherits Personaje{
	method image() = "orc.png"
}

class Personaje2 inherits Personaje{
	method image() = "SeñorPepino.png"
}

const personajeFuerte = new Personaje1()
const personajeInteligente = new Personaje2()


object objetoGenerico{
	var property position = game.at(100,100)
}

class Placa{
	var property position
	var property image = "placaRoja.png"
	var property activada = false;
	var property ultimoColisionador = objetoGenerico
	
	method colisionarConPersonaje(_){
		
	}
	
	method configuracionInicial(){
		game.onCollideDo(self, {objetoSobrePlaca => ultimoColisionador = objetoSobrePlaca})
		game.onTick(25, "Consultar Activacion", { if (ultimoColisionador.position() == self.position()) {self.activarPlaca()} else {self.desactivarPlaca()}})
	}
	
	method crear() = game.addVisual(self)
	method activarPlaca(){
		image = "placaVerde.png";
		activada = true;
		// if(nivel1.placas().all({placa => placa.activada()})){nivel1.puerta().abierta(true)}; // Esto no debería chequearse aca
	}
	
	method desactivarPlaca(){
		image = "placaRoja.png";
		activada = false;
	}	
}

class Pared{
	var property position
	var property image = "pared.jpg"
	
	method colisionarConPersonaje(_){}
	method crear() = game.addVisual(self)
}
/* 
class Paredes{
	var property inicio 	// game.at(x,y)  De izquierda a derecha siempre y De arriba para abajo siempre, asi luego recorro en 1 sentido.
	var property fin		//game.at(x,y)	 
	var property orientacion = "vertical"
	
	method crear()
	{
		if(orientacion == "vertical")
		{
			//Hay que hacer que del 2do valor de inicio vaya creando una pared hasta el 2do valor de fin
			return 0
		}else
			// Hay que hacer que desde el 1er valor de inicio vaya creando una pared hasta el 1er valor de fin
			return 0
	}
}*/

class Puerta{
	var property image = "puerta_cerrada.png"
	var property position;
	var property abierta = false;
	
	method crear() = game.addVisual(self);
	
	method abrir(){
		if (!abierta){
			abierta = true
			image = "puerta_abierta.png"	
		}
	}
	
	method cerrar(){
		if (abierta){
			abierta = false
			image = "puerta_cerrada.png"
		}
			
	}
	
	method colisionarConPersonaje(personaje){
		if(abierta){
			game.say(personaje,"Pasé al siguiente nivel!")
			game.schedule(3000, { gestorNiveles.cargarSiguienteNivel() })
		};
	}
}