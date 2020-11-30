import wollok.game.*
import cartas.*
import mesa.*
object nivel1 {
	
	const unaMesa = new Mesa()
	
	method armarJugada(){

		unaMesa.mezclar(new MazoCompleto().mazo())
	}
	
	method config(){
	
		keyboard.num1().onPressDo {unaMesa.jugarPrimerCartaPropia()}
		keyboard.num2().onPressDo {unaMesa.jugarSegundaCartaPropia()}
		keyboard.num3().onPressDo {unaMesa.jugarTercerCartaPropia()}
		keyboard.enter().onPressDo {unaMesa.irseAlMazoYRepartir(new MazoCompleto().mazo())}
	}
}