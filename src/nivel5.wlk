import niveles.*
import main.*
import wollok.game.*

const nivel5 = new Nivel(
	 siguienteNivel = null,
		
	 paredes = [
	 	new Pared(position = game.at(1,9)), 
		new Pared(position = game.at(1,8)),
		new Pared(position = game.at(2,8)),
		new Pared(position = game.at(0,6)),
		new Pared(position = game.at(1,6)),
		new Pared(position = game.at(2,6)),
		new Pared(position = game.at(4,6)),
		new Pared(position = game.at(6,8)),
		new Pared(position = game.at(7,7)),
		new Pared(position = game.at(4,8)),
		new Pared(position = game.at(2,1)),
		new Pared(position = game.at(4,3)),
		new Pared(position = game.at(4,1)),
		new Pared(position = game.at(4,3)),
		new Pared(position = game.at(5,3)),
		new Pared(position = game.at(2,3)),
		new Pared(position = game.at(8,7)),
		new Pared(position = game.at(7,5)),
		new Pared(position = game.at(8,5)),
		new Pared(position = game.at(2,0)),
		new Pared(position = game.at(7,0)),
		new Pared(position = game.at(7,1)),
		new Pared(position = game.at(6,3)),
		new Pared(position = game.at(7,3)),
		new Pared(position = game.at(5,2)),
		new Pared(position = game.at(9,1))
	 ],
	 	
	 codigos = [new Codigo(position = game.at(7,9)),new Codigo(position = game.at(7,6))],	
	  
	 placas = [new Placa(position = game.at(3,3)),new Placa(position = game.at(0,5))],
	 
	 puerta = new Puerta(position = game.at(8,1)),
	 
	 cajas = [
	 	new Caja(posicionInicial = game.at(4,7)),
	 	new Caja(posicionInicial = game.at(4,9)),
	 	new Caja(posicionInicial = game.at(1,2)),
	 	new Caja(posicionInicial = game.at(7,4))
	 ],
	 
	 objetoGanador = new ObjetoGanador(position = game.at(9,0), image = "nota.png"),
	 
	 pinches = [
	 	new Pinche(position = game.at(2,9)),
	 	new Pinche(position = game.at(6,9)),
	 	new Pinche(position = game.at(3,2)),
	 	new Pinche(position = game.at(6,5)),
	 	new Pinche(position = game.at(6,6)),
	 	new SuperPinche(position = game.at(9,7)),
	 	new SuperPinche(position = game.at(9,9))
	 ],
	 
	 posInicialFuerte = game.at(0,8),
	 posInicialInteligente = game.at(2,2)
)