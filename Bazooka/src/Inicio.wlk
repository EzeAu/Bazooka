import wollok.game.*
import Mapas.*


object inicio {
		
	var property sprite = "Inicio/inicio"
	var property spriteAnimacion = 1
	var property position = game.origin()
	const talkSong = game.sound("song/talk.mp3")
	const talkSong1 = game.sound("song/talk1.mp3")
	const talkSong2 = game.sound("song/talk2.mp3")
	const mapa1Song = game.sound("song/mapa1.mp3")
	
	method image() =  sprite + spriteAnimacion + ".png"
	
	method detener(){
		mapa1Song.stop()
	}
	method set(){
		//Parametros Ventana
		game.width(1024/32)
  		game.height(768/32)
  		game.cellSize(32)
  		game.title("Bazooka")
  		
		game.addVisual(self)
		game.addVisual(titulo)
		game.addVisual(enter)
		
		
		game.onTick(50, "InicioAnimacion", { self.animacion() })
		
		keyboard.enter().onPressDo{
			
			self.contexto()
			
		}
		
		game.start()
	}
	
	method contexto(){
		game.removeTickEvent("InicioAnimacion")
		sprite = "Contexto/ContextoPricipio"
		spriteAnimacion=1
		talkSong.play()
		game.schedule(2000, {talkSong.pause()})
		game.schedule(8000, {talkSong1.play()}) 
		game.schedule(16000, {talkSong1.pause()}) 
		game.schedule(16000, {talkSong2.play()}) 
		game.schedule(24000, {talkSong2.pause()}) 
		
		game.onTick(8000, "contextoInicio", {
			spriteAnimacion++
			if(spriteAnimacion==4){
				game.removeTickEvent("contextoInicio")
				self.cargando()
			}
		})
	}
	
	method cargando(){
		sprite= "Cargando/cargando"
		spriteAnimacion=3
		game.onTick(300, "inicioAnimacion2" ,{ self.animacion(3) } )
			mapa1Song.play()
			game.schedule(5000, { 
				sprite="invisible0"
				spriteAnimacion=""
				mapa1.iniciar()
				game.removeTickEvent("inicioAnimacion2")
			} )
	}
	
	method animacion(){
        if (spriteAnimacion!=18){
            spriteAnimacion++
        }else{
            spriteAnimacion=1
        }
    }
    
    method animacion(incicial){
        if (spriteAnimacion!=1){
            spriteAnimacion--
        }else{
            spriteAnimacion=incicial//0
        }
    }
}

object titulo{
	var property sprite = "Inicio/titulo"
	var property position = game.origin()
	method image() = sprite + ".png"
}
object enter{
	var property sprite = "Inicio/Enter"
	var property position = game.at(28,1)
	method image() = sprite + ".png"
}
