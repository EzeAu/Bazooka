import wollok.game.*
import Batallas.*
import Personajes.*
import Enemigos.*
import MenuBatalla.*

object juego {
	
	method iniciar(){
		
		//Parametros Ventana
	/*	game.width(1024/32)
  		game.height(768/32)
  		game.cellSize(32)
  		game.title("Bazooka")
  		game.boardGround("FondosBatalla/fondoBatalla1.png")
  		 */
  		//Batalla1
  		keyboard.b().onPressDo { 
  		batalla1.set()
  		}
  		
  		//game.start()
		
	}	
}
