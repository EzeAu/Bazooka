import wollok.game.*
import Batallas.*
import Personajes.*
import Enemigos.*
//borrar.
object menuBatallaBase{
	
	var property sprite = "AkaiMenu"
	var property position = game.at(0,1)
	method image() = "MenuBatalla/" + sprite  + ".png"
	
}
class MenuBatalla{
	
	var property sprite = "menuAtacar"
	var property fijado = true
	var property seleccionado = "" 
	var property position = game.at(20,2)
	method image() = "MenuBatalla/" + sprite  + seleccionado + ".png"
	
	method comprobarFijado(){
		if(fijado){
			self.seleccionado("Seleccionado")
		}else{
			self.seleccionado("")
		}
	}
	method cambioFijado(){
		fijado = !fijado
	}
}
const menuBatalla1 = new MenuBatalla(sprite="AkaiAtaque", fijado = true, seleccionado = "Seleccionado", position = game.at(18,3))
const menuBatalla2 = new MenuBatalla(sprite="AkaiProteger", fijado = false, seleccionado = "", position = game.at(25,3))

object menuBatallaCara{
	var property sprite = "Akai/AkaiCara"
	var property position = game.at(1,2)
	method image() = sprite + ".png"
}

object controlesBatalla{
	
	var property ataque2 = true
	var property fases = 0
	var property enemigo1 = ""
	var property enemigo2 = ""
	
	method aplicar(){
		keyboard.left().onPressDo{self.controlesMenuMovimiento()}
  		keyboard.right().onPressDo{self.controlesMenuMovimiento()}
  		keyboard.a().onPressDo{
  			if(menuBatalla2.fijado() and self.fases()==0){	
  			}else{
  				if(self.fases()==1){
  					if(menuBatalla2.fijado()){
  						self.ataque2(true)
  						self.controlesMenuAceptar()	
  					}else{
  						self.ataque2(false)
  						self.controlesMenuAceptar()	
  					}
  				}else{
  					self.controlesMenuAceptar()	
  				}
  			}
  		}
  		keyboard.s().onPressDo{self.controlesMenuSalir()}
	}
	
	method controlesMenuMovimiento(){
		menuBatalla1.cambioFijado()
  		menuBatalla2.cambioFijado()
  		menuBatalla2.comprobarFijado()
  		menuBatalla1.comprobarFijado()
  		flecha.elegido(!flecha.elegido())
  		flecha.cambioElegido()
	}
	method controlesMenuAceptar(){
		if (self.fases()>=0 and self.fases()<4){
			self.fases(self.fases()+1)
			self.controlFases(self.fases())
		}
	}
	method controlesMenuSalir(){
		if (self.fases()>0){
			self.fases(self.fases()-1)
			self.controlFases(self.fases())
		}
	}
	method controlFases(_fase){
		if(_fase==0){self.fase0()}
		if(_fase==1){self.fase1()}
		if(_fase==2){self.fase2()}
		if(_fase==3){self.fase3()}
	}
	method correccionFases(){
		if(self.fases()<0){self.fases(0)}
	}
	method fase0(){
		menuBatalla1.sprite("AkaiAtaque")
		menuBatalla2.sprite("AkaiProteger")
	}
	method fase1(){
		menuBatalla1.sprite("AkaiAtaqueBasico")
		menuBatalla2.sprite("AkaiAtaqueFuerte")
		flecha.reinicio()
	}
	method fase2(){
		menuBatalla1.sprite("menuSeleccionar")
		menuBatalla2.sprite("Invisible")
		flecha.instanciar()
		
	}
	method fase3(){
		if(ataque2){
			if(flecha.elegido()){
				Akai.ataqueFuerte(enemigo1)
			}else{
				Akai.ataqueFuerte(enemigo2)
			}
		}else{
			if(flecha.elegido()){
				Akai.ataqueBase(enemigo1)
			}else{
				Akai.ataqueBase(enemigo2)
			}
		}
	}
}

object flecha{
	var property sprite = "invisible"
	var property position = game.at(24,8)
	var property elegido = false
	method image() = sprite + ".png"
	
	method instanciar(){
		self.sprite("Akai/AkaiMapaHerido0")
	}
	
	method reinicio(){
		self.sprite("invisible")
	}
	
	method cambioElegido(){
		if(elegido){
			self.position(game.at(20,10))
		}else{self.position(game.at(24,8))}
	}
}

