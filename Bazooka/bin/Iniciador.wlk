import wollok.game.*
import Batallas.*
import Personajes.*
import Enemigos.*

object juego {
	
	method iniciar(){
		
		//Parametros Ventana
		game.width(1024/16)
  		game.height(768/16)
  		game.cellSize(16)
  		game.title("Bazooka")
  		
  		
  		//Batalla1
  		keyboard.b().onPressDo { 
  			batalla1.set()
  		}
  		
  		
  		game.start()
		
	}	
}
