import wollok.game.*
import Iniciador.*
import Personajes.*
import Enemigos.*
import MenuBatalla.*
import Inicio.*
import Mapas.*//

object vidaB {
	
	method position() = game.at(24,8)
	
	method text() = "" + Barco.vida()
}
object vidaC {
	
	method position() = game.at(20,10)
	
	method text() = "" + Cavani.vida()
}

object batalla1{
	
	const batalla1Song = game.sound("song/batalla1.mp3")
	
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
  		
  		//game.addVisual(vidaB)///DELETE
  		//game.addVisual(vidaC)///DELETE
  		
  		
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
  		
  		controlTurnos.batalla(self)
  		
  		//Controles
  		controlTurnos.turnoJugadores()
  		//controlesBatalla.aplicar()
  		controlesBatalla.aplicar(controlesBatalla.controles())
  		
  		//MUSICA
  		inicio.detener()
		batalla1Song.play()
  		
  		
}
	
	method detener(){
		batalla1Song.pause()
	}
	
	method reinicio(){
		//set estadisticas personajes
		Akai.vida(100)
		Akai.energia(10)
		//set estadisticas enemigos
		Cavani.vida(100)
		Barco.vida(100)
		controlTurnos.turnoJugadores()
		Akai.direccion("")
		menuBatallaHp.setHp()
		menuBatallaEp.setEp()
		batalla1Song.resume()
		controlesBatalla.controles(true)
	}
	
	method borrar(){
		game.removeTickEvent("AkaiAnimacion")
		game.removeTickEvent("BarcoAnimacion")
		game.removeTickEvent("CavaniAnimacion")
		
		invocador.menuBatallaClose()
		Cavani.sprite("invisible")
		Barco.sprite("invisible")
		Barco.spriteAnimacion(0)
		Cavani.spriteAnimacion(0)
		Barco.estado("")
		Cavani.estado("")
		Barco.direccion("")
		Cavani.direccion("")
		menuBatallaHp.sprite("invisible0")
		menuBatallaEp.sprite("invisible0")
		menuBatallaCara.sprite("invisible0")
		
		Akai.direccion("Derecha")
		Akai.enElEquipo(false)
  		Akai.cambioEstado()
  		self.detener()
	}
	
}

object batalla2{
	
	const batalla2Song = game.sound("song/batalla2.mp3")
	
	method set(){
  		//set ubicacion
  		Mino.position(game.at(20,10))
  		Bat.position(game.at(24,8))
  		Akai.position(game.at(5,8))
  		Pharsa.position(game.at(9,8))
  		
  		//set Enemigos
  		controlesBatalla.enemigo2(Bat)
  		controlesBatalla.enemigo1(Mino)
  		//////menuBatalla
  		invocador.menuBatallaAdd()
  		//setFondo
		fondo.sprite("FondosBatalla/fondoBatalla2")
  		
  		//////////Objetos en pantalla 		
  		game.addVisual(Akai)
  		game.addVisual(Bat)
  		game.addVisual(Mino)
  		game.addVisual(Pharsa)
  		game.addVisual(flecha)
  		
  		
  		//Cambios de Estado
		Mino.cambioEstado()
		Bat.cambioEstado()
		
		//arreglos de sprites
		Akai.direccion("")
		Pharsa.direccion("")
		Mino.direccion("")
		Bat.direccion("")
  		
  		//Que Personajes pelean
  		Akai.enElEquipo(true)
  		Akai.cambioEstado()
  		Pharsa.enElEquipo(true)
  		Pharsa.cambioEstado()
  		
  		//Animaciones
  		game.onTick(310, "AkaiAnimacion", { Akai.animacion(0) })
  		game.onTick(320, "PharsaAnimacion", { Pharsa.animacion(0) })
  		game.onTick(300, "MinoAnimacion", { Mino.animacion(0) })
  		game.onTick(300, "BatAnimacion", { Bat.animacion(0) })
  		
  		controlTurnos.batalla(self)
  		
  		//Controles
  		controlTurnos.turnoJugadores()
  		//controlesBatalla.aplicar()
  		controlesBatalla.aplicar(controlesBatalla.controles())
  		
  		//MUSICA
  		inicio.detener()
		batalla2Song.play()
  		
  		
}
	
	method detener(){
		batalla2Song.pause()
	}
	
	method reinicio(){
		//set estadisticas personajes
		Akai.vida(100)
		Akai.energia(10)
		//set estadisticas enemigos
		Cavani.vida(100)
		Barco.vida(100)
		controlTurnos.turnoJugadores()
		Akai.direccion("")
		menuBatallaHp.setHp()
		menuBatallaEp.setEp()
		batalla2Song.resume()
		controlesBatalla.controles(true)
	}
	
	method borrar(){
		game.removeTickEvent("AkaiAnimacion")
		game.removeTickEvent("BarcoAnimacion")
		game.removeTickEvent("CavaniAnimacion")
		
		invocador.menuBatallaClose()
		Cavani.sprite("invisible")
		Barco.sprite("invisible")
		Barco.spriteAnimacion(0)
		Cavani.spriteAnimacion(0)
		Barco.estado("")
		Cavani.estado("")
		Barco.direccion("")
		Cavani.direccion("")
		menuBatallaHp.sprite("invisible0")
		menuBatallaEp.sprite("invisible0")
		menuBatallaCara.sprite("invisible0")
		
		Akai.direccion("Derecha")
		Akai.enElEquipo(false)
  		Akai.cambioEstado()
  		self.detener()
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
	
	method menuBatallaClose(){
		fondo.sprite("invisible0")
		menuBatallaBase.sprite("invisible0")
		menuBatalla1.sprite("invisible0")
		menuBatalla2.sprite("invisible0")
		menuBatallaCara.sprite("invisible0")
		menuBatallaHp.sprite("invisible0")
		menuBatallaEp.sprite("invisible0")
	}
	
}

object controlTurnos{
	const gameoverSong = game.sound("song/gameover.mp3")
	
	var property batalla = batalla1
	var property cantidadPersonajes = 0
	var property fases = 0//0=Ata,Prot 1=ABas,APro 2=Objetivo 3=atacaPersonaje
	var property compruebaGameOverSong = false
	var reproducir = true
	
	method turnoJugadores(){
		
		if(self.partidaGanada(controlesBatalla.enemigo1()) and self.partidaGanada(controlesBatalla.enemigo2())){
			game.say(Akai, "Gane2")
			controlesBatalla.controles(false)
			//game.schedule(1000, {game.say(Akai, "Inicia Mapa2")})
			self.batalla().borrar()
			mapa2.iniciar()
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
				//compruebaGameOverSong = true
				game.schedule(1000, {
					self.batalla().detener()
					if(reproducir){
						gameoverSong.play()
						game.addVisual(gameOver)
						reproducir = false
						game.onTick(300, "inicioAnimacion2" ,{ gameOver.animacion(4) } )
					}else{
						gameoverSong.resume()
						gameOver.sprite("GameOver")
						gameOver.spriteAnimacion(1)
						game.onTick(300, "inicioAnimacion2" ,{ gameOver.animacion(4) } )
					}
				})
				keyboard.enter().onPressDo({
					game.removeTickEvent("inicioAnimacion2")
					gameOver.sprite("invisible")
					gameOver.spriteAnimacion(1)
					gameoverSong.pause()
					//game.clear()
					self.batalla().reinicio()	
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






















