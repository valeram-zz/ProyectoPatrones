package Objetos
{
	import starling.display.Image;

	public class Explosion extends AbstractPowerUp
	{
		public function Explosion()
		{
			super(new Image(Assets.obtenerTextura("ammo")));
		}
	}
}