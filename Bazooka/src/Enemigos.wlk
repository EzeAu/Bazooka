import wollok.game.*
import Batallas.*
import Personajes.*

class Enemigo{
    var property sprite 
    var property spriteAnimacion
    var property position = game.center()
    var property batalla = false
    var property estado = "Mapa"
    var property vida= 100

    method image() = "asset/" + sprite + spriteAnimacion + ".png"
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
    
	method ataqueRecibido(){

        self.vida(self.vida()-Akai.danioPersonaje())
    }
    method comprobarVida(){
        if (self.vida()<0){
            self.vida(0)
        }
    }
    }

const Cavani = new Enemigo(sprite = "enemy", batalla = false , spriteAnimacion = 0, position = game.at(25,10))
const Barco = new Enemigo(sprite = "enemy", batalla = false , spriteAnimacion = 0, position = game.at(28,8))
