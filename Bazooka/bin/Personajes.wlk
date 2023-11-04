import wollok.game.*
import Batallas.*
import Iniciador.*
import Mapas.*
import MenuBatalla.*
import Enemigos.*
//borrar.
class Personaje{
	var property bloqueado=false
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
	var property modificadorDanio = 0
	var property x1
	var property x2
	var property y1
	var property y2
	
	
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
  			self.animacion(1)
    }
    method avanzarMapa(nuevaPosicion){
    	
    	return nuevaPosicion.x().between(x1,x2) and nuevaPosicion.y().between(y1,y2) and !self.colision(nuevaPosicion) and !bloqueado
    }
    method colision(nuevaPosicion){
    	return mapa.colisiones().contains(nuevaPosicion)
    }

    method animacion(incicial){
        if (spriteAnimacion!=2){
            spriteAnimacion++
        }else{
            spriteAnimacion=incicial//0
        }
    }
    method ataqueBase(enemigo) {
    	
         if(energia!= 0){
            self.danioPersonaje(20)
            game.onTick(100, "pausa2",{
            	spriteAnimacion=0
            	self.animacionAtaque("Ataque")  
            	game.schedule(800, { 
            		enemigo.ataqueRecibido(self)
            		self.realizoAccion(true) 
            		if(contador==3){
    		 		game.removeTickEvent("AnimacionAtaque")
    		 		
    		 		self.direccion("")
    		 		
    		 		contador = 0
    			}self.muerto(enemigo)})
    			game.removeTickEvent("pausa2")
    			
            })
            
        }    
    }
    method ataqueFuerte(enemigo){
        if(energia!= 0){    
            self.danioPersonaje(100)
            game.onTick(100, "pausa2",{
            	spriteAnimacion=0
            	 self.animacionAtaque("Ataque")
            	game.schedule(800, { 
            		enemigo.ataqueRecibido(self)
            		self.realizoAccion(true) 
            		if(contador==3){
    		 		game.removeTickEvent("AnimacionAtaque")
    		 		
    		 		self.direccion("")
    		 		
    		 		contador =0
    		 		
    			}self.muerto(enemigo)})
    			game.removeTickEvent("pausa2")
    			
            })
            self.energia(self.energia()-2)
            self.comprobarEnergia()
            menuBatallaEp.setEp()       
        }
    }
    method animacionAtaque(accion){
 		spriteAnimacion=0
    	self.direccion(accion)
    	game.onTick(200, "AnimacionAtaque", {
    		contador++
    	//	self.animacion(0)
    	})
    }
    method proteger(){
        self.energia(10)
        self.modificadorDanio(10)
        self.direccion("Proteger")
        menuBatallaEp.setEp() 
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
    
    method muerto(_personaje){
    	if(_personaje.vida()<=0){
    		_personaje.direccion("Dead")
    	}	
    }
    
    method magiaFuego(){}
    method magiaCura(){}
}
const Akai = new Personaje(sprite = "Akai/Akai", batalla = false, spriteAnimacion = 0, position = game.at(0,10), enElEquipo=false, realizoAccion=false, contador=0,x1=0,x2=31,y1=2,y2=19)
const Pharsa = new Personaje(sprite = "Pharsa/Pharsa",direccion="Herido", batalla = false, spriteAnimacion = 1, position = game.at(25,10), enElEquipo=false, realizoAccion=false, contador=0,x1=0,x2=31,y1=2,y2=19)
