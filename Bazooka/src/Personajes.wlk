import wollok.game.*
import Batallas.*
import Iniciador.*
import Mapas.*

class Personaje{
	var property mapa = mapa1
    var property sprite 
    var property spriteAnimacion
    var property position = game.center()
    var property batalla = false
    var property estado = "Mapa"
    var property vida = 100 
    var property danioPersonaje = 0
    var property energia = 10
    var property enElEquipo = false
    var property realizoAccion
    var property direccion= "Derecha"
	var property contador=0
	
	
    method image() = sprite + estado + direccion + spriteAnimacion + ".png"
    method cambioEstado(){
    	batalla = !batalla
    	if (estado == "Mapa"){
    		estado = "Batalla"
    	}else{
    		estado = "Mapa"
    	}
    }
    method mover(cambioDireccion){
    		self.direccion(cambioDireccion)
  			self.animacionMapa()
    }
    method avanzarMapa(nuevaPosicion){
    	return nuevaPosicion.x().between(0,31) and nuevaPosicion.y().between(2,19) and !self.colision(nuevaPosicion)
    }
    method colision(nuevaPosicion){
    	return mapa.colisiones().contains(nuevaPosicion)
    }
    method animacionMapa(){
    	 if (spriteAnimacion!=2){
            spriteAnimacion++
        }else{
            spriteAnimacion=1
        }
    }
    method animacion(){
        if (spriteAnimacion!=2){
            spriteAnimacion++
        }else{
            spriteAnimacion=0
        }
    }
    method ataqueBase(enemigo) {
         if(energia!= 0){
             self.danioPersonaje(10)
            game.schedule(100, {
            	spriteAnimacion=0
            	self.animacionAtaque()  
            	game.schedule(800, { enemigo.ataqueRecibido()
            self.realizoAccion(true) 
            if(contador==3){
    		 game.removeTickEvent("AnimacionAtaque")
    		 self.direccion("")
    		 game.onTick(310, "AkaiAnimacion", { Akai.animacion() })
    	}})
            })
            
        }    
    }
    method ataqueFuerte(enemigo){
        if(energia!= 0){    
            self.danioPersonaje(30)
            game.schedule(100, {
            	
            	self.animacionAtaque()  
            	game.schedule(800, { enemigo.ataqueRecibido()
            self.realizoAccion(true) 
            if(contador==3){
    		 game.removeTickEvent("AnimacionAtaque")
    		 self.direccion("")
    		 game.onTick(310, "AkaiAnimacion", { Akai.animacion() })
    	}})
            })
            
            self.energia(self.energia()-2)
            
            self.comprobarEnergia()  
            self.realizoAccion(true)     
        }
    }
    method animacionAtaque(){
 		spriteAnimacion=0
    	self.direccion("Ataque")
    	game.removeTickEvent("AkaiAnimacion")
    	game.onTick(200, "AnimacionAtaque", {contador++
    		self.animacion()
    	})
    }
    method esperar(){
        self.energia(10)
    }
    method comprobarVida(){
        if (self.vida()<0){
            self.vida(0)
        } 
    }
    method comprobarEnergia(){
        if (self.energia()<0){
            self.energia(0)
        }
    }
    method magiaFuego(){}
    method magiaCura(){}
}

const Akai = new Personaje(sprite = "Akai/Akai", batalla = false, spriteAnimacion = 0, position = game.at(0,10), enElEquipo=false, realizoAccion=false, contador=0)
const Pharsa = new Personaje(sprite = "Pharsa/Pharsa", batalla = false, spriteAnimacion = 0, position = game.at(5,8), enElEquipo=false, realizoAccion=false, contador=0)
