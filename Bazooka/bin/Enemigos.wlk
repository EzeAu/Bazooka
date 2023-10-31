import wollok.game.*
import Batallas.*
import Personajes.*
import MenuBatalla.*
import MenuBatalla.*


class Enemigo inherits Personaje{

	method ataqueRecibido(_personaje){
			self.vida(self.vida() - _personaje.danioPersonaje())
			self.direccion("Danio")
			game.schedule(950,  { self.direccion("") })
			//game.say(self, "FIN: Recibir ataque")
    }
	
	method atacar(_personaje){
		//game.say(self, "Ataco")
		_personaje.vida(_personaje.vida()-(self.danioPersonaje()-_personaje.modificadorDanio()))
		menuBatallaHp.setHp()
		_personaje.modificadorDanio(0)
	}
		
	
}

const Cavani = new Enemigo(sprite = "Cavani/Cavani", batalla = false ,direccion="izquierda", spriteAnimacion = 0, position = game.at(20,10),realizoAccion=false, danioPersonaje=15)
const Barco = new Enemigo(sprite = "Barco/Barco", batalla = false ,direccion="izquierda", spriteAnimacion = 0, position = game.at(24,8),realizoAccion=false, danioPersonaje=15)
