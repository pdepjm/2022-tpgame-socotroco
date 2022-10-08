import wollok.game.*

class Personaje{
	var property position = game.center()
	method moverA(dir) {
		position = dir.siguientePosicion(position) 
	}
	method colisionarConPersonaje() = 0
}

class Personaje1 inherits Personaje{
	method image() = "orc.png"
}

class Personaje2 inherits Personaje{
	method image() = "orc.png"
}

object puertaCerrada{
	var property position = game.center().up(3);
	var property image = "puerta_cerrada.png";
	method colisionarConPersonaje(){game.say(self,"Puerta cerrada")};
}

object puertaAbierta{
	var property position = game.center().up(3);
	var property image = "puerta_abierta.png";
	method colisionarConPersonaje() = 0;
}

/*class PlacaDePresion{
	var property position = game.center().left(3)
	var property image = "pared.png"
	var activa = false;
	
	method colisionarConPersonaje(){self.presionarse()} 
	
	method presionarse(){
		image = "orc.png"
		game.schedule(50, {self.image("pared.png")})
	} 
	
	game.onTick(50, "movimiento",{ caja.movete() })
	
}*/

object placa{
	var property position = game.center().left(3)
	var property image = "pared.png"
	var activa = false;
	
	method colisionarConPersonaje(){self.activarPlaca()};
	
	method activarPlaca(){activa = true;game.say(self,"Someone is on me");game.removeVisual(puertaCerrada);game.addVisual(puertaAbierta)};
}


const personajeFuerte = new Personaje1()
const personajeInteligente = new Personaje2()

