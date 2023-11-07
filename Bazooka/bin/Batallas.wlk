import wollok.game.*
import Iniciador.*
import Personajes.*
import Enemigos.*
import MenuBatalla.*
import Inicio.*
import Mapas.*//

object batalla1{
	
	const batalla1Song = game.sound("song/batalla1.mp3")
	const mapa2Song = game.sound("song/mapa2.mp3")
	
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
		Akai.cambioEstado()
		
		//arreglos de sprites
		Akai.direccion("")
		Barco.direccion("")
		Cavani.direccion("")
  		
  		//Que Personajes pelean
  		Akai.enElEquipo(true)
  		
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
	method detenerMapa(){
		mapa2Song.pause()
	}
	
	method reinicio(){
		//set estadisticas personajes
		Akai.vida(100)
		Akai.energia(10)
		//set estadisticas enemigos
		Cavani.vida(80)
		Barco.vida(80)
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
  		mapa2Song.play()
	}
	
	method finalizado(){
		mapa2.iniciar()
	}
	
}

object batalla2{
	
	const batalla2Song = game.sound("song/batalla2.mp3")
	const talkSong3 = game.sound("song/talk3.mp3")
	const talkSong4 = game.sound("song/talk4.mp3")
	const talkSong5 = game.sound("song/talk5.mp3")
	const talkSong6 = game.sound("song/talk6.mp3")
	const finalSong = game.sound("song/final.mp3")
	
	method set(){
  		//set ubicacion
  		Mino.position(game.at(18,11))
  		Bat.position(game.at(24,8))
  		Akai.position(game.at(5,8))
  		//Pharsa.position(game.at(9,8))
  		
  		Akai.vida(100)
  		Akai.energia(10)
  		
  		//set Enemigos
  		controlesBatalla.enemigo2(Bat)
  		controlesBatalla.enemigo1(Mino)
  		//////menuBatalla
  		invocador.menuBatallaAdd()
  		//setFondo
		fondo.sprite("FondosBatalla/fondoBatalla2")
  		
  		//////////Objetos en pantalla 		
  		game.addVisual(Akai)
  		game.addVisual(Mino)
  		game.addVisual(Bat)
  		
  		//game.addVisual(Pharsa)
  		game.addVisual(flecha)
  		
  		
  		//Cambios de Estado
		Mino.cambioEstado()
		Bat.cambioEstado()
		
		//arreglos de sprites
		Akai.direccion("")
		//Pharsa.direccion("")
		Mino.direccion("")
		Bat.direccion("")
  		
  		//Que Personajes pelean
  		Akai.enElEquipo(true)
  		Akai.cambioEstado()
  		//Pharsa.enElEquipo(true)
  		//Pharsa.cambioEstado()
  		
  		//Animaciones
  		game.onTick(310, "AkaiAnimacion", { Akai.animacion(0) })
  		//game.onTick(320, "PharsaAnimacion", { Pharsa.animacion(0) })
  		game.onTick(300, "MinoAnimacion", { Mino.animacion(0) })
  		game.onTick(200, "BatAnimacion", { Bat.animacion(0) })
  		
  		controlTurnos.batalla(self)
  		
  		menuBatallaHp.setHp()
  		menuBatallaEp.setEp()
  		
  		//Controles
  		controlTurnos.turnoJugadores()
  		//controlesBatalla.aplicar()
  		controlesBatalla.aplicar(controlesBatalla.controles())
  		
  		//MUSICA
  		batalla1.detenerMapa()
		batalla2Song.play()
		controlesBatalla.controles(true)
  		
  		
}
	
	method detener(){
		batalla2Song.pause()
	}
	
	method reinicio(){
		//set estadisticas personajes
		Akai.vida(100)
		Akai.energia(10)
		//set estadisticas enemigos
		Bat.vida(80)
		Mino.vida(80)
		controlTurnos.turnoJugadores()
		Akai.direccion("")
		menuBatallaHp.setHp()
		menuBatallaEp.setEp()
		batalla2Song.resume()
		controlesBatalla.controles(true)
	}
	
