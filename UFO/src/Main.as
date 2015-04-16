package{
	import flash.display.Sprite;
	
	import starling.core.Starling;
	import Pantallas.PantallaPrincipal;
	
	public class Main extends Sprite{
		
		private var juego:Starling;
		public function Main(){
			juego = new Starling(PantallaPrincipal,stage);
			juego.start();
		}
	}
}