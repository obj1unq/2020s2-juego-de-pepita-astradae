import wollok.game.*
import cartas.*
import mesa.*
object nivel1 {
	
	const unoEs = new Carta(image = "Uno_de_Espadas.png" , valorEnvido = 1)
	const dosEs = new Carta(image = "dosespadas.png" , valorEnvido = 2)
	const tresEs = new Carta(image = "tresespadas.png" , valorEnvido = 3)
	const cuatroEs = new Carta(image = "cuatroespadas.png" , valorEnvido = 4)
	const cincoEs = new Carta(image = "cincoespadas.png" , valorEnvido = 5)
	const seisEs = new Carta(image = "seisespada.png" , valorEnvido = 6)
	
	const property mazo = [unoEs , dosEs , tresEs, cuatroEs, cincoEs, seisEs]
	
	const unaMesa = new Mesa()
	
	method armarJugada(){
		
		
		
		unaMesa.mezclar(mazo)
		
		}
	method config(){
		
		keyboard.num1().onPressDo {unaMesa.jugarPrimerCartaPropia()}
		keyboard.num2().onPressDo {unaMesa.jugarSegundaCartaPropia()}
		keyboard.num3().onPressDo {unaMesa.jugarTercerCartaPropia()}
	}
}