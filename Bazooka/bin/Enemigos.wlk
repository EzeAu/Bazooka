import wollok.game.*
import Batallas.*
import Personajes.*

class Enemigo inherits Personaje{
   
    
	method ataqueRecibido(){

        self.vida(self.vida()-Akai.danioPersonaje())
    }

    }

const Cavani = new Enemigo(sprite = "Cavani/Cavani", batalla = false ,direccion="izquierda", spriteAnimacion = 0, position = game.at(20,10),realizoAccion=false)
const Barco = new Enemigo(sprite = "Barco/Barco", batalla = false ,direccion="izquierda", spriteAnimacion = 0, position = game.at(24,8),realizoAccion=false)
