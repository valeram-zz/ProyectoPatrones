package Pantallas
{
	import starling.display.Image;
	import starling.display.Sprite;
	import starling.events.Event;
	
	public class Parallax extends Sprite
	{
		private var image1:Image;
		private var image2:Image;
		
		private var _layer:int;
		private var _parallax:Number;
		
		public function Parallax(layer:int)
		{
			super();
			_layer = layer;
			addEventListener(Event.ADDED_TO_STAGE, agregadoAPantalla);
		}
		
		public function get parallax():Number
		{
			return _parallax;
		}

		public function set parallax(value:Number):void
		{
			_parallax = value;
		}

		private function agregadoAPantalla():void
		{
			removeEventListener(Event.ADDED_TO_STAGE, agregadoAPantalla);
			if(_layer==1){
				image1=new Image(Assets.obtenerTextura("layer1"));
				image2=new Image(Assets.obtenerTextura("layer1"));
			}else{
				image1=new Image(Assets.obtenerTextura("layer1"));
				image2=new Image(Assets.obtenerTextura("layer1"));
			}
			
			image1.x=0;
			image1.y=stage.stageHeight - image1.height;
			
			image2.x = image2.width;
			image2.y = image1.y;
			
			addChild(image1);
			addChild(image2);
		}
		

	}
}