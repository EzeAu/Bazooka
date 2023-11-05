import wollok.game.*
import Batallas.*
import Personajes.*
import Enemigos.*
import MenuBatalla.*
import Iniciador.*
import Activadores.*

class Mapas{
 method image(){}
 method iniciar(){}
 method set(){}
 method configuroAkai(){
 	Akai.estado("Mapa")
 	Akai.direccion("Derecha")
 	Akai.bloqueado(false)
 	Akai.batalla(false)
 	//Akai.enElEquipo(false)
 	
 }
 method setLimites(persona,x1,x2,y1,y2){
 	persona.x1(x1)
 	persona.x2(x2)
 	persona.y1(y1)
 	persona.y2(y2)
 	
 }
 method configuracionTeclas(){
	game.onTick(1100, "Detenerser", { Akai.spriteAnimacion(0) })
	//configuracion Tecla
	keyboard.up().onPressDo { 
		Akai.mover("Arriba")
		if(Akai.avanzarMapa(Akai.position().up(1))){
		Akai.position(Akai.position().up(1))
		}
	}
	keyboard.right().onPressDo { 
		Akai.mover("Derecha")	
		if(Akai.avanzarMapa(Akai.position().right(1))){
		Akai.position(Akai.position().right(1))
	}
	
	}
	keyboard.left().onPressDo { 
		Akai.mover("Izquierda")  
		if(Akai.avanzarMapa(Akai.position().left(1))){		
		Akai.position(Akai.position().left(1))
		
		}
	}
	keyboard.down().onPressDo { 
		
		Akai.mover("Abajo")
		if(Akai.avanzarMapa(Akai.position().down(1))){	 			
		Akai.position(Akai.position().down(1))
		}
	}
}
	method setObjetos(){}
}
object mapa1 inherits Mapas {
	 	
const property colisiones=#{ /*caasa 1*/game.at(2,5),game.at(2,6),game.at(3,4),game.at(3,7),game.at(3,8),game.at(4,4),game.at(5,4)
	,game.at(6,4),game.at(7,4),game.at(8,4),game.at(3,8),game.at(4,8),game.at(5,8),game.at(6,8),game.at(7,8),game.at(7,7),game.at(8,6)
	,game.at(7,5)
	//casa 2
	,game.at(2,15),game.at(2,14),game.at(3,14),game.at(4,14),game.at(5,14),game.at(6,13),game.at(7,13),game.at(8,15),game.at(8,18),
	game.at(3,17),game.at(3,16),game.at(4,17),game.at(5,17),game.at(6,17),game.at(7,17),game.at(7,14),game.at(7,16),game.at(3,12),game.at(8,18)
	//casa 3 y extras
	,game.at(15,16),game.at(15,15),game.at(15,14),game.at(16,14),game.at(16,17),game.at(16,18),game.at(17,18),game.at(18,18),
	game.at(19,18),game.at(20,18),game.at(21,18),game.at(21,17),game.at(21,16),game.at(22,15),game.at(21,14),game.at(17,14),
	game.at(18,14),game.at(19,14),game.at(20,14),game.at(21,14),game.at(17,8),game.at(27,19),game.at(27,18),game.at(27,17),game.at(27,16),
	game.at(27,15),game.at(27,14),game.at(27,13),game.at(27,7),game.at(27,6),game.at(27,5),game.at(27,4),game.at(27,3),game.at(26,8),
	game.at(27,12),game.at(26,12),game.at(28,12),game.at(29,12),game.at(30,12),game.at(31,12),game.at(27,8),game.at(28,9)
	,game.at(29,9),game.at(30,9),game.at(31,9),game.at(26,9)
}
	
	
	method iniciar(){
  		game.addVisual(fondo)
  		self.set()
  		activador1.colision()
	
	}	
	method set(){
		self.setObjetos()
		self.configuracionTeclas()
		
	}
	method setObjetos(){

		activador1.position(game.at(25,10))
		activador2.position(game.at(25,11))
		Akai.position(game.at(20,10))
		game.addVisual(activador1)
		game.addVisual(activador2)
		game.addVisual(Akai)
		game.addVisual(Pharsa)
		Pharsa.position(game.at(26,10))
	}

}

object mapa2 inherits Mapas{
		
	const property colisiones=#{game.at(0,15),game.at(1,15),game.at(2,15),game.at(3,15),game.at(4,16)
		,game.at(4,17),game.at(4,18),game.at(4,19),game.at(5,19),game.at(6,19),game.at(6,18),game.at(6,17),game.at(7,16)
		,game.at(8,16),game.at(8,15),game.at(9,17),game.at(10,16),game.at(10,15),game.at(10,14)
		,game.at(11,14),game.at(12,13),game.at(13,13),game.at(14,13),game.at(15,13),game.at(16,14),game.at(17,15)
		,game.at(18,14),game.at(18,13),game.at(19,13),game.at(20,13),game.at(21,13),game.at(22,12),
		game.at(22,11),game.at(21,10),game.at(20,11),game.at(18,10),game.at(19,9),game.at(20,9)
		,game.at(21,9),game.at(22,9),game.at(23,9),game.at(24,10),game.at(24,11),
		game.at(24,12),game.at(24,13),game.at(24,14),game.at(24,15),game.at(25,15),
		game.at(28,12),game.at(27,15),game.at(26,7)
		,game.at(26,15),game.at(27,17),game.at(28,15),game.at(29,15),game.at(30,15)
		,game.at(0,12),game.at(1,12),game.at(2,12),game.at(3,11),game.at(4,10),
		game.at(5,9),game.at(6,9),game.at(7,8),game.at(8,7),game.at(9,8),game.at(10,9)
		,game.at(11,10),game.at(11,11),game.at(12,11),game.at(13,11),game.at(14,11)
		,game.at(15,11),game.at(16,10),game.at(16,9),game.at(16,8)
		,game.at(17,7),game.at(18,7),game.at(19,7),game.at(20,7),game.at(27,7)
		,game.at(27,8),game.at(27,9),game.at(27,10),game.at(27,11),game.at(27,12),
		game.at(29,12),game.at(30,12),game.at(31,12)
		,game.at(5,14),game.at(5,12),game.at(8,13),game.at(8,12),game.at(8,11)
		
	}
	override method iniciar(){
  		fondo.sprite("Mapas/Map002")
  		//game.addVisual(fondo)
  		Akai.mapa(self)
  		self.set()
  		activador3.colision()
		
	}	//
	override method set(){
		self.configuroAkai()
		self.setLimites(Akai,0,31,7,20)
		self.setObjetos()
		self.configuracionTeclas()
		
	}
	override method setObjetos(){
	Akai.position(game.at(0,14))	
	Mino.position(game.at(27,14))
	Bat.position(game.at(27,13))
	activador4.position(game.at(26,13))
	activador3.position(game.at(26,14))
	//game.addVisual(Akai)
	game.addVisual(Mino)
	game.addVisual(Bat)
	game.addVisual(activador3)
	game.addVisual(activador4)
	game.addVisual(oscuridad)
	}
}
object oscuridad{
	
	method image()="oscuridad.png"
	method position() {
		return game.at(Akai.position().x()-33,Akai.position().y()-37)
	}
	
}



