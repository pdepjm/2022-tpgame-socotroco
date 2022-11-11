import niveles.*
import main.*
import wollok.game.*
import nivel5.*

const nivel4 = new Nivel(
	 siguienteNivel = nivel5,
		
	 paredes = [
	 	new Pared(position = game.at(6,0)), 
		new Pared(position = game.at(3,0)), 
		new Pared(position = game.at(6,1)), 
		new Pared(position = game.at(4,1)),
		new Pared(position = game.at(3,1)), 
		new Pared(position = game.at(0,1)), 
		new Pared(position = game.at(7,4)),
		new Pared(position = game.at(7,5)),
		new Pared(position = game.at(4,5)),
		new Pared(position = game.at(3,5)),
		new Pared(position = game.at(2,5)),  
		new Pared(position = game.at(1,5)),  
		new Pared(position = game.at(1,6)),  
		new Pared(position = game.at(7,7))
	 ],
	 	
	 codigos = [new Codigo(position = game.at(8,9)),new Codigo(position = game.at(9,2))],	
	  
	 placas = [new Placa(position = game.at(0,3)),
	 	new Placa(position = game.at(5,2)), 
	 	new Placa(position = game.at(0,6)), 
	 	new Placa(position = game.at(2,9)),
	 	new Placa(position = game.at(3,2)),
	 	new Placa(position = game.at(3,4))
	 ],
	 
	 puerta = new Puerta(position = game.at(5,1)),
	 
	 cajas = [
	 	new Caja(posicionInicial = game.at(1,2)),
	 	new Caja(posicionInicial = game.at(1,1)),
	 	new Caja(posicionInicial = game.at(2,3)),
	 	new Caja(posicionInicial = game.at(2,4)),
	 	new Caja(posicionInicial = game.at(5,6))
	 ],
	 
	 objetoGanador = new ObjetoGanador(position = game.at(4,0), image = "dinero.png"),
	 
	 pinches = [
	 	new Pinche(position = game.at(8,0)),
	 	new Pinche(position = game.at(7,1)),
	 	//new Pinche(position = game.at(0,2)),
	 	new Pinche(position = game.at(4,2)),
	 	new Pinche(position = game.at(4,3)),
	 	new Pinche(position = game.at(1,3)),
	 	new Pinche(position = game.at(5,3)),
	 	new Pinche(position = game.at(6,3)),
	 	new Pinche(position = game.at(7,3)),
	 	new Pinche(position = game.at(9,3)),
	 	new Pinche(position = game.at(4,4)),
	 	new Pinche(position = game.at(6,4)),
	 	new Pinche(position = game.at(7,6)),
	 	new Pinche(position = game.at(9,6)),
	 	new Pinche(position = game.at(8,8)),
	 	new Pinche(position = game.at(7,8)),
	 	new Pinche(position = game.at(7,9))
	 ],
	 
	 posInicialFuerte = game.at(3,9),
	 posInicialInteligente = game.at(0,0)
)


const nivel4Alternativo = new Nivel(
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
	 	
	 codigos = [new Codigo(position = game.at(0,2)),new Codigo(position = game.at(1,8)),new Codigo(position = game.at(5,0))],	
	  
	 placas = [new Placa(position = game.at(1,0)),new Placa(position = game.at(3,2)), new Placa(position = game.at(5,1)), new Placa(position = game.at(7,2))],
	 
	 puerta = new Puerta(position = game.at(8,7)),
	 
	 cajas = [
	 	new Caja(posicionInicial = game.at(1,7)),
	 	new Caja(posicionInicial = game.at(3,4)),
	 	new Caja(posicionInicial = game.at(8,3)),
	 	new Caja(posicionInicial = game.at(7,1))
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