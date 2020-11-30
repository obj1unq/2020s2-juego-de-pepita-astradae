import wollok.game.*
import cartas.*
import nivel1.*

class Mesa {
	
	var property mazoJugada = null
	
	var property cartaPropia1 = null
	var property cartaPropia2 = null
	var property cartaPropia3 = null
	var property cartaRival1 = null
	var property cartaRival2 = null
	var property cartaRival3 = null
	
	var property soyMano = true
	
	const property positionManoPropia1 = game.at(1,1)
	const property positionManoPropia2 = game.at(5,1)
	const property positionManoPropia3 = game.at(9,1)
	
	
	const property positionManoRival1 = game.at(1,12)
	const property positionManoRival2 = game.at(5,12)
	const property positionManoRival3 = game.at(9,12)
	
	const property positionMesaPropia1 = game.at(1,5)
	const property positionMesaPropia2 = game.at(5,5)
	const property positionMesaPropia3 = game.at(9,5)
	
	const property positionMesaRival1 = game.at(1,9)
	const property positionMesaRival2 = game.at(5,9)
	const property positionMesaRival3 = game.at(9,9)
	
	
	// setup
	method mezclar(mazo){
		if(soyMano) {self.repartirCartasPropia(mazo)} else {self.repartirCartasRival(mazo)}
	}
	
	method repartirCartasPropia(mazo){
		
		self.mazoJugada(mazo)
		
		self.cartaRival1(mazoJugada.anyOne())
		mazoJugada.remove(cartaRival1)
		self.cartaRival1().enManoRival(true)
		self.cartaRival1().position(positionManoRival1)
		
		self.cartaPropia1(mazoJugada.anyOne())
		mazoJugada.remove(cartaPropia1)
		self.cartaPropia1().position(positionManoPropia1)
		self.cartaPropia1().enManoPropia(true)
		
		self.cartaRival2(mazoJugada.anyOne())
		mazoJugada.remove(cartaRival2)
		self.cartaRival2().enManoRival(true)
		self.cartaRival2().position(positionManoRival2)
		
		self.cartaPropia2(mazoJugada.anyOne())
		mazoJugada.remove(cartaPropia2)
		self.cartaPropia2().position(positionManoPropia2)
		self.cartaPropia2().enManoPropia(true)
		
		self.cartaRival3(mazoJugada.anyOne())
		mazoJugada.remove(cartaRival3)
		self.cartaRival3().enManoRival(true)
		self.cartaRival3().position(positionManoRival3)
		
		self.cartaPropia3(mazoJugada.anyOne())
		self.cartaPropia3().position(positionManoPropia3)
		self.cartaPropia3().enManoPropia(true)
		
		game.addVisual(cartaPropia1)
		game.addVisual(cartaPropia2)
		game.addVisual(cartaPropia3)
		game.addVisual(cartaRival1)
		game.addVisual(cartaRival2)
		game.addVisual(cartaRival3)
		
		soyMano = false
	}
	method repartirCartasRival(mazo){
		
		self.mazoJugada(mazo)
		
		self.cartaPropia1(mazoJugada.anyOne())
		mazoJugada.remove(cartaPropia1)
		self.cartaPropia1().position(positionManoPropia1)
		
		
		self.cartaRival1(mazoJugada.anyOne())
		mazoJugada.remove(cartaRival1)
		self.cartaRival1().enManoRival(true)
		self.cartaRival1().position(positionManoRival1)
		
		self.cartaPropia2(mazoJugada.anyOne())
		mazoJugada.remove(cartaPropia2)
		self.cartaPropia2().position(positionManoPropia2)
		
		self.cartaRival2(mazoJugada.anyOne())
		mazoJugada.remove(cartaRival2)
		self.cartaRival2().enManoRival(true)
		self.cartaRival2().position(positionManoRival2)
		
		self.cartaPropia3(mazoJugada.anyOne())
		mazoJugada.remove(cartaPropia3)
		self.cartaPropia3().position(positionManoPropia3)
		
		self.cartaRival3(mazoJugada.anyOne())
		self.cartaRival3().enManoRival(true)
		self.cartaRival3().position(positionManoRival3)
		
		game.addVisual(cartaPropia1)
		game.addVisual(cartaPropia2)
		game.addVisual(cartaPropia3)
		game.addVisual(cartaRival1)
		game.addVisual(cartaRival2)
		game.addVisual(cartaRival3)
		
		soyMano = true
	}
	
	
	// acciones
	
	method jugarPrimerCartaPropia(){
		if(cartaPropia1.enManoPropia()){
		cartaPropia1.position(positionMesaPropia1)
		cartaPropia1.enManoPropia(false)
		}
	}
	
	method jugarSegundaCartaPropia(){
		if(cartaPropia2.enManoPropia()){
		cartaPropia2.position(positionMesaPropia2)
		cartaPropia2.enManoPropia(false)
		}
	}
	
	method jugarTercerCartaPropia(){
		if(cartaPropia3.enManoPropia()){
		cartaPropia3.position(positionMesaPropia3)
		cartaPropia3.enManoPropia(false)
		}
	}
	
	method jugarCartaPrimeraCartaRival1(){
		game.getObjectsIn(positionManoRival1).first().enManoRival(false)
		game.getObjectsIn(positionManoPropia2).first().position(positionMesaRival1)
	}
	method jugarCartaPrimeraCartaRival2(){
		game.getObjectsIn(positionManoRival2).first().enManoRival(false)
		game.getObjectsIn(positionManoPropia2).first().position(positionMesaRival2)
	}
	method jugarCartaPrimeraCartaRival3(){
		game.getObjectsIn(positionManoRival2).first().enManoRival(false)
		game.getObjectsIn(positionManoPropia2).first().position(positionMesaRival3)
	}
	
	// cartas a partir de su lugar
	
	method cartaMano1(){
		return game.getObjectsIn(positionManoPropia1).first()
	}
	method cartaMano2(){
		return game.getObjectsIn(positionManoPropia2).first()
	}
	method cartaMano3(){
		return game.getObjectsIn(positionManoPropia3).first()
	}
			
}

object boton1{
	const property image = "1.png"
	const property position = game.at(2,0)
}
object boton2{
	const property image = "2.png"
	const property position = game.at(6,0)
}
object boton3{
	const property image = "3.png"
	const property position = game.at(10,0)
}
