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

class PlacaDePresion{
	var property position = game.center().left(1)
	var property image = "pared.png"
	
	method colisionarConPersonaje(){self.presionarse()} 
	
	method presionarse(){
		image = "orc.png"
		game.schedule(50, {self.image("pared.png")})
	} 
	
	game.onTick(50, "movimiento",{ caja.movete() })
	
}

const placa1 = new PlacaDePresion()


const personajeFuerte = new Personaje1()
const personajeInteligente = new Personaje2()

