import wollok.game.*
import Batallas.*
import Iniciador.*


class Personaje{
    var property sprite 
    var property spriteAnimacion
    var property position = game.center()
    var property batalla = false
    var property estado = "Mapa"
    var property vida = 100 
    var property danioPersonaje = 0
    var property energia = 10
	
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
    method ataqueBase(enemigo) {
         if(energia!= 0){
             self.danioPersonaje(10)
            enemigo.ataqueRecibido()
        }    
    }
    method ataqueFuerte(enemigo){
        if(energia!= 0){    
            self.danioPersonaje(30)
            enemigo.ataqueRecibido()
            
            self.energia(self.energia()-2)
            
            self.comprobarEnergia()       
        }
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

const Akai = new Personaje(sprite = "Akai", batalla = false, spriteAnimacion = 0, position = game.at(5,8))
