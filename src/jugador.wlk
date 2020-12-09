import wollok.game.*

class Jugador {
	
	const property image
	const property position
	
	var property vida
	var property items = []
	var property ataque
	var property defenza
	var property puntosDeMana
	var property estado
	var property inventario 
	
	method agregarItem(item){
		items.add(item)	
		}
	method realizarTurno(enemigo ,listaItems){
		if (not items.isEmpty()){
			ataque = self.sumaAtaque(listaItems)
			defenza = self.sumaDefenza(listaItems)
			items.forEach({item => self.removerSinUsos(item ,listaItems)})
			items.forEach({item => item.bajarUso()})
		}
		self.atacar(enemigo)
	}
	method sumaAtaque(listaItems){
		var ataqueTotal = 0
		items.forEach({item => ataqueTotal += item.ataque()})
		return ataqueTotal
	}
	method sumaDefenza(listaItems){
		var defenzaTotal = 0
		items.forEach({item => defenzaTotal += item.defenza()})
		return defenzaTotal
	}
	
	method curar(cantidad){
		vida += cantidad
	}
	method atacar(enemigo){
		enemigo.recibirDanio(ataque)
	}
	method recibirDanio(_ataque){
		vida -= 0.max((_ataque - defenza))
	}
	method removerSinUsos(item , listaItems){
		if(item.usos() == 0){
			game.removeVisual(item)
			items.remove(item)
			listaItems.add(item)
		}
	}
}

class Estado {
	const property image
	const property position = null
	
	const property multiplicador
}

class Inventario {
	const property lugares
	
	method lugarDisponible(){
		return lugares.filter({lugar => game.getObjectsIn(lugar).isEmpty()}).first()
	}
}
class CantidadVida {
	const property image = "vida.jpg"
	const property position
	
	method mostrarVida(vida){
		game.say(self , vida.printString())
	}
}
class CantidadAtaque {
	const property image = "ataque.jpg"
	const property position
	
	method mostrarAtaque(ataque){
		game.say(self , ataque.printString())
	}
}
class CantidadDefenza {
	const property image = "defenza.jpg"
	const property position
	
	method mostrarDefenza(defenza){
		game.say(self , defenza.printString())
	}
}
