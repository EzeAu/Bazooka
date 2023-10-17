import wollok.game.*
import Batallas.*
import Personajes.*


class Enemigo inherits Personaje{
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

    }

const Cavani = new Enemigo(sprite = "Cavani/Cavani", batalla = false ,direccion="izquierda", spriteAnimacion = 0, position = game.at(20,10),realizoAccion=false)
const Barco = new Enemigo(sprite = "Barco/Barco", batalla = false ,direccion="izquierda", spriteAnimacion = 0, position = game.at(24,8),realizoAccion=false)
