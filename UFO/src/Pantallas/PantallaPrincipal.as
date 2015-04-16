package Pantallas
{
	import Objetos.ObjetoVolador;
	
	import starling.display.Button;
	import starling.display.Sprite;
	import starling.events.Event;
	import Objetos.Ovni;

	public class PantallaPrincipal extends Sprite
	{
		private var btnIniciar:Button;
		private var btnInformacion:Button;
		private var ovni:ObjetoVolador;
		public function PantallaPrincipal(){
			ovni= new Ovni();
			addChild(ovni);
			addEventListener(Event.ENTER_FRAME,moverOvni);
			ovni.y=100;
			ovni.x=200;
			
			
		}
		
		private function moverOvni():void{
			ovni.x++;
			ovni.y++;
		
		}
	}
}