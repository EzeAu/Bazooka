import wollok.game.*
import Batallas.*
import Personajes.*
import MenuBatalla.*


class Enemigo inherits Personaje{

    method image() = sprite + estado + direccion + spriteAnimacion + ".png"
	method ataqueRecibido(_personaje){
			self.vida(self.vida() - _personaje.danioPersonaje())
			self.direccion("Danio")
			game.schedule(950,  { self.direccion("") })
			//game.say(self, "FIN: Recibir ataque")
    }

	
    }

const Cavani = new Enemigo(sprite = "Cavani/Cavani", batalla = false ,direccion="izquierda", spriteAnimacion = 0, position = game.at(20,10),realizoAccion=false)
const Barco = new Enemigo(sprite = "Barco/Barco", batalla = false ,direccion="izquierda", spriteAnimacion = 0, position = game.at(24,8),realizoAccion=false)
