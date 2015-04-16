package Objetos{
	
	import starling.display.Image;
	import starling.textures.Texture;

	public class ObjetoVolador extends Image{
		
		private var vida:int;
		private var posicionY:int;
		private var velocidad:int;
		private var arma:AbstractArma;
		
		public function ObjetoVolador(imagen:Texture){
			super(imagen)
		}
	}
}