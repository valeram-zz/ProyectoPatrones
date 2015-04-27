package
{
	import flash.display.Sprite;
	
	import starling.core.Starling;
	import Pantallas.PantallaPrincipal;
	[SWF(frameRate="60",width="1024",height="768", backgroundColor="0x333333")]
	public class UFOWeb extends Sprite
	{
		private var uforia:Starling;
		public function UFOWeb()
		{
			trace();
			uforia = new Starling(Main,stage);
			uforia.start();
		}
	}
}