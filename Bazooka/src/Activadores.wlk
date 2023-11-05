import wollok.game.*
import Batallas.*
import Personajes.*
import Enemigos.*
import MenuBatalla.*
import Mapas.*
import Inicio.*
import Iniciador.*
import Dialogos.*
class Activadores{
	var property position
	
	
	method colision(){
		game.onCollideDo(Akai, { activador => activador.setEvento() })}
	method setEvento()
	method siguientePantalla()

}
class ActivadoresMapa1 inherits Activadores{
	
	method evento(){
		if(!self.seMueveHasta(27,11)){
		self.animacionEvento()
		}
		else{
			game.removeTickEvent("Animacion")
			self.dialogo()
		}
		
	}
	method dialogo(){
		game.addVisual(dialogosMapa1)
		dialogosMapa1.animar()
		game.schedule(1100,{self.siguientePantalla()})
	}
	method animacionEvento(){
		Barco.animacion(0)
		Barco.animacion(0)
		Cavani.position(Cavani.position().left(1))
		Barco.position(Barco.position().left(1))
		
	}//
	
	override method siguientePantalla(){
		Barco.spriteAnimacion(0)
		Cavani.spriteAnimacion(0)
		
		game.clear()
		juego.iniciar()
	}
	method seMueveHasta(x,y){return Cavani.position()==game.at(x,y)}
	override method setEvento(){

		Akai.bloqueado(true)
		Cavani.position(game.at(31,11))
		Barco.position(game.at(31,10))
		game.addVisual(Cavani)
		game.addVisual(Barco)
		game.onTick(300, "Animacion", { self.evento() })
		
	}
}
class ActivadoresMapa2 inherits Activadores{
	override method setEvento(){
		self.siguientePantalla()
	}
	override method siguientePantalla(){
		game.clear()
		batalla2.set()
	}
}
const activador1 = new ActivadoresMapa1(position=game.at(25,10))
const activador2 = new ActivadoresMapa1(position=game.at(25,11))
const activador3 = new ActivadoresMapa2(position=game.at(26,14))
const activador4 = new ActivadoresMapa2(position=game.at(26,13))
