import wollok.game.*

object pepita {
	var position = game.center().left(1);

	method position() = position;
	
	method position(nuevaPosicion){
		position = nuevaPosicion;
	}

	method image() = "pepita.png";
	
	method arriba(){
		self.position(self.position().up(1));
	}
	
	method derecha(){
		self.position(self.position().right(1));
	}
	
	method abajo(){
		self.position(self.position().down(1));
	}
	
	method izquierda(){
		self.position(self.position().left(1));
	}

}