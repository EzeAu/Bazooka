import wollok.game.*
import Iniciador.*
import Personajes.*
import Enemigos.*

object batalla1{
	
	method set(){
		//
		Akai.cambioEstado()
		Barco.cambioEstado()
		Cavani.cambioEstado()
  		//Objetos en pantalla
  		game.addVisual(Akai)
  		game.addVisual(Barco)
  		game.addVisual(Cavani)
  		
  		//Animaciones
  		game.onTick(300, "AkaiAnimacion", { Akai.animacion() })
  		game.onTick(300, "BarcoAnimacion", { Barco.animacion() })
  		game.onTick(300, "CavaniAnimacion", { Cavani.animacion() })
	}
	
	
	
	
	method borrar(){
		game.removeTickEvent("AkaiAnimacion")
		game.removeTickEvent("BarcoAnimacion")
		game.removeTickEvent("CavaniAnimacion")
		
		game.clear()
	}
	
}
