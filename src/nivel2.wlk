import niveles.*
import main.*
import wollok.game.*
import nivel3.*

const nivel2 = new Nivel(
	 siguienteNivel = nivel3,
		
	 paredes = [
	 	new Pared(position = game.at(1,8)),
	 	new Pared(position = game.at(7,0)),
	 	new Pared(position = game.at(7,1)),  
	 	new Pared(position = game.at(7,2)),  
	 	new Pared(position = game.at(9,2))
	 ],
	 	
	 codigos = [new Codigo(position = game.at(0,7)),new Codigo(position = game.at(3,0)),new Codigo(position = game.at(6,7))],	
	  
	 placas = [new Placa(position = game.at(6,9)), new Placa(position = game.at(9,3)), new Placa(position = game.at(6,0))],
	 
	 puerta = new Puerta(position = game.at(8,2)),
	 
	 cajas = [new Caja(posicionInicial = game.at(3,6)), new Caja(posicionInicial = game.at(6,8))],
	 
	 objetoGanador = new ObjetoGanador(position = game.at(8,0), image = "familia.png"),
	 
	 pinches = [
	 	new Pinche(position = game.at(1,7)),
	 	new Pinche(position = game.at(1,6)),
	 	new Pinche(position = game.at(2,6)),
	 	new Pinche(position = game.at(4,6)),
	 	new Pinche(position = game.at(5,6)),
	 	new Pinche(position = game.at(5,7)),
	 	new Pinche(position = game.at(5,8)),
	 	new Pinche(position = game.at(6,6)),
	 	new Pinche(position = game.at(1,1)),
	 	new Pinche(position = game.at(1,0)),
		new Pinche(position = game.at(2,0))
	 ],
	 
	 posInicialFuerte = game.at(3,8),
	 posInicialInteligente = game.at(0,0)
)