package Objetos
{
	import starling.display.Image;

	public class Escudo extends AbstractPowerUp
	{
		public function Escudo()
		{
			super(new Image(Assets.obtenerTextura("escudo")));
		}
	}
}