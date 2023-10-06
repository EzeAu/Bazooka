import wollok.game.*
import Batallas.*
import Personajes.*
import Enemigos.*

object menuBatallaBase{
	
	var property sprite = "MenuBatalla"
	var property position = game.origin()
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
const menuBatalla1 = new MenuBatalla(sprite="menuAtacar", fijado = true, seleccionado = "", position = game.at(20,2))
const menuBatalla2 = new MenuBatalla(sprite="menuProtejer", fijado = false, seleccionado = "", position = game.at(26,2))

object controlesBatalla{
	
	method aplicar(){
		keyboard.left().onPressDo{
  			self.controlesMenuMovimiento()
  		}
  		keyboard.right().onPressDo{
  			self.controlesMenuMovimiento()
  		}
  		keyboard.a().onPressDo{
  			self.controlesMenuAceptar()
  		}
  		keyboard.s().onPressDo{
  			self.controlesMenuSalir()
  		}
	}
	
	method controlesMenuMovimiento(){
		menuBatalla1.cambioFijado()
  		menuBatalla2.cambioFijado()
  		menuBatalla2.comprobarFijado()
  		menuBatalla1.comprobarFijado()
	}
	method controlesMenuAceptar(){
		if (controlTurnos.fases()>0 and controlTurnos.fases()<4){
			controlTurnos.fases(controlTurnos.fases()+1)
		}
	}
	method controlesMenuSalir(){
		if (controlTurnos.fases()>0){
			controlTurnos.fases(controlTurnos.fases()-1)
		}
	}
	
	method fase0(){
		menuBatalla1.sprite("menuAtacar")
		menuBatalla1.sprite("menuProtejer")
	}
	method fase1(){
		menuBatalla1.sprite("menuAtacarBasico")
		menuBatalla1.sprite("menuAtacarFuerte")
	}
}


