import mesa.*
import wollok.game.*

class Personaje{
	
	const property carta1 = null
	const property carta2 = null
	const property carta3 = null
	
	var property esMiTurno = null
	
	method cambiarTurno(){
		esMiTurno = not esMiTurno
	}
	method jugarCarta(carta , rival){
		if(esMiTurno){
			self.agregarCartaDondeCorresponda(carta , rival)
		}
	}
	method agregarCartaDondeCorresponda(carta , rival)
}


object jugador inherits Personaje{
	
	const property positionManoPropia1 = game.at(1,1)
	const property positionManoPropia2 = game.at(5,1)
	const property positionManoPropia3 = game.at(9,1)
	
	const property positionMesaPropia1 = game.at(1,5)
	const property positionMesaPropia2 = game.at(5,5)
	const property positionMesaPropia3 = game.at(9,5)
	
	
	override method agregarCartaDondeCorresponda(carta , rival){
		
		if(positionMesaPropia1.allElements().isEmpty()){
			carta.position(positionMesaPropia1)
			self.cambiarTurno()
			rival.cambiarTurno()
		} else if (positionMesaPropia2.allElements().isEmpty()) {
			carta.position(positionMesaPropia2)
			self.cambiarTurno()
			rival.cambiarTurno()
		} else if (positionMesaPropia3.allElements().isEmpty()){
			carta.position(positionMesaPropia3)
			self.cambiarTurno()
			rival.cambiarTurno()
		}
	}
}

object rival inherits Personaje{
	
	const property positionManoRival1 = game.at(1,12)
	const property positionManoRival2 = game.at(5,12)
	const property positionManoRival3 = game.at(9,12)
	
	const property positionMesaRival1 = game.at(1,9)
	const property positionMesaRival2 = game.at(5,9)
	const property positionMesaRival3 = game.at(9,9)
	
	override method agregarCartaDondeCorresponda(carta , rival){
		
		if(positionMesaRival1.allElements().isEmpty()){
			carta.position(positionManoRival1)
			self.cambiarTurno()
			rival.cambiarTurno()
		} else if (positionMesaRival2.allElements().isEmpty()) {
			carta.position(positionManoRival2)
			self.cambiarTurno()
			rival.cambiarTurno()
		} else if (positionMesaRival3.allElements().isEmpty()){
			carta.position(positionManoRival3)
			self.cambiarTurno()
			rival.cambiarTurno()
		}
	}
}