import wollok.game.*
import Batallas.*
import Personajes.*
import Enemigos.*
import MenuBatalla.*
import Mapas.*
import Inicio.*
import Iniciador.*
import Activadores.*
class Dialogos {
	var property position=game.at(0,0)	
	var property image = "invisible0.png"
}
object dialogosMapa1 inherits Dialogos{
	method animar(){
		game.schedule(100,{image="Dialogos/Cavanidialogo1.png"})
		game.schedule(200,{image="Dialogos/AkaiDialogo1.png"})
		game.schedule(300,{image="Dialogos/Barcodialogo1.png"})
		game.schedule(400,{image="Dialogos/Barcodialogo2.png"})
		game.schedule(500,{image="Dialogos/Cavanidialogo2.png"})
	}
}
