import wollok.game.*
import items.*
import mesa.*

class Boton {
	
	const property position
	const property image
	const property lugarItem
	
	method agregarItem(item , listaDeItems){
		item.position(lugarItem)
		game.addVisual(item)
		listaDeItems.remove(item)
	}
	
	method usarItem(item , jugador){
		item.position(jugador.inventario().lugarDisponible())
		jugador.agregarItem(item)
	}
	method sacarItem(listaItems){
		if(not game.getObjectsIn(lugarItem).isEmpty()){
		listaItems.add(game.getObjectsIn(lugarItem).first())
		game.removeVisual(game.getObjectsIn(lugarItem).first())
		}
	}
}