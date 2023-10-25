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
  		
  		//set Enemigos
  		controlesBatalla.enemigo2(Barco)
  		controlesBatalla.enemigo1(Cavani)
  		//////menuBatalla
  		invocador.menuBatallaAdd()
  		//setFondo
		fondo.sprite("FondosBatalla/fondoBatalla1")
  		
  		//////////Objetos en pantalla 		
  		game.addVisual(Akai)
  		game.addVisual(Barco)
  		game.addVisual(Cavani)
  		game.addVisual(flecha)
  		
  		//Cambios de Estado
		Barco.cambioEstado()
		Cavani.cambioEstado()
		
		
		//arreglos de sprites
		Akai.direccion("")
		Barco.direccion("")
		Cavani.direccion("")
  		
  		//Que Personajes pelean
  		Akai.enElEquipo(true)
  		Akai.cambioEstado()
  		
  		//Animaciones
  		game.onTick(310, "AkaiAnimacion", { Akai.animacion(0) })
  		game.onTick(300, "BarcoAnimacion", { Barco.animacion(0) })
  		game.onTick(300, "CavaniAnimacion", { Cavani.animacion(0) })
  		
  		//Controles
  		controlTurnos.turnoJugadores()
  		//controlesBatalla.aplicar()
  		
	}
	
	
	method borrar(){
		game.removeTickEvent("AkaiAnimacion")
		game.removeTickEvent("BarcoAnimacion")
		game.removeTickEvent("CavaniAnimacion")
		
		game.clear()
	}
	
}
object fondo{
	var property sprite = "Mapas/Mapa1"
	var property position = game.origin()
	method image() = sprite + ".png"
}
object invocador {
	
	method menuBatallaAdd(){
		//invocar
		game.addVisual(fondo)
		game.addVisual(menuBatallaBase)
  		game.addVisual(menuBatalla1)
  		game.addVisual(menuBatalla2)
  		game.addVisual(menuBatallaCara)
  		game.addVisual(menuBatallaHp)
  		game.addVisual(menuBatallaEp)
	}
	
}

object controlTurnos{
	var property cantidadPersonajes = 0
	var property fases = 0//0=Ata,Prot 1=ABas,APro 2=Objetivo 3=atacaPersonaje
	
	method turnoJugadores(){
		if(self.estaVivo(Akai) and !Akai.realizoAccion()){
			self.cantidadPersonajes(self.cantidadPersonajes()+1)
		}
		if(self.estaVivo(Pharsa) and !Akai.realizoAccion()){
			self.cantidadPersonajes(self.cantidadPersonajes()+1)
		}
		if (cantidadPersonajes==0){
			if(self.estaVivo(Pharsa) or self.estaVivo(Akai)){
				
				self.turnoEnemigos()
			}else{
				//GAME OVER!!!
			}
		}else{
			controlesBatalla.aplicar(controlesBatalla.controles())
		}
		self.cantidadPersonajes(0)
	}
	
	method puedeRealizarAccion(){}
	
	method turnoEnemigos(){
		
		menuBatalla1.sprite("invisible0")
		menuBatalla2.sprite("invisible0")
		menuBatalla1.seleccionado("")
		menuBatalla2.seleccionado("")
		flecha.reinicio()
		game.say(Cavani, "Ahora ataco Yo")
		
	}
	method estaVivo(_personaje){
		return _personaje.vida()>0 and _personaje.enElEquipo()
	}
	
}























