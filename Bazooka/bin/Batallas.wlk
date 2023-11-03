import wollok.game.*
import Iniciador.*
import Personajes.*
import Enemigos.*
import MenuBatalla.*
import Inicio.*

object vidaB {
	
	method position() = game.at(24,8)
	
	method text() = "" + Barco.vida()
}
object vidaC {
	
	method position() = game.at(20,10)
	
	method text() = "" + Cavani.vida()
}

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
  		
  		game.addVisual(vidaB)
  		game.addVisual(vidaC)
  		
  		
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
  		controlesBatalla.aplicar(controlesBatalla.controles())
  		
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
object gameOver{
	var property sprite = "GameOver/GameOver"
	var property spriteAnimacion = 1
	var property position = game.origin()
	method image() = sprite + spriteAnimacion + ".png"
	
	method animacion(incicial){
        if (spriteAnimacion!=1){
            spriteAnimacion--
        }else{
            spriteAnimacion=incicial//0
        }
    }
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
	const gameoverSong = game.sound("song/gameover.mp3")
	
	var property cantidadPersonajes = 0
	var property fases = 0//0=Ata,Prot 1=ABas,APro 2=Objetivo 3=atacaPersonaje
	var property compruebaGameOverSong = false
	
	method turnoJugadores(){
		
		if(self.partidaGanada(controlesBatalla.enemigo1()) and self.partidaGanada(controlesBatalla.enemigo2())){
			game.say(Akai, "Gane2")
			controlesBatalla.controles(false)
			game.schedule(1000, {game.say(Akai, "Inicia Mapa2")})
		}
		cantidadPersonajes = 0
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
				game.say(Akai, "Perdi")
				controlesBatalla.controles(false)
				compruebaGameOverSong = true
				game.schedule(1000, {
					inicio.detener()
					gameoverSong.play()
					self.compruebaGameOverSong(false)
					game.addVisual(gameOver)
					game.onTick(300, "inicioAnimacion2" ,{ gameOver.animacion(4) } )
				})
				//GAME OVER!!!
			}
		}else{
			
			
			controlesBatalla.fases(0)
			controlesBatalla.controlFases(0)
		}
		self.cantidadPersonajes(0)
		controlesBatalla.enemigo1().realizoAccion(false)
		controlesBatalla.enemigo2().realizoAccion(false)
	}
	
	method puedeRealizarAccion(){}
	
	method turnoEnemigos(){
		cantidadPersonajes = 0
		menuBatalla1.sprite("invisible0")
		menuBatalla2.sprite("invisible0")
		menuBatalla1.seleccionado("")
		menuBatalla2.seleccionado("")
		//flecha.reinicio()		
		if(self.estaVivoEnemigo(controlesBatalla.enemigo1())){
			self.cantidadPersonajes(self.cantidadPersonajes()+1)
		}
		if(self.estaVivoEnemigo(controlesBatalla.enemigo2())){
			self.cantidadPersonajes(self.cantidadPersonajes()+1)
		}
		
		if (cantidadPersonajes==0){
			game.say(Akai, "Gane")
			controlesBatalla.controles(false)
			//WIN!!!
		}else{
		game.schedule(2000, {
			if(self.estaVivoEnemigo(controlesBatalla.enemigo1())){
				controlesBatalla.enemigo1().atacar(if(self.estaVivo(Akai)){Akai}else{Pharsa})
				self.turnoEnemigos()
			}else{
				if(self.estaVivoEnemigo(controlesBatalla.enemigo2())){
					controlesBatalla.enemigo2().atacar(if(self.estaVivo(Akai)){Akai}else{Pharsa})
					self.turnoEnemigos()
				}else{
					controlesBatalla.ataque2(true)
					controlesBatalla.controles(true)
					controlesBatalla.fases(0)
					Akai.realizoAccion(false)
					Pharsa.realizoAccion(false)
					Akai.modificadorDanio(0)
					Pharsa.modificadorDanio(0)
					self.turnoJugadores()
				}
			}
		})
		}
		
		
	}
	
	method estaVivo(_personaje){
		return _personaje.vida()>0 and _personaje.enElEquipo()
	}
	
	method estaVivoEnemigo(_enemigo){
		return _enemigo.vida()>0 and !_enemigo.realizoAccion() 
	}
	method partidaGanada(_enemigo){
		return _enemigo.vida()<=0  
	}
	
}






















