import wollok.game.*
import Batallas.*
import Iniciador.*


class Personaje{
    var property sprite 
    var property spriteAnimacion
    var property position = game.center()
    var property batalla = false
    var property estado = "Mapa"
	
    method image() = "asset/" + sprite /*+ batalla*/ + spriteAnimacion + ".png"
    method cambioEstado(){
    	batalla = !batalla
    	if (estado == "Mapa"){
    		estado = "Batalla"
    	}else{
    		estado = "Mapa"
    	}
    }
    method animacion(){
        if (spriteAnimacion!=2){
            spriteAnimacion++
        }else{
            spriteAnimacion=0
        }
    }
    method ataqueBase(){}
    method ataqueFuerte(){}
    method magiaFuego(){}
    method magiaCura(){}
}

const Akai = new Personaje(sprite = "Akai", batalla = false, spriteAnimacion = 0, position = game.at(5,8))
