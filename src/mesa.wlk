import wollok.game.*
import jugador.*
import contador.*
import nivel1.*
import botones.*

object mesa {
	
	var property numeroDeRonda = 0
	
	const vidaJ1 = new CantidadVida(position = game.at(2,9))
	const ataqueJ1 = new CantidadAtaque(position = game.at(4,9))
	const defenzaJ1 = new CantidadDefenza (position = game.at(6,9))
	
	const vidaJ2 = new CantidadVida(position = game.at(9,9))
	const ataqueJ2 = new CantidadAtaque(position = game.at(11,9))
	const defenzaJ2 = new CantidadDefenza(position = game.at(13,9))
	
	method jugarRonda(listaDeItems , listaDeBotones , jugador1 , jugador2){
		game.onTick(10000, "jugada", {self.realizarMovimientos(jugador1 , jugador2 , listaDeItems , listaDeBotones)})
		//contador.iniciarCuenta()
		numeroDeRonda += 1
	}
	
	method visualesInfo(){
		game.addVisual(vidaJ1)
		game.addVisual(vidaJ2)
		game.addVisual(ataqueJ1)
		game.addVisual(ataqueJ2)
		game.addVisual(defenzaJ1)
		game.addVisual(defenzaJ2)
	}
	
	method agregarItemALosJugadores(listaDeItems , listaDeBotones){
		listaDeBotones.forEach({boton => boton.agregarItem(listaDeItems.anyOne() , listaDeItems)})
	}
	method realizarMovimientos(jugador1 , jugador2 , listaDeItems , listaDeBotones){
		
		self.agregarItemALosJugadores(listaDeItems , listaDeBotones)
		
		if((jugador1.vida() > 0) and  (jugador2.vida() > 0)){
			
			vidaJ1.mostrarVida(jugador1.vida())
			vidaJ2.mostrarVida(jugador2.vida())
			ataqueJ1.mostrarAtaque(jugador1.ataque())
			ataqueJ2.mostrarAtaque(jugador2.ataque())
			defenzaJ1.mostrarDefenza(jugador1.defenza())
			defenzaJ2.mostrarDefenza(jugador2.defenza())
			
			jugador1.realizarTurno(jugador2 , listaDeItems)
			jugador2.realizarTurno(jugador1 , listaDeItems)
			
			game.schedule(8000, {self.sacarItemsALosJugadores(listaDeBotones , listaDeItems)})
			
		}  else if(jugador1.vida() < 1) {
			game.removeTickEvent("jugada")
			game.clear()
			game.addVisual(victoria2)
		} else if (jugador2.vida() < 1){
			game.removeTickEvent("jugada")
			game.clear()
			game.addVisual(victoria1)
		}
		
	}
	method sacarItemsALosJugadores(listaDeBotones , listaItems){
		listaDeBotones.forEach({boton => boton.sacarItem(listaItems)})
	}
}

object victoria1{
	const property image = "victoria1.png"
	const property position = game.origin()
}
object victoria2{
	const property image = "victoria2.png"
	const property position = game.origin()
}