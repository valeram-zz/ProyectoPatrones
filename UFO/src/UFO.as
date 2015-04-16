package
{
	import flash.display.Sprite;
	
	import starling.core.Starling;
	import Pantallas.PantallaPrincipal;
	[SWF(frameRate="60",width="1024",height="768", backgroundColor="0x333333")]
	public class UFO extends Sprite
	{
		private var uforia:Starling;
		public function UFO()
		{
			trace();
			uforia = new Starling(PantallaPrincipal,stage);
			uforia.start();
		}
	}
}