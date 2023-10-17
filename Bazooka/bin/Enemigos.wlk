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
    var property direccion= "Derecha"
   // var property enDondeEstoy = true

    method image() = sprite + estado + direccion + spriteAnimacion + ".png"
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
		
			self.vida(self.vida() - Akai.danioPersonaje())
		 
    }
    method comprobarVida(){
        if (self.vida()<0){
            self.vida(0)
        }
    }
    }

const Cavani = new Enemigo(sprite = "Cavani/Cavani", batalla = false , spriteAnimacion = 0, position = game.at(20,10))
const Barco = new Enemigo(sprite = "Barco/Barco", batalla = false , spriteAnimacion = 0, position = game.at(24,8))