	method borrar(){
		game.removeTickEvent("AkaiAnimacion")
		game.removeTickEvent("MinoAnimacion")
		game.removeTickEvent("BatAnimacion")
		
		game.removeVisual(Bat)
		game.removeVisual(Mino)
		game.removeVisual(menuBatallaHp)
		game.removeVisual(menuBatallaCara)
		game.removeVisual(Akai)
		game.removeVisual(menuBatalla2)
		game.removeVisual(menuBatalla1)
		game.removeVisual(menuBatallaBase)
		
  		self.detener()
  	   
	}
	
	method contexto(){
		game.addVisual(fin)
		talkSong3.play()
		game.schedule(2000, {talkSong3.pause()})
		game.schedule(7000, {talkSong4.play()}) 
		game.schedule(14000, {talkSong4.pause()}) 
		game.schedule(14000, {talkSong5.play()}) 
		game.schedule(21000, {talkSong5.pause()})
		game.schedule(21000, {talkSong6.play()}) 
		game.schedule(28000, {talkSong6.pause()})
		game.onTick(7000, "contextoFinal", {
			fin.spriteAnimacion(fin.spriteAnimacion()+1)
			if(fin.spriteAnimacion()==5){
				fin.spriteAnimacion("")
				game.removeTickEvent("contextoFinal")
				fin.sprite("Inicio/Continuara")
				game.schedule(2500, {
					fin.sprite("Inicio/Creditos")
					finalSong.play()
				})
			}
		})
	}
	
	method finalizado(){
		self.contexto()
		// FIN JUEGO
	}
	
}
object fin{
	var property sprite = "Contexto/ContextoFinal"
	var property spriteAnimacion = 1
	var property position = game.origin()
	method image() = sprite + spriteAnimacion +".png"
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
  		menuBatallaBase.sprite("AkaiMenu")
  		menuBatallaCara.sprite("Akai/AkaiCara")
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
	method miTurno(_personaje){
		if(self.estaVivo(_personaje) and !_personaje.realizoAccion()){
			self.cantidadPersonajes(self.cantidadPersonajes()+1)
		}
	}
	method turnoJugadores(){
		
		if(self.partidaGanada(controlesBatalla.enemigo1()) and self.partidaGanada(controlesBatalla.enemigo2())){
			controlesBatalla.controles(false)
			self.batalla().borrar()
			self.batalla().finalizado()
		}
		cantidadPersonajes = 0
		self.miTurno(Akai)
		if (cantidadPersonajes==0){
			if(self.estaVivo(Akai)){
				self.turnoEnemigos()
			}else{
				self.gameOver()
			}
		}else{
			controlesBatalla.fases(0)
			controlesBatalla.controlFases(0)
		}
		self.cantidadPersonajes(0)
		controlesBatalla.enemigo1().realizoAccion(false)
		controlesBatalla.enemigo2().realizoAccion(false)
	}
	
	method turnoEnemigos(){
		cantidadPersonajes = 0
		menuBatalla1.sprite("invisible0")
		menuBatalla2.sprite("invisible0")
		menuBatalla1.seleccionado("")
		menuBatalla2.seleccionado("")	
		
		self.comprobarEnemigos()
		
		if (cantidadPersonajes==0){
			controlesBatalla.controles(false)
			//WIN!!!
		}else{
		game.schedule(2000, {
			if(self.estaVivoEnemigo(controlesBatalla.enemigo1())){
				controlesBatalla.enemigo1().atacar(Akai)
				self.turnoEnemigos()
			}else{
				if(self.estaVivoEnemigo(controlesBatalla.enemigo2())){
					controlesBatalla.enemigo2().atacar(Akai)
					self.turnoEnemigos()
				}else{
					controlesBatalla.ataque2(true)
					controlesBatalla.controles(true)
					controlesBatalla.fases(0)
					Akai.realizoAccion(false)
					Akai.modificadorDanio(0)
					self.turnoJugadores()
				}
			}
		})
		}	
	}
	
	method comprobarEnemigos(){
		if(self.estaVivoEnemigo(controlesBatalla.enemigo1())){
			self.cantidadPersonajes(self.cantidadPersonajes()+1)
		}
		if(self.estaVivoEnemigo(controlesBatalla.enemigo2())){
			self.cantidadPersonajes(self.cantidadPersonajes()+1)
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
	
	method gameOver(){
		controlesBatalla.controles(false)
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
					controlesBatalla.enemigo1().direccion("")
					controlesBatalla.enemigo2().direccion("")
					self.batalla().reinicio()	
				})
	}
	
}






















