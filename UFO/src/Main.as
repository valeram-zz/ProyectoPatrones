package{
	
	import flash.media.Sound;
	import flash.net.URLRequest;
	
	import Pantallas.EventoNavegacion;
	import Pantallas.PantallaJuego;
	import Pantallas.PantallaPrincipal;
	
	import starling.display.Sprite;
	import starling.events.Event;

	public class Main extends Sprite{
		
		private var menu:PantallaPrincipal;
		private var juego:PantallaJuego;
		
		public function Main(){
			addEventListener(Event.ADDED_TO_STAGE, agregadoAPantalla);
			var req:URLRequest = new URLRequest("../media/music/DreamWalk.mp3"); 
			var s:Sound = new Sound(req); 
			s.play(0,2);
		}
		
		private function agregadoAPantalla():void{
			addEventListener(EventoNavegacion.CHANGE_SCREEN,cambiarPantalla);
			
			juego = new PantallaJuego();
			juego.esconder();
			this.addChild(juego);
			
			menu = new PantallaPrincipal();
			addChild(menu);
			menu.iniciar();
			
		}
		
		private function cambiarPantalla(event:EventoNavegacion):void
		{
			switch(event.params.id){
				case "play":
					menu.esconder();
					juego.iniciar();
					break;
			}
		}
		
	}
}