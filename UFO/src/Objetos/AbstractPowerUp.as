package Objetos{
	import starling.display.Image;
	import starling.display.Sprite;

	public class AbstractPowerUp extends Sprite{
		private var _imagen:Image;
		private var extra:int;
	
		public function AbstractPowerUp(pimagen:Image){
			_imagen = pimagen;
			_imagen.x = _imagen.texture.width * 0.5;
			_imagen.y = _imagen.texture.width * 0.5;
			addChild(_imagen);
		}
	}
}