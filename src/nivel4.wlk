import niveles.*
import main.*
import wollok.game.*
import nivel5.*

const nivel4 = new Nivel(
	 siguienteNivel = nivel5,
		
	 paredes = [
	 	new Pared(position = game.at(2,9)), 
		new Pared(position = game.at(2,8)), 
		new Pared(position = game.at(1,6)), 
		new Pared(position = game.at(2,6)),
		new Pared(position = game.at(1,5)), 
		new Pared(position = game.at(1,4)), 
		new Pared(position = game.at(1,3)),
		new Pared(position = game.at(1,2)),
		new Pared(position = game.at(2,2)),
		new Pared(position = game.at(0,0)),
		new Pared(position = game.at(4,2)),  
		new Pared(position = game.at(4,3)),  
		new Pared(position = game.at(5,3)),  
		new Pared(position = game.at(6,2)),  
		new Pared(position = game.at(6,3)),
		new Pared(position = game.at(6,0)),  
		new Pared(position = game.at(7,3)),
		new Pared(position = game.at(7,7)),
		new Pared(position = game.at(7,8)),  
		new Pared(position = game.at(7,9)),    
		new Pared(position = game.at(9,3)), 
		new Pared(position = game.at(9,7))    
	 ],
	 	
	 codigos = [new Codigo(position = game.at(0,2)),new Codigo(position = game.at(1,8))],	
	  
	 placas = [new Placa(position = game.at(1,0)),new Placa(position = game.at(3,2)), new Placa(position = game.at(5,1)), new Placa(position = game.at(7,2))],
	 
	 puerta = new Puerta(position = game.at(8,7)),
	 
	 cajas = [
	 	new Caja(posicionInicial = game.at(1,7), position = game.at(1,7)),
	 	new Caja(posicionInicial = game.at(3,4), position = game.at(3,4)),
	 	new Caja(posicionInicial = game.at(8,3), position = game.at(8,3)),
	 	new Caja(posicionInicial = game.at(7,1), position = game.at(7,1))
	 ],
	 
	 objetoGanador = new ObjetoGanador(position = game.at(9,9), image = "dinero.png"),
	 
	 pinches = [
	 	new Pinche(position = game.at(2,3)),
	 	new Pinche(position = game.at(3,3)),
	 	new Pinche(position = game.at(6,1)),
	 	new SuperPinche(position = game.at(4,1)),
	 	new SuperPinche(position = game.at(5,2))
	 ],
	 
	 posInicialFuerte = game.at(5,8),
	 posInicialInteligente = game.at(4,8)
)