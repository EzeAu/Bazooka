import wollok.game.*
import Iniciador.*
import Personajes.*
import Enemigos.*
import MenuBatalla.*

object batalla1{
	
	method set(){

  		//set ubicacion
  		Cavani.position(game.at(20,10))
  		Barco.position(game.at(24,8))
  		Akai.position(game.at(5,8))
  		
  		//////menuBatalla
  		invocador.menuBatallaAdd()
  		
  		//////////Objetos en pantalla 		
  		game.addVisual(Akai)
  		game.addVisual(Barco)
  		game.addVisual(Cavani)
  		
  		//Cambios de Estado
		Barco.cambioEstado()
		Cavani.cambioEstado()
		Akai.cambioEstado()
		Akai.cambioEstado()
		
		//arreglos de sprites
		Akai.direccion("")
  		
  		//Que Personajes pelean
  		Akai.enElEquipo(true)
  		Akai.cambioEstado()
  		
  		//Animaciones
  		game.onTick(310, "AkaiAnimacion", { Akai.animacion() })
  		game.onTick(300, "BarcoAnimacion", { Barco.animacion() })
  		game.onTick(300, "CavaniAnimacion", { Cavani.animacion() })
  		
  		//Controles
  		controlesBatalla.aplicar()
  		
	}
	
	
	method borrar(){
		game.removeTickEvent("AkaiAnimacion")
		game.removeTickEvent("BarcoAnimacion")
		game.removeTickEvent("CavaniAnimacion")
		
		game.clear()
	}
	
}
object fondoBatalla{
	var property sprite = "fondoBatalla1"
	var property position = game.origin()
	method image() = "FondosBatalla/" + sprite + ".png"
}
object invocador {
	
	method menuBatallaAdd(){
		game.addVisual(fondoBatalla)
		game.addVisual(menuBatallaBase)
  		game.addVisual(menuBatalla1)
  		game.addVisual(menuBatalla2)
  		game.addVisual(menuBatallaCara)
	}
	
}

object controlTurnos{
	var property cantidadPersonajes = 0
	var property fases = 0//0=Ata,Prot 1=ABas,APro 2=Objetivo 3=atacaPersonaje
	
	method turnoJugadores(){
		if(Akai.enElEquipo() and self.estaVivo(Akai)){
			self.cantidadPersonajes(self.cantidadPersonajes()+1)
		}
		if(Pharsa.enElEquipo() and self.estaVivo(Pharsa)){
			self.cantidadPersonajes(self.cantidadPersonajes()+1)
		}
		if (cantidadPersonajes==0){
			//return "Error 01 No existen personajes con vida>0"
		}else
		{
			//return "Todo bien 01"
		}
		
		if(cantidadPersonajes==1){
			
		}else{
			
		}
		
		
		
		self.cantidadPersonajes(0)
	}
	
	method puedeRealizarAccion(){}
	
	method turnoEnemigos(){}
	method estaVivo(_personaje){
		return _personaje.vida()==0
	}
	
}























