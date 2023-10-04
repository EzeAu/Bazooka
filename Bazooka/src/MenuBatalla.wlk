import wollok.game.*
import Batallas.*
import Personajes.*
import Enemigos.*

object menuBatallaBase{
	
	var property sprite = "MenuBatalla"
	var property position = game.origin()
	method image() = "asset/" + sprite  + ".png"
	
	
}
object menuBatallaAtacar{
	
	var property sprite = "menuAtacar"
	var property fijado = true
	var property seleccionado = "" 
	var property position = game.at(20,2)
	method image() = "asset/" + sprite  + seleccionado + ".png"
	
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

object menuBatallaEsperar{
	
	var property sprite = "menuProtejer"
	var property fijado = false
	var property seleccionado = "" 
	var property position = game.at(26,2)
	method image() = "asset/" + sprite  + seleccionado + ".png"
	
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



