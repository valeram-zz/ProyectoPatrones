package Objetos
{
	import starling.display.Image;

	public class Laser extends AbstractArma
	{
		velocidad:int;
		
		public function Laser(){
			var imagen:Image = new Image(Assets.obtenerTextura("laser"));
			super(imagen);
		}
		
		override public function disparar():void{
			super.disparar();
			trace('piu piu');
		}
	}
}