import wollok.game.*
import jugador.*
import mesa.*
import botones.*
import items.*

object nivel1 {
	
	// inventario
	const inventarioJugador1 = new Inventario(lugares = [game.at(2,7) , game.at(3,7) , game.at(4,7)])
	const inventarioJugador2 = new Inventario(lugares = [game.at(12,7) , game.at(13,7) , game.at(14,7)])
	//estados
	const normal = new Estado(image = "izquierda.png" , multiplicador = 1)
	const monje = new Estado(image = "monje.png" , multiplicador = 2)
	const goku = new Estado(image = "goku.png" , multiplicador =3)
	// jugadores
	const jugador1 = new Jugador(estado = normal , vida = 10 , ataque = 2 , defenza = 1 , puntosDeMana = 4 , position = game.at(5 , 3) , image = "izquierda.png" , inventario = inventarioJugador1)                    
	const jugador2 = new Jugador(estado = normal , vida = 10 , ataque = 2 , defenza = 1 , puntosDeMana = 4 , position = game.at(10 , 3) , image = "derecha.png" , inventario = inventarioJugador2)
	//botones//
	const boton1 = new Boton(image = "1.png" , position = game.at(2 , 0) , lugarItem = game.at(2,1))
	const boton2 = new Boton(image = "2.png" , position = game.at(3 , 0) , lugarItem = game.at(3,1))
	const boton3 = new Boton(image = "3.png" , position = game.at(4 , 0) , lugarItem = game.at(4,1))
	const boton7 = new Boton(image = "7.png" , position = game.at(12 , 0) , lugarItem = game.at(12,1))
	const boton8 = new Boton(image = "8.png" , position = game.at(13 , 0) , lugarItem = game.at(13,1))
	const boton9 = new Boton(image = "9.png" , position = game.at(14 , 0) , lugarItem = game.at(14,1))
	// items //
	//espadas
	const espadaFuego = new Item(ataque = 7 , defenza = 2 , efectoEspecial = false , mana = 3 , image = "espadaFuego.png" , usos = 2)
	const espadaAgua = new Item(ataque = 5 , defenza = 3 , efectoEspecial = false , mana = 3 , image = "espadaAgua.png" , usos = 2)
	const espadaTierra = new Item(ataque = 3 , defenza = 3 , efectoEspecial = false , mana = 3 , image = "espadaTierra.png" , usos = 2) 
	const espadaFuego2 = new Item(ataque = 7 , defenza = 2 , efectoEspecial = false , mana = 3 , image = "espadaFuego.png" , usos = 2)
	const espadaAgua2 = new Item(ataque = 5 , defenza = 3 , efectoEspecial = false , mana = 3 , image = "espadaAgua.png" , usos = 2)
	const espadaTierra2 = new Item(ataque = 3 , defenza = 3 , efectoEspecial = false , mana = 3 , image = "espadaTierra.png" , usos = 2)
	//escudos//
	const escudoMadera = new Item(ataque = 0 , defenza = 5 , efectoEspecial = false , mana = 3 , image = "escudo.png" , usos = 2) 
	const escudoMadera2 = new Item(ataque = 0 , defenza = 5 , efectoEspecial = false , mana = 3 , image = "escudo.png" , usos = 2)
	//comida
	const itemchoriYCoca = new ChoriYCoca(ataque = -2 , defenza = 0 , efectoEspecial = true , mana = 3 , image = "choriycoca.png" , usos = 1)	
	const itemensalada = new Ensalada(ataque = 1 , defenza = 1 , efectoEspecial = true , mana = 4 , image = "ensalada.png" , usos = 1) 
	const itemparrillada = new Parrillada(ataque = -2 , defenza = 0 , efectoEspecial = true , mana = 5 , image = "parrillada.png" , usos = 1)
	const itemplatoVegano = new PlatoVegano(ataque = 2 , defenza = 2 , efectoEspecial = true , mana = 6 , image = "platoVegano.png" , usos = 1)
	const itemchoriYCoca2 = new ChoriYCoca(ataque = -2 , defenza = 0 , efectoEspecial = true , mana = 3 , image = "choriycoca.png" , usos = 1)	
	const itemensalada2 = new Ensalada(ataque = 1 , defenza = 1 , efectoEspecial = true , mana = 4 , image = "ensalada.png" , usos = 1) 
	const itemparrillada2 = new Parrillada(ataque = -2 , defenza = 0 , efectoEspecial = true , mana = 5 , image = "parrillada.png" , usos = 1)
	const itemplatoVegano2 = new PlatoVegano(ataque = 2 , defenza = 2 , efectoEspecial = true , mana = 6 , image = "platoVegano.png" , usos = 1)
	// lista nivel1true
	var listaNivel1 = [espadaFuego ,espadaAgua, espadaTierra, escudoMadera, itemchoriYCoca, itemensalada, itemparrillada, itemplatoVegano, itemchoriYCoca2
		, itemensalada2 , itemparrillada2 , itemplatoVegano2 ,escudoMadera2 , espadaFuego2 , espadaAgua2 , espadaTierra2]
	const listaBotones = [boton1 ,boton2,boton3,boton7,boton8,boton9]

	
	// setup
	method config(){
		self.agregarVisuales()
		self.configurarBotones()
	}
	method agregarVisuales(){
		game.addVisual(jugador1)
		game.addVisual(jugador2)
		game.addVisual(boton1)
		game.addVisual(boton2)
		game.addVisual(boton3)
		game.addVisual(boton7)
		game.addVisual(boton8)
		game.addVisual(boton9)
	}
	method configurarBotones(){
		keyboard.num1().onPressDo {boton1.agregarItemSiTieneMana(jugador1)}
		keyboard.num2().onPressDo {boton2.agregarItemSiTieneMana(jugador1)}
		keyboard.num3().onPressDo {boton3.agregarItemSiTieneMana(jugador1)}
		keyboard.num7().onPressDo {boton7.agregarItemSiTieneMana(jugador2)}
		keyboard.num8().onPressDo {boton8.agregarItemSiTieneMana(jugador2)}
		keyboard.num9().onPressDo {boton9.agregarItemSiTieneMana(jugador2)}

	}
	
	method jugar(){
		mesa.jugarRonda(listaNivel1  , listaBotones, jugador1, jugador2)
	}
	
}