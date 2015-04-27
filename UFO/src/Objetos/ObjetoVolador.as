package Objetos{
	
	import starling.display.Sprite;

	public class ObjetoVolador extends Sprite{
		
		private var vida:int;
		private var posicionY:int;
		private var velocidad:int;
		private var arma:AbstractArma;
		
		public function ObjetoVolador(){
			super();
		}
		
		public function disparar():void{
			
		}
	}
	
}