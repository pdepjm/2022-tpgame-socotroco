import niveles.*
import main.*
import wollok.game.*
import nivel4.*

const nivel3 = new Nivel(
	 siguienteNivel = nivel4,
		
	 paredes = [
	 	new Pared(position = game.at(2,0)),
	 	new Pared(position = game.at(2,1)),
	 	new Pared(position = game.at(2,2)),
	 	new Pared(position = game.at(3,2)),
	 	new Pared(position = game.at(4,2)),
	 	new Pared(position = game.at(0,2)),
	 	new Pared(position = game.at(6,3)),
	 	new Pared(position = game.at(7,3)),
	 	new Pared(position = game.at(8,3)),
	 	new Pared(position = game.at(2,4)),
	 	new Pared(position = game.at(3,4)),
	 	new Pared(position = game.at(4,4)),
	 	new Pared(position = game.at(6,4)),
	 	new Pared(position = game.at(2,5)),
	 	new Pared(position = game.at(9,5)),
	 	new Pared(position = game.at(1,6)),
	 	new Pared(position = game.at(2,6)),
	 	new Pared(position = game.at(6,6)),
	 	new Pared(position = game.at(5,7)),
	 	new Pared(position = game.at(7,8))
	 ],
	 	
	 codigos = [new Codigo(position = game.at(9,2)),new Codigo(position = game.at(4,0))],	
	  
	 placas = [new Placa(position = game.at(2,9)), 
	 	new Placa(position = game.at(9,9)), 
	 	new Placa(position = game.at(9,4)), 
	 	new Placa(position = game.at(8,7)),
	 	new Placa(position = game.at(0,5)),
	 	new Placa(position = game.at(5,2)),
	 	new Placa(position = game.at(8,0))
	 ],
	 
	 puerta = new Puerta(position = game.at(1,2)),
	 
	 cajas = [new Caja(posicionInicial = game.at(4,5)), 
	 	new Caja(posicionInicial = game.at(9,7)), 
	 	new Caja(posicionInicial = game.at(8,6)), 
	 	new Caja(posicionInicial = game.at(8,8)),
	 	new Caja(posicionInicial = game.at(1,3)),
	 	new Caja(posicionInicial = game.at(5,8))
	 ],

	 objetoGanador = new ObjetoGanador(position = game.at(0,0), image = "amigos.png"),
	 
	 pinches = [
	 	new Pinche(position = game.at(3,0)),
	 	new Pinche(position = game.at(6,0)),
	 	new Pinche(position = game.at(3,1)),
	 	new Pinche(position = game.at(9,1)),
	 	new Pinche(position = game.at(9,0)),
	 	new Pinche(position = game.at(6,2)),
	 	new Pinche(position = game.at(4,3)),
	 	new Pinche(position = game.at(5,3)),
	 	new Pinche(position = game.at(9,3))
	 ],
	 
	 posInicialFuerte = game.at(3,8),
	 posInicialInteligente = game.at(2,3)
)
 