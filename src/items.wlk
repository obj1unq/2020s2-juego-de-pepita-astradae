class Item {
	var property image = null
	var property position = null
	
	var property ataque
	var property defenza
	var property efectoEspecial
	var property mana
	var property usos
	
	method bajarUso(){
		usos -= 1
	}
	method usarEfectoEspecial(personaje){
		if(efectoEspecial){
			self.realizarEfectoEspecial(personaje)
		}
	}
	method realizarEfectoEspecial(personaje)
}

class ChoriYCoca inherits Item {
	override method realizarEfectoEspecial(personaje){
		personaje.curar(5)
	}
}

class Ensalada inherits Item {
	override method realizarEfectoEspecial(personaje){
		personaje.curar(7)
	}
}

class Parrillada inherits Item {
	override method realizarEfectoEspecial(personaje){
		personaje.curar(10)
	}
}

class ComidaVegan inherits Item {
	override method realizarEfectoEspecial(personaje){
		personaje.curar(12)
	}
}

class PlatoVegano inherits Item {
	override method realizarEfectoEspecial(personaje){
		personaje.curar(15)
	}
}

class ListaItems {
	const property lista
}