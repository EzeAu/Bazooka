import wollok.game.*
import Mapas.*


object inicio {
		
	var sprite = 1
	var property compruebaInicioSong = false
	var property position = game.origin()
	method image() = "Inicio/inicio" + sprite  + ".png"
	
	method set(){
		//Parametros Ventana
		game.width(1024/32)
  		game.height(768/32)
  		game.cellSize(32)
  		game.title("Bazooka")
  		
		game.addVisual(self)
		game.onTick(50, "InicioAnimacion", { self.animacion() })
		self.compruebaInicioSong(true)
		keyboard.enter().onPressDo{
			game.removeTickEvent("InicioAnimacion")
			sprite = "invisible0"
			mapa1.iniciar()
		}
		
		game.start()
	}
	
	method animacion(){
        if (sprite!=18){
            sprite++
        }else{
            sprite=1
        }
    }
}
