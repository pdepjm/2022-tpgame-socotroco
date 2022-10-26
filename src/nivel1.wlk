import niveles.*
import main.*
import wollok.game.*
import nivel2.*

const nivel1 = new Nivel(
	 siguienteNivel = nivel2,
		
	 paredes = [
	 	new Pared(position = game.at(2,9)),
	 	new Pared(position = game.at(3,9)),
	 	new Pared(position = game.at(4,9)),
	 	new Pared(position = game.at(4,8)), 
	 	new Pared(position = game.at(4,7)), 
	 	new Pared(position = game.at(4,6)),  
	 	new Pared(position = game.at(7,0)),
	 	new Pared(position = game.at(7,1)),  
	 	new Pared(position = game.at(7,2)),  
	 	new Pared(position = game.at(9,2))
	 ],
	 	
	 codigos = [new Codigo(position = game.at(3,0)),new Codigo(position = game.at(0,3))],	
	  
	 placas = [new Placa(position = game.at(9,4)),new Placa(position = game.at(7,9))],
	 
	 puerta = new Puerta(position = game.at(8,2)),
	 
	 cajas = [new Caja(posicionInicial = game.at(2,6), position = game.at(2,6))],
	 
	 objetoGanador = new ObjetoGanador(position = game.at(8,0), image = "comida.png"), 
	 
	 pinches = [
	 	new Pinche(position = game.at(6,9)),
	 	new Pinche(position = game.at(6,8)),
	 	new Pinche(position = game.at(7,8)),
	 	new Pinche(position = game.at(8,8)),
	 	new Pinche(position = game.at(8,9)),
	 	new Pinche(position = game.at(3,2)),
	 	new SuperPinche(position = game.at(0,2)),
	 	new SuperPinche(position = game.at(2,0))
	 ],
	 
	 posInicialFuerte = game.at(3,3),
	 posInicialInteligente = game.at(6,5)
)
