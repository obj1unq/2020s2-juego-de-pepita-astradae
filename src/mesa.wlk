import wollok.game.*
import jugador.*
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
	
	const manaj1 = new CantidadMana(position = game.at(5,0))
	const manaj2 = new CantidadMana(position = game.at(10,0))
	
	method jugarRonda(listaDeItems , listaDeBotones , jugador1 , jugador2){
		game.onTick(10000, "jugada", {self.realizarMovimientos(jugador1 , jugador2 , listaDeItems , listaDeBotones)})
	}
	method visualesInfo(){
		game.addVisual(vidaJ1)
		game.addVisual(vidaJ2)
		game.addVisual(ataqueJ1)
		game.addVisual(ataqueJ2)
		game.addVisual(defenzaJ1)
		game.addVisual(defenzaJ2)
		game.addVisual(manaj1)
		game.addVisual(manaj2)
	}
	method agregarItemALosJugadores(listaDeItems , listaDeBotones){
		listaDeBotones.forEach ({boton => boton.agregarItem(listaDeItems.anyOne() , listaDeItems)})
	}
	method realizarMovimientos(jugador1 , jugador2 , listaDeItems , listaDeBotones){
		self.mostrarEstadisticas(jugador1 , jugador2)
		self.agregarItemALosJugadores(listaDeItems , listaDeBotones)
		self.evaluarSiJuegoTerminaOAtacar(jugador1 , jugador2 , listaDeBotones , listaDeItems)
	}
	method sacarItemsALosJugadores(listaDeBotones , listaItems){
		listaDeBotones.forEach({boton => boton.sacarItem(listaItems)})
	}
	method mostrarEstadisticas(jugador1 , jugador2){
		vidaJ1.mostrarVida(jugador1.vida())
		vidaJ2.mostrarVida(jugador2.vida())
		ataqueJ1.mostrarAtaque(jugador1.ataque())
		ataqueJ2.mostrarAtaque(jugador2.ataque())
		defenzaJ1.mostrarDefenza(jugador1.defenza())
		defenzaJ2.mostrarDefenza(jugador2.defenza())
		manaj1.mostrarMana(jugador1.puntosDeMana())
		manaj2.mostrarMana(jugador2.puntosDeMana())
	}
	method evaluarSiJuegoTerminaOAtacar(jugador1 , jugador2 , listaDeBotones , listaDeItems){
		if((jugador1.vida() > 0) and  (jugador2.vida() > 0)){
			self.seguirJugando(jugador1 , jugador2 ,listaDeBotones , listaDeItems )
		}  else if(jugador1.vida() < 1) {
			self.ganoJugador1(jugador1 , jugador2)
		} else if (jugador2.vida() < 1){
			ganoJugador2(jugador1 , jugador2)
		}
	}
	method seguirJugando(jugador1 , jugador2 ,listaDeBotones , listaDeItems ){
		jugador1.realizarTurno(jugador2 , listaDeItems)
		jugador2.realizarTurno(jugador1 , listaDeItems)
		jugador1.agregarMana(2)
		jugador2.agregarMana(2)
		game.schedule(8000, {self.sacarItemsALosJugadores(listaDeBotones , listaDeItems)})
	}
	method ganoJugador1(jugador1 , jugador2){
		self.mostrarEstadisticas(jugador1 , jugador2)
		game.removeTickEvent("jugada")
		game.clear()
		game.addVisual(victoria2)
	}
	method ganoJugador2(jugador1 , jugador2){
		self.mostrarEstadisticas(jugador1 , jugador2)
		game.removeTickEvent("jugada")
		game.clear()
		game.addVisual(victoria1)
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
		
		
		
		