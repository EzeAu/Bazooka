import wollok.game.*
import Batallas.*
import Personajes.*

class Enemigo{
    var property sprite 
    var property spriteAnimacion
    var property position = game.center()
    var property batalla = false
    var property estado = "Mapa"

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
    }

const Cavani = new Enemigo(sprite = "enemy", batalla = false , spriteAnimacion = 0, position = game.at(41,25))
const Barco = new Enemigo(sprite = "enemy", batalla = false , spriteAnimacion = 0, position = game.at(44,20))
