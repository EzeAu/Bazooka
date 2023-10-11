import wollok.game.*
import Batallas.*
import Personajes.*
import Enemigos.*

object menuBatallaBase{
	
	var property sprite = "MenuBatalla"
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
const menuBatalla1 = new MenuBatalla(sprite="menuAtacar", fijado = true, seleccionado = "Seleccionado", position = game.at(20,3))
const menuBatalla2 = new MenuBatalla(sprite="menuProtejer", fijado = false, seleccionado = "", position = game.at(26,3))

object menuBatallaCara{
	var property sprite = "Akai/AkaiCara"
	var property position = game.at(2,1)
	method image() = sprite + ".png"
}

object controlesBatalla{
	
	var property fases = 0
	
	method aplicar(){
		keyboard.left().onPressDo{self.controlesMenuMovimiento()}
  		keyboard.right().onPressDo{self.controlesMenuMovimiento()}
  		keyboard.a().onPressDo{
  			if(menuBatalla2.fijado() and self.fases()==0){
  				
  			}else{
  				self.controlesMenuAceptar()
			}
  		}
  		keyboard.s().onPressDo{self.controlesMenuSalir()}
	}
	
	method controlesMenuMovimiento(){
		menuBatalla1.cambioFijado()
  		menuBatalla2.cambioFijado()
  		menuBatalla2.comprobarFijado()
  		menuBatalla1.comprobarFijado()
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
	}
	method correccionFases(){
		if(self.fases()<0){self.fases(0)}
	}
	method fase0(){
		menuBatalla1.sprite("menuAtacar")
		menuBatalla2.sprite("menuProtejer")
	}
	method fase1(){
		menuBatalla1.sprite("menuAtacarBasico")
		menuBatalla2.sprite("menuAtacarFuerte")
		flecha.reinicio()
	}
	method fase2(){
		menuBatalla1.sprite("menuSeleccionar")
		menuBatalla2.sprite("Invisible")
		flecha.instanciar()
	}
}

object flecha{
	var property sprite = "invisible"
	var property position = game.at(24,8)
	method image() = sprite + ".png"
	
	method instanciar(){
		flecha.sprite("Akai/AkaiMapaHerido0")
	}
	
	method reinicio(){
		flecha.sprite("invisible")
	}
}

