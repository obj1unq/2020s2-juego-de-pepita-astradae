import mesa.*
import wollok.game.*

class Carta {

	var property image
	var property position = null
	var property enManoPropia = false
	var property enManoRival = false
	const property valorEnvido

	method image() {
		return if (enManoRival) "cartaDorso.png" else image
	}
}

object mazoCompleto {
	
	const unoEs = new Carta(image = "Uno_de_Espadas.png" , valorEnvido = 1)
	const dosEs = new Carta(image = "dosespadas.png" , valorEnvido = 2)
	const tresEs = new Carta(image = "tresespadas.png" , valorEnvido = 3)
	const cuatroEs = new Carta(image = "cuatroespadas.png" , valorEnvido = 4)
	const cincoEs = new Carta(image = "cincoespadas.png" , valorEnvido = 5)
	const seisEs = new Carta(image = "seisespadas.png" , valorEnvido = 6)
	
	const property mazo = [unoEs , dosEs , tresEs, cuatroEs, cincoEs, seisEs]
}

